using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Xml.Serialization;
using TemperatureStation.Shared.Models;
using TemperatureStation.Web.Data;
using TemperatureStation.Web.Extensions.Storage;

namespace TemperatureStation.Web.Calculators.Emhi
{
    [Calculator(Name = "EMHI current weather", Order = 1000, ShowOnChart =true, DisplayLabel = "EMHI t°")]
    public class EmhiCalculator : ICalculator
    {
        private string _city = "";
        private Observations _observation;
        private readonly IFileClient _fileClient;
        private readonly EmhiCalculatorSettings _settings;

        public bool ReturnsReading => true;

        public EmhiCalculator(EmhiCalculatorSettings settings, IFileClient fileClient)
        {
            _settings = settings;
            _fileClient = fileClient;

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
            if(_observation != null && _observation.ObservationAge < _settings.RefreshInterval)
            {
                return;
            }

            var downloaded = false;
            if(!_fileClient.FileExists("cache", "emhi.xml"))
            {
                downloaded = true;
                DownloadObservations();
            }

loadObservations:
            var xml = Encoding.UTF8.GetString(_fileClient.GetFile("cache", "emhi.xml"));
            var xRoot = new XmlRootAttribute { ElementName = "observations" };
            var serializer = new XmlSerializer(typeof(Observations), xRoot);

            using (var reader = new StringReader(xml))
            {
                _observation = (Observations)serializer.Deserialize(reader);
            }

            if(_observation.ObservationAge > _settings.RefreshInterval && !downloaded)
            {
                downloaded = true;
                DownloadObservations();
                goto loadObservations;
            }
        }

        private void DownloadObservations()
        {
            Debug.WriteLine("Downloading observations");

            var xml = "";

            using (var client = new WebClient())
            {
                xml = client.DownloadString(_settings.ObservationsUrl);
            }
            
            var estEncoding = Encoding.GetEncoding(1252);                             
            var utf = Encoding.UTF8;

            xml = utf.GetString(Encoding.Convert(estEncoding, utf, estEncoding.GetBytes(xml)));
            _fileClient.SaveFile("cache", "emhi.xml", Encoding.UTF8.GetBytes(xml));

        }

        public string DisplayValue(double value)
        {
            return value.ToString();
        }

        public void SetParameters(string parameters)
        {
            _city = parameters;
        }
    }
}