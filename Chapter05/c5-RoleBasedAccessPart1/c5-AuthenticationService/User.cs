using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

namespace c5_AuthenticationService
{
    public class User : IdentityUser
    {
        public DateOnly BirthDate { get; set; }
        public string Level { get; set; }
    }
}
