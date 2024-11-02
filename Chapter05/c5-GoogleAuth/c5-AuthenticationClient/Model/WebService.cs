using c5_AuthenticationClient.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace c5_AuthenticationClient
{
    public class WebService
    {
        static string baseAddress = "https://YOUR.DEV.TUNNEL.ADDRESS/";
        HttpClient httpClient = new HttpClient() { BaseAddress = new Uri(baseAddress) };
        public static WebService Instance { get; } = new();

        public async Task<BearerTokenInfo> Authenticate(string email, string password)
        {
            return await RequestTokenAsync("login/", new { email, password });
        }
        async Task<BearerTokenInfo> RequestTokenAsync(string url, object postContent)
        {
            HttpResponseMessage response = await httpClient.PostAsync(url,
                                        new StringContent(JsonSerializer.Serialize(postContent), Encoding.UTF8,
                                        "application/json"));
            response.EnsureSuccessStatusCode();
            BearerTokenInfo tokenInfo = await response.Content.ReadFromJsonAsync<BearerTokenInfo>();
            SetAuthHeader(tokenInfo.AccessToken);
            return tokenInfo;
        }
        public void SetAuthHeader(string token)
        {
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }
        public async Task<IEnumerable<User>> GetUsersAsync()
        {
            HttpResponseMessage response = await httpClient.GetAsync("users");
            response.EnsureSuccessStatusCode();
            string json = await response.Content.ReadAsStringAsync();
            return JsonSerializer.Deserialize<List<User>>(json, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });
        }

        public async Task<bool> CanDeleteUsersAsync()
        {
            HttpResponseMessage response = await httpClient.GetAsync("users/candelete");
            response.EnsureSuccessStatusCode();
            string json = await response.Content.ReadAsStringAsync();
            return JsonSerializer.Deserialize<bool>(json);
        }

        public async Task DeleteUserAsync(string email)
        {
            var response = await httpClient.DeleteAsync($"users/{email}");
            response.EnsureSuccessStatusCode();
        }
        public async Task<User> GetCurrentUserAsync()
        {
            HttpResponseMessage response = await httpClient.GetAsync("me");
            response.EnsureSuccessStatusCode();
            string json = await response.Content.ReadAsStringAsync();
            return JsonSerializer.Deserialize<User>(json, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });
        }
        public async Task GoogleAuthAsync()
        {
            WebAuthenticatorResult authResult = await WebAuthenticator.Default.AuthenticateAsync(
                new Uri($"{baseAddress}mauth/google"),
                new Uri("myapp://"));
            BearerTokenInfo tokenInfo = new BearerTokenInfo
            {
                AccessToken = authResult.AccessToken,
                RefreshToken = authResult.RefreshToken,
                ExpiresIn = int.Parse(authResult.Properties["expires_in"]),
                TokenTimestamp = DateTime.UtcNow
            };
            SetAuthHeader(tokenInfo.AccessToken);
        }
    }
}
