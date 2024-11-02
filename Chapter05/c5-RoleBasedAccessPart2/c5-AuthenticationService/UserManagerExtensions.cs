using Microsoft.AspNetCore.Identity;

namespace c5_AuthenticationService
{
    public static class UserManagerExtensions
    {
        public static async Task<IResult> CreateUserWithRoleAsync(
            this UserManager<User> userManager,
            RoleManager<IdentityRole> roleManager,
            string email,
            string password,
            DateOnly birthDate,
            string roleName)
        {
            User user = await userManager.FindByEmailAsync(email);
            if (user != null)
                Results.BadRequest("A user with this email already exists");
            user = new User { UserName = email, Email = email, BirthDate = birthDate };
            var result = await userManager.CreateAsync(user, password);
            if (result.Succeeded)
            {
                if (!await roleManager.RoleExistsAsync(roleName))
                {
                    await roleManager.CreateAsync(new IdentityRole(roleName));
                }
                await userManager.AddToRoleAsync(user, roleName);
                return Results.Ok("User registered successfully");
            }
            return Results.BadRequest(result.Errors);
        }
    }
}
