using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace c5_AuthenticationClient.Model
{
    public class User
    {
        public string Email { get;set; }
        public DateOnly BirthDate { get;set; }
    }
}
