using System;
using System.Threading;
using System.Threading.Tasks;
using TemperatureStation.IoT.Service.Logging;
using TemperatureStation.IoT.Service.Measuring;
using TemperatureStation.IoT.Service.Reporting;
using Windows.ApplicationModel.Background;

namespace TemperatureStation.IoT.Service
{
    public sealed class StartupTask : IBackgroundTask
    {
        private bool _isClosing;
        private ISensorsClient _sensorsClient;
        private IReportingClient _reportingClient;
        private ILogger _logger;
        private Timer _timer;
        private BackgroundTaskDeferral _deferral;

        public async void Run(IBackgroundTaskInstance taskInstance)
        {
            _deferral = taskInstance.GetDeferral();
            taskInstance.Canceled += TaskInstance_Canceled;

            _logger = new SyslogLogger();
            _logger.Info("Starting weather station service");

            try
            {
                _sensorsClient = new RinsenOneWireClient();
                _reportingClient = new WebReportingClient(_logger);

                if (_reportingClient.SupportsSensorsUpdate)
                {
                    _logger.Info("Sending sensors info is allowed, updating sensors info");

                    var sensorIds = _sensorsClient.ListSensors();
                    await _reportingClient.UpdateSensors(sensorIds);
                }

                _logger.Info("Initializing sensors reading timer");
                _timer = new Timer(TemperatureCallback, null, 0, 5*60*1000);
                _logger.Info("Timer successfully initialized");
            }
            catch (Exception ex)
            {
                _logger.Critical(ex.ToString());

                _logger.Info("Critical exception occured while reporting sensors, closing");
                _deferral.Complete();
                return;
            }

            _logger.Info("Entering service loop");

            while (!_isClosing)
            {
                Task.Delay(2000).Wait();
            }

            _logger.Info("Exiting service loop");
        }

        private async void TemperatureCallback(object state)
        {            
            if (_isClosing)
            {
                _logger.Info("Timer callback: service is closing");
                return;
            }

            _logger.Info("Timer callback: reading and reporting sensors");

            try
            {
                var readings = _sensorsClient.ReadSensors();
                await _reportingClient.ReportReadings(readings);

                _logger.Info(readings.ToString());
            }
            catch (Exception ex)
            {
                _logger.Critical(ex.ToString());
            }

            _logger.Info("Timer callback: reading and reporting is done");
        }

        private void TaskInstance_Canceled(IBackgroundTaskInstance sender, BackgroundTaskCancellationReason reason)
        {
            _logger.Info("Task was cancelled, reason: "  + reason);

            _isClosing = true;

            if (_timer != null)
            {
                _timer.Dispose();
                _timer = null;
            }

            if (_sensorsClient != null)
            {
                var disposable = _sensorsClient as IDisposable;
                if(disposable != null)
                {
                    disposable.Dispose();
                }
                _sensorsClient = null;
            }

            if (_reportingClient != null)
            {
                var disposable = _reportingClient as IDisposable;
                if (disposable != null)
                {
                    disposable.Dispose();
                }
                _reportingClient = null;
            }

            if (_logger != null)
            {
                var disposable = _logger as IDisposable;
                if (disposable != null)
                {
                    disposable.Dispose();
                }
                _logger = null;
            }

            if (_deferral != null)
            {
                _deferral.Complete();
                _deferral = null;
            }
        }
    }
}
