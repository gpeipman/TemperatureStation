using System;

namespace TemperatureStation.IoT.Service.Logging
{
    internal class FallbackLogger : ILogger
    {
        private readonly ILogger _mainLogger;
        private readonly ILogger _fallbackLogger;

        public FallbackLogger(ILogger mainLogger, ILogger fallbackLogger)
        {
            _mainLogger = mainLogger;
            _fallbackLogger = fallbackLogger;
        }

        public void Debug(string message)
        {
            try
            {
                _mainLogger.Debug(message);
            }
            catch(Exception ex)
            {
                _fallbackLogger.Debug(message);
                _fallbackLogger.Critical(ex.ToString());
            }
        }

        public void Info(string message)
        {
            try
            {
                _mainLogger.Info(message);
            }
            catch (Exception ex)
            {
                _fallbackLogger.Info(message);
                _fallbackLogger.Critical(ex.ToString());
            }
        }

        public void Warn(string message)
        {
            try
            {
                _mainLogger.Warn(message);
            }
            catch (Exception ex)
            {
                _fallbackLogger.Warn(message);
                _fallbackLogger.Critical(ex.ToString());
            }
        }

        public void Error(string message)
        {
            try
            {
                _mainLogger.Error(message);
            }
            catch (Exception ex)
            {
                _fallbackLogger.Error(message);
                _fallbackLogger.Critical(ex.ToString());
            }
        }

        public void Critical(string message)
        {
            try
            {
                _mainLogger.Critical(message);
            }
            catch (Exception ex)
            {
                _fallbackLogger.Critical(message);
                _fallbackLogger.Critical(ex.ToString());
            }
        }
    }
}