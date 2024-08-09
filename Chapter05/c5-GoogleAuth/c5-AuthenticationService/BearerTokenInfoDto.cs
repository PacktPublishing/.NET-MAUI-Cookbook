namespace c5_AuthenticationService
{
    public class BearerTokenInfoDto
    {
        public string AccessToken { get; set; }
        public int ExpiresIn { get; set; }
        public string RefreshToken { get; set; }
    }
}
