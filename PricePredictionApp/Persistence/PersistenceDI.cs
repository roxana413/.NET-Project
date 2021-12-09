using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Persistence.EFCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Application.Interfaces;
using System.Text;
using Persistence.EFCore.Authentication;
using Persistence.EFCore.Users;
using Domain.Entities;
using Persistence.DataImporter;

namespace Persistence
{
    public static class PersistenceDI
    {
        public static void AddPersistence(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<DataContext>(options => options.UseInMemoryDatabase("TestDatabase"));
            services.AddTransient(typeof(IRepository<>), typeof(Repository<>));
            services.AddTransient<IHouseRepository, HouseRepository>();
            services.AddTransient<IUserHistoryRepository, UserHistoryRepository>();

            services.AddIdentity<IdentityUser, IdentityRole>()
                .AddEntityFrameworkStores<DataContext>()
                .AddDefaultTokenProviders();
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.SaveToken = true;
                options.RequireHttpsMetadata = false;
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidAudience = configuration["JWT:ValidAudience"],
                    ValidIssuer = configuration["JWT:ValidIssuer"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["JWT:Secret"]))
                };
            });

            services.AddTransient<IAuthenticationManager, AuthenticationManager>();
            services.AddTransient<IUsersManager, UsersManager>();

        }

        public static async Task CreateRoles(IServiceProvider provider)
        {
            var roleManager = provider.GetRequiredService<RoleManager<IdentityRole>>();
            string[] roleNames = { "Admin", "User" };

            foreach (string roleName in roleNames)
            {
                var roleExists = await roleManager.RoleExistsAsync(roleName);
                if (!roleExists)
                {
                    await roleManager.CreateAsync(new IdentityRole(roleName));
                }
            }
        }

        public static async Task SeedDatabase(IServiceProvider provider)
        {
            var context = provider.GetService<DataContext>();
            context.Database.EnsureCreated();
            var importedHouses = HouseDataImporter.ReadRecords(@"..\Persistence\DataImporter\kc_house_data.csv");
            await context.Houses.AddRangeAsync(importedHouses);
            await context.SaveChangesAsync();
        }
    }
}
