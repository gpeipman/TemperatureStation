using System;
using System.Threading;
using System.Threading.Tasks;
using TemperatureStation.IoT.Service.Measuring;
using Windows.ApplicationModel.Background;

namespace TemperatureStation.IoT.Service
{
    public sealed class StartupTask : IBackgroundTask
    {
        private bool _isClosing;
        private ISensorsClient _sensorsClient;
        private Timer _timer;

        public void Run(IBackgroundTaskInstance taskInstance)
        {
            taskInstance.Canceled += TaskInstance_Canceled;

            try
            {
                _sensorsClient = new RinsenOneWireClient();
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

        private void TemperatureCallback(object state)
        {
            if (_isClosing)
                return;

            try
            {
                var readings = _sensorsClient.ReadSensors();
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

            sender.GetDeferral().Complete();
        }
    }
}
