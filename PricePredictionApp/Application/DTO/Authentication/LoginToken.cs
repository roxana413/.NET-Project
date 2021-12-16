namespace Application.DTO.Authentication
{
    public class LoginToken
    {
        public string? Token { get; set; }
        public DateTime ValidTo { get; set; }
    }
}
