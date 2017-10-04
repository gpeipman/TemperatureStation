using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;

namespace TemperatureStation.Web.Calculators.Emhi
{
    [Calculator(Name = "EMHI current weather", Order = 1000)]
    public class EmhiCalculator : ICalculator
    {
        private string _city = "";
        private Observations _observation;

        public bool ReturnsReading => true;

        public EmhiCalculator()
        {
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
        }

        public double Calculate(SensorReadings readings, Measurement measurement)
        {
            LoadObservation();

            var station = _observation.Stations
                                      .Where(x => x.Name.ToLower() == _city.ToLower())
                                      .FirstOrDefault();

            if (station == null)
            {
                return -1000;
            }

            if(!station.AirTemperature.HasValue)
            {
                return -1000;
            }

            return station.AirTemperature.Value;
        }

        private void LoadObservation()
        {
            var path = "c:\\temp\\observations.xml";
            var xRoot = new XmlRootAttribute { ElementName = "observations" };

            var serializer = new XmlSerializer(typeof(Observations), xRoot);
            var estEncoding = Encoding.GetEncoding(1252);
            var xml = File.ReadAllText(path, estEncoding);                              
            var utf = Encoding.UTF8;
            xml = utf.GetString(Encoding.Convert(estEncoding, utf, estEncoding.GetBytes(xml)));

            using (var reader = new StringReader(xml))
            {
                _observation = (Observations)serializer.Deserialize(reader);
            }
        }

        public string DisplayValue(double value)
        {
            return "";   
        }

        public void SetParameters(string parameters)
        {
            _city = parameters;
        }
    }
}