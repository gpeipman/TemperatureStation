namespace TemperatureStation.Web.Extensions.Storage
{
    public interface IFileClient
    {
        void SaveFile(string storeName, string fileName, byte[] file);
        byte[] GetFile(string storeName, string fileName);
        void Delete(string storeName, string fileName);
        bool FileExists(string storeName, string fileName);
        string GetFileUrl(string storeName, string fileName);
    }
}
