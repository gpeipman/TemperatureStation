namespace TemperatureStation.Web.Data
{
    public class CalculatorSensorInput
    {
        public int Id { get; set; }

        public Calculator Calculator { get; set; }
        public SensorRole SensorRole { get; set; }
        public string Name { get; set; }
    }
}