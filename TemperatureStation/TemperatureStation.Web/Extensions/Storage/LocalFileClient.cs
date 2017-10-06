using System;
using System.IO;

namespace TemperatureStation.Web.Extensions.Storage
{
    public class LocalFileClient : IFileClient
    {
        private readonly string _fileRoot;

        public LocalFileClient()
        {
            _fileRoot = Path.Combine(Directory.GetCurrentDirectory(), "Files");
        }

        public void SaveFile(string storeName, string fileName, byte[] file)
        {
            string path = Path.Combine(_fileRoot, storeName, fileName);
            if (File.Exists(path))
            {
                File.Delete(path);
            }

            Directory.CreateDirectory(Path.Combine(_fileRoot, storeName));

            File.WriteAllBytes(path, file);
        }

        public byte[] GetFile(string storeName, string fileName)
        {
            if (FileExists(storeName, fileName))
            {
                var path = Path.Combine(_fileRoot, storeName, fileName);

                return File.ReadAllBytes(path);
            }

            return null;
        }

        public void Delete(string storeName, string fileName)
        {
            var path = Path.Combine(_fileRoot, storeName, fileName);

            File.Delete(path);
        }

        public bool FileExists(string storeName, string fileName)
        {
            var path = Path.Combine(_fileRoot, storeName, fileName);

            return File.Exists(path);
        }

        public string GetFileUrl(string storeName, string fileName)
        {
            throw new NotImplementedException();
        }
    }
}
