using System;
using System.Threading;
using System.Threading.Tasks;
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
        private Timer _timer;
        private BackgroundTaskDeferral _deferral;

        public async void Run(IBackgroundTaskInstance taskInstance)
        {
            _deferral = taskInstance.GetDeferral();
            taskInstance.Canceled += TaskInstance_Canceled;
            
            try
            {
                _sensorsClient = new RinsenOneWireClient();
                _reportingClient = new WebReportingClient();

                var sensorIds = _sensorsClient.ListSensors();
                await _reportingClient.UpdateSensors(sensorIds);

                _timer = new Timer(TemperatureCallback, null, 0, 900000);
            }
            catch (Exception ex)
            {
                // implement logging
                throw ex;
            }

            while (!_isClosing)
            {
                Task.Delay(2000).Wait();
            }
        }

        private async void TemperatureCallback(object state)
        {
            if (_isClosing)
                return;

            try
            {
                var readings = _sensorsClient.ReadSensors();
                await _reportingClient.ReportReadings(readings);
            }
            catch (Exception ex)
            {
                // implement logging
                throw ex;
            }
        }

        private void TaskInstance_Canceled(IBackgroundTaskInstance sender, BackgroundTaskCancellationReason reason)
        {
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

            if (_deferral != null)
            {
                _deferral.Complete();
                _deferral = null;
            }
        }
    }
}
