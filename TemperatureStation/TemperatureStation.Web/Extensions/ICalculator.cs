using SharedModels = TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Extensions
{
    public interface ICalculator
    {
        float Calculate(SharedModels.SensorReadings readings, Calculator calculatorDefiniton);
        bool NeedsPreviousReading { get; }   
        string[] SensorInputs { get; }     
    }
}
