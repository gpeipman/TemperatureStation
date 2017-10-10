using System;

namespace TemperatureStation.Web.Data.Queries
{
    public class ReadingsQuery
    {
        public int Page { get; set; } = 1;
        public int PageSize { get; set; } = 10;

        public int MeasurementId { get; set; }
        public DateTime? FromTime { get; set; }
        public DateTime? ToTime { get; set; }
        public DateTime? NewerThan { get; set; }
        public bool Ascending { get; set; }
    }
}
