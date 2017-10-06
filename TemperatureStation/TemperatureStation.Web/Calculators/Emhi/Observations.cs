using System;
using System.Xml.Serialization;

namespace TemperatureStation.Web.Calculators.Emhi
{
    [XmlRoot("observations")]
    public class Observations
    {
        [XmlAttribute("timestamp")]
        public long TimeStamp { get; set; }

        [XmlElement("station")]
        public ObservationStation[] Stations { get; set; }

        public DateTime ObservationTime
        {
            get
            {
                return TimeStamp.FromUnixTime();
            }
        }

        public double ObservationAge
        {
            get
            {
                return (DateTime.Now - ObservationTime).TotalMinutes;
            }
        }
    }
}
