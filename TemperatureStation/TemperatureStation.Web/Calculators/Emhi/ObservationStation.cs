using System.Globalization;
using System.Xml.Serialization;

namespace TemperatureStation.Web.Calculators.Emhi
{
    [XmlRoot("station")]
    public class ObservationStation
    {
        [XmlElement("name")]
        public string Name { get; set; }

        [XmlElement("airtemperature")]
        public string AirTemperatureString;

        public double? AirTemperature
        {
            get
            {
                double temp = 0;

                if(!double.TryParse(AirTemperatureString, NumberStyles.Any, CultureInfo.InvariantCulture, out temp))
                {
                    return null;
                }

                return temp;
            }
        }
    }
}
