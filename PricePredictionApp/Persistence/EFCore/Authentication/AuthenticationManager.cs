using Application.DTO.Authentication;
using Application.Enumerations;
using Application.Interfaces;
using Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Persistence.EFCore.Authentication
{
    public class AuthenticationManager : IAuthenticationManager
    {
        private readonly UserManager<IdentityUser> userManager;
        private readonly IConfiguration configuration;
        private readonly DataContext context;
        private readonly IUserHistoryRepository userHistoryRepository;

        public AuthenticationManager(UserManager<IdentityUser> userManager, IConfiguration configuration, DataContext context, IUserHistoryRepository userHistoryRepository)
        {
            this.userManager = userManager;
            this.configuration = configuration;
            this.context = context;
            this.userHistoryRepository = userHistoryRepository;
        }

        public async Task<(AuthenticationStatus Status, string? ErrorMessage)> Register(RegisterModel registerModel)
        {
            var userExists = await userManager.FindByNameAsync(registerModel.UserName);
            if (userExists != null)
            {
                return (AuthenticationStatus.INVALID_USERNAME, "User already exists.");
            }

            IdentityUser newUser = new IdentityUser
            {
                UserName = registerModel.UserName,
                Email = registerModel.Email,
            };

            var result = await userManager.CreateAsync(newUser, registerModel.Password);
            if (!result.Succeeded)
            {
                var errors = new List<string>();
                errors.Add("User creation failed. Errors:");
                foreach (var error in result.Errors)
                {
                    errors.Add(error.Description);
                }
                return (AuthenticationStatus.INVALID_PASSWORD, string.Join("\n", errors));
            }

            await userHistoryRepository.AddAsync(new UserHistory() { UserId = newUser.Id });

            return (AuthenticationStatus.SUCCESS, null);
        }

        public async Task<(AuthenticationStatus Status, LoginToken? Token, string? ErrorMessage)> Login(LoginModel loginModel)
        {
            var user = await userManager.FindByNameAsync(loginModel.UserName);
            if (user == null)
            {
                return (AuthenticationStatus.INVALID_USERNAME, null, "User does not exist.");
            }
            if (!(await userManager.CheckPasswordAsync(user, loginModel.Password)))
            {
                return (AuthenticationStatus.INVALID_PASSWORD, null, "Incorrect password.");
            }


            var userRoles = await userManager.GetRolesAsync(user);
            var authClaims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(Microsoft.IdentityModel.JsonWebTokens.JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            foreach (var userRole in userRoles)
            {
                authClaims.Add(new Claim(ClaimTypes.Role, userRole));
            }

            var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["JWT:Secret"]));
            var expirationDate = DateTime.Now.AddHours(3);

            var token = new JwtSecurityToken(
                issuer: configuration["JWT:ValidIssuer"],
                audience: configuration["JWT:ValidAudience"],
                expires: expirationDate,
                claims: authClaims,
                signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
                );
            var loginToken = new LoginToken() { Token = new JwtSecurityTokenHandler().WriteToken(token), ValidTo = expirationDate };
            return (AuthenticationStatus.SUCCESS, loginToken, null);

        }
    }
}
