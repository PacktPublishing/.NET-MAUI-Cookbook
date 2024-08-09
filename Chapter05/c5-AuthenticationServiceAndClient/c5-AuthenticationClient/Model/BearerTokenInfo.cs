using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c5_AuthenticationClient
{
    public class BearerTokenInfo
    {
        public string AccessToken { get; set; }
        public int ExpiresIn { get; set; }
        public string RefreshToken { get; set; }
        public DateTime? TokenTimestamp { get; set; }
    }
}
