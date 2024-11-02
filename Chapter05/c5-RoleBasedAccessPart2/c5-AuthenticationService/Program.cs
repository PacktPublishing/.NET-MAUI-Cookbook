using c5_AuthenticationService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using System.Security.Claims;


var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "WebAPI API",
        Version = "v1",
    });
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
    {
        Type = SecuritySchemeType.Http,
        Name = "Bearer",
        Scheme = "bearer",
        BearerFormat = "Bearer",
        In = ParameterLocation.Header
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement()
        {
            {
                new OpenApiSecurityScheme() {
                    Reference = new OpenApiReference() {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"}},
                new string[0]
            },
        });
});

builder.Services.AddAuthentication()
    .AddBearerToken(IdentityConstants.BearerScheme);

builder.Services.AddIdentityCore<User>().AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddApiEndpoints()
    .AddDefaultTokenProviders();

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlite(@"Data Source=mydatabase.db"));

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminPolicy", policy => policy.RequireRole("Admin"));
    options.AddPolicy("UserPolicy", policy => policy.RequireRole("User"));
});
var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.MapIdentityApi<User>();

app.MapPost("/registerUser", async (
    string email,
    string password,
    [FromServices] UserManager<User> userManager,
    [FromServices] RoleManager<IdentityRole> roleManager) =>
{
    return await userManager.CreateUserWithRoleAsync(roleManager, email, password, new DateOnly(2000, 1, 1), "User");
});
app.MapDelete("/users/delete/{email}", async (
    string email,
    [FromServices] UserManager<User> userManager,
    [FromServices] IAuthorizationService authorizationService,
    HttpContext httpContext) =>
{
    var user = await userManager.FindByEmailAsync(email);
    if (user == null)
    {
        return Results.NotFound();
    }
    var result = await userManager.DeleteAsync(user);
    if (result.Succeeded)
    {
        return Results.Ok();
    }
    return Results.Problem("Failed to delete the user.");
}).RequireAuthorization("AdminPolicy");

app.MapGet("/users/candelete", async (
    HttpContext httpContext,
    [FromServices] UserManager<User> userManager,
    [FromServices] IAuthorizationService authorizationService) =>
{
    var user = await userManager.GetUserAsync(httpContext.User);
    if (user == null)
    {
        return Results.Ok(false);
    }
    var authResult = await authorizationService.AuthorizeAsync(httpContext.User, "AdminPolicy");
    return Results.Ok(authResult.Succeeded);
});

app.MapGet("/users", async (
    [FromServices] UserManager<User> userManager) =>
{
    var users = await userManager.Users
        .Select(u => new
        {
            u.Email,
            u.BirthDate
        })
        .ToListAsync();

    return Results.Ok(users);
}).RequireAuthorization();

app.MapGet("/me", async (ClaimsPrincipal principal, UserManager<User> userManager) =>
{
    string userEmail = principal.Claims.First(c => c.Type == ClaimTypes.Email).Value;
    User currentUser = await userManager.FindByEmailAsync(userEmail);
    return Results.Ok(new
    {
        currentUser.Email,
        currentUser.BirthDate
    });
}).RequireAuthorization();

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var dbContext = services.GetRequiredService<ApplicationDbContext>();
    dbContext.Database.EnsureCreated();
    var userManager = services.GetRequiredService<UserManager<User>>();
    var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
    await userManager.CreateUserWithRoleAsync(
        roleManager,
        "admin@cookbook.com",
        "123Password123!",
        new DateOnly(1991,4,20),
        "Admin");
    for (int i = 1; i < 10; i++)
    {
        await userManager.CreateUserWithRoleAsync(
            roleManager,
            $"user{i}@cookbook.com",
            "123Password123!",
            new DateOnly(2000, 1, i),
            "User");
    }
}

app.Run();

