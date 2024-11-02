using Microsoft.AspNetCore.Identity;

namespace c5_AuthenticationService
{
    public class User : IdentityUser
    {
        public DateOnly BirthDate { get; set; }
    }
}
