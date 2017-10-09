using System;

namespace TemperatureStation.Web.Data.Queries
{
    public class ReadingsQuery
    {
        public int MeasurementId;
        public DateTime? FromTime;
        public DateTime? ToTime;
    }
}
