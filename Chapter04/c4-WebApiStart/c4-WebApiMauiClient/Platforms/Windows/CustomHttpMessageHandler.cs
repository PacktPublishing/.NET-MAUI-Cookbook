using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c4_LocalDatabaseConnection
{
    public static partial class CustomHttpMessageHandler
    {
        static CustomHttpMessageHandler()
           => PlatformHttpMessageHandler = new HttpClientHandler();
    }
}
