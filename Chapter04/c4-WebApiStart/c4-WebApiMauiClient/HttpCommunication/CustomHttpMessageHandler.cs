using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection {
    public static partial class CustomHttpMessageHandler {
        static readonly System.Net.Http.HttpMessageHandler PlatformHttpMessageHandler;
        public static System.Net.Http.HttpMessageHandler GetMessageHandler() => PlatformHttpMessageHandler;
    }
}
