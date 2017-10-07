using System;

namespace TemperatureStation.Web
{
    public static class DateTimeExtensions
    {
        public static DateTime FromUnixTime(this long timestamp)
        {
            var dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            return dtDateTime.AddSeconds(timestamp).ToLocalTime();
        }
    }
}
