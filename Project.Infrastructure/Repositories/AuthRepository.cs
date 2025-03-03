using Project.Core.Entities.Business;
using Project.Core.Entities.General;
using Project.Core.Interfaces.IRepositories;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Authentication;

namespace Project.Infrastructure.Repositories
{
    public class AuthRepository : IAuthRepository
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IServiceProvider _serviceProvider;
        public AuthRepository(IAuthenticationService authenticationService,
            IServiceProvider serviceProvider)
        {
           
            _serviceProvider = serviceProvider;
        }


        public async Task<ResponseViewModel<UserViewModel>> Login(string userName, string password)
        {

            if (userName.Equals(password))
            {
                return new ResponseViewModel<UserViewModel>
                {
                    Success = true,
                    Data = new UserViewModel { Id = 1, UserName = userName },
                };
            }
            else
            {
                return new ResponseViewModel<UserViewModel>
                {
                    Success = false
                };
            }
        }

        public async Task Logout()
        {
            //sign out
        }

    }

}
