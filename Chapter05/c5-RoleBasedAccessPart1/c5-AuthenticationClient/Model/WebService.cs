using System;
using System.Collections.Generic;
using System.Linq;
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
            tokenInfo.TokenTimestamp = DateTime.UtcNow;
            SetAuthHeader(tokenInfo.AccessToken);
            return tokenInfo;
        }
        public void SetAuthHeader(string token)
        {
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }
    }
}
