using Project.Core.Entities.Business;
using Project.Core.Entities.General;
using Project.Core.Interfaces.IRepositories;
using Project.Core.Interfaces.IServices;
using Project.Infrastructure.Data;
using Microsoft.AspNetCore.Identity;

namespace Project.Infrastructure.Repositories
{
    public class UserRepository : BaseRepository<User>, IUserRepository
    {
        private readonly UserManager<User> _userManager;
        private readonly IUserContext _userContext;

        public UserRepository(
            ApplicationDbContext dbContext,
            UserManager<User> userManager,
            IUserContext userContext
            ) : base(dbContext)
        {
            _userManager = userManager;
            _userContext = userContext;
        }

        public async Task<IdentityResult> Create(UserCreateViewModel model)
        {
            var user = new User
            {
                FullName = model.FullName,
                UserName = model.UserName,
                Email = model.Email,
                IsActive = true,
                RoleId = model.RoleId,
                EntryDate = DateTime.Now,
                EntryBy = Convert.ToInt32(_userContext.UserId)
            };
            var result = await _userManager.CreateAsync(user, model.Password);

            return result;
        }

        public async Task<IdentityResult> Update(UserUpdateViewModel model)
        {
            var user = await _userManager.FindByIdAsync(model.Id.ToString());

            if (user == null)
            {
                return IdentityResult.Failed(new IdentityError { Description = "User not found." });
            }

            

            // Update the user properties
            user.FullName = model.FullName;
            user.UserName = model.UserName;
            user.Email = model.Email;
            user.RoleId = model.RoleId;
            user.UpdatedDate = DateTime.Now;
            user.UpdatedBy = Convert.ToInt32(_userContext.UserId);

            var result = await _userManager.UpdateAsync(user);
            return result;
        }

        public async Task<IdentityResult> ResetPassword(ResetPasswordViewModel model)
        {
            var user = await _userManager.FindByNameAsync(model.UserName);

            if (user == null)
            {
                return IdentityResult.Failed(new IdentityError { Description = "User not found." });
            }

            var resetToken = await _userManager.GeneratePasswordResetTokenAsync(user);
            var result = await _userManager.ResetPasswordAsync(user, resetToken, model.NewPassword);

            return result;
        }
    }
}
