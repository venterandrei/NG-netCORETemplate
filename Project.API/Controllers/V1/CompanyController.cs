using Asp.Versioning;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Project.API.Helpers;
using Project.Core.Common;
using Project.Core.Entities.Business;
using Project.Core.Entities.General;
using Project.Core.Interfaces.IServices;

namespace Project.API.Controllers.V1
{
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class CompanyController : ControllerBase
    {
        private readonly ILogger<CompanyController> _logger;
        private readonly ICompanyService _companyService;
        private readonly IMemoryCache _memoryCache;

        public CompanyController(ILogger<CompanyController> logger, ICompanyService companyService, IMemoryCache memoryCache)
        {
            _logger = logger;
            _companyService = companyService;
            _memoryCache = memoryCache; 
        }

        [HttpGet]
        //[AllowAnonymous]
        public async Task<IActionResult> Get(CancellationToken cancellationToken)
        {
            try
            {
                var companys = await _companyService.GetAll(cancellationToken);

                var response = new ResponseViewModel<IEnumerable<CompanyViewModel>>
                {
                    Success = true,
                    Message = "Companys retrieved successfully",
                    Data = companys
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "An error occurred while retrieving companys");

                var errorResponse = new ResponseViewModel<IEnumerable<CompanyViewModel>>
                {
                    Success = false,
                    Message = "Error retrieving companys",
                    Error = new ErrorViewModel
                    {
                        Code = "ERROR_CODE",
                        Message = ex.Message
                    }
                };

                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
        }

        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<IActionResult> Get(int id, CancellationToken cancellationToken)
        {
            try
            {
                var company = new CompanyViewModel();

                // Attempt to retrieve the company from the cache
                if (_memoryCache.TryGetValue($"Company_{id}", out CompanyViewModel cachedCompany))
                {
                    company = cachedCompany;
                }
                else
                {
                    // If not found in cache, fetch the company from the data source
                    company = await _companyService.GetById(id, cancellationToken);

                    if (company != null)
                    {
                        // Cache the company with an expiration time of 10 minutes
                        _memoryCache.Set($"Company_{id}", company, TimeSpan.FromMinutes(10));
                    }
                }

                var response = new ResponseViewModel<CompanyViewModel>
                {
                    Success = true,
                    Message = "Company retrieved successfully",
                    Data = company
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                if (ex.Message == "No data found")
                {
                    return StatusCode(StatusCodes.Status404NotFound, new ResponseViewModel<CompanyViewModel>
                    {
                        Success = false,
                        Message = "Company not found",
                        Error = new ErrorViewModel
                        {
                            Code = "NOT_FOUND",
                            Message = "Company not found"
                        }
                    });
                }

                _logger.LogError(ex, $"An error occurred while retrieving the company");

                var errorResponse = new ResponseViewModel<CompanyViewModel>
                {
                    Success = false,
                    Message = "Error retrieving company",
                    Error = new ErrorViewModel
                    {
                        Code = "ERROR_CODE",
                        Message = ex.Message
                    }
                };

                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
        }

        [HttpGet("lsin/{lsin}")]
        [AllowAnonymous]
        public async Task<IActionResult> Get(string lsin, CancellationToken cancellationToken)
        {
            try
            {
                var companys = await _companyService.GetByLsin(lsin, cancellationToken);

                var response = new ResponseViewModel<IEnumerable<CompanyViewModel>>
                {
                    Success = true,
                    Message = "lsin retrieved successfully",
                    Data = companys
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "An error occurred while retrieving companys");

                var errorResponse = new ResponseViewModel<IEnumerable<CompanyViewModel>>
                {
                    Success = false,
                    Message = "Error retrieving companys",
                    Error = new ErrorViewModel
                    {
                        Code = "ERROR_CODE",
                        Message = ex.Message
                    }
                };

                return StatusCode(StatusCodes.Status500InternalServerError, errorResponse);
            }
            
        }


        [HttpPost]
        public async Task<IActionResult> Create(CompanyCreateViewModel model, CancellationToken cancellationToken)
        {
            if (ModelState.IsValid)
            {
                string message = "";
                if (await _companyService.IsExists("Name", model.Name, cancellationToken))
                {
                    message = $"The company name- '{model.Name}' already exists";
                    return StatusCode(StatusCodes.Status400BadRequest, new ResponseViewModel<CompanyViewModel>
                    {
                        Success = false,
                        Message = message,
                        Error = new ErrorViewModel
                        {
                            Code = "DUPLICATE_NAME",
                            Message = message
                        }
                    });
                }

                if (await _companyService.IsExists("Isin", model.Isin, cancellationToken))
                {
                    message = $"The company Isin- '{model.Isin}' already exists";
                    return StatusCode(StatusCodes.Status400BadRequest, new ResponseViewModel<CompanyViewModel>
                    {
                        Success = false,
                        Message = message,
                        Error = new ErrorViewModel
                        {
                            Code = "DUPLICATE_CODE",
                            Message = message
                        }
                    });
                }

                try
                {
                    var data = await _companyService.Create(model, cancellationToken);

                    var response = new ResponseViewModel<CompanyViewModel>
                    {
                        Success = true,
                        Message = "Company created successfully",
                        Data = data
                    };

                    return Ok(response);
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, $"An error occurred while adding the company");
                    message = $"An error occurred while adding the company- " + ex.Message;

                    return StatusCode(StatusCodes.Status500InternalServerError, new ResponseViewModel<CompanyViewModel>
                    {
                        Success = false,
                        Message = message,
                        Error = new ErrorViewModel
                        {
                            Code = "ADD_ROLE_ERROR",
                            Message = message
                        }
                    });
                }
            }

            return StatusCode(StatusCodes.Status400BadRequest, new ResponseViewModel<CompanyViewModel>
            {
                Success = false,
                Message = "Invalid input",
                Error = new ErrorViewModel
                {
                    Code = "INPUT_VALIDATION_ERROR",
                    Message = ModelStateHelper.GetErrors(ModelState)
                }
            });
        }

        [HttpPut]
        public async Task<IActionResult> Edit(CompanyUpdateViewModel model, CancellationToken cancellationToken)
        {
            if (ModelState.IsValid)
            {
                string message = "";
                if (await _companyService.IsExistsForUpdate(model.Id, "Name", model.Name, cancellationToken))
                {
                    message = $"The company name- '{model.Name}' already exists";
                    return StatusCode(StatusCodes.Status400BadRequest, new ResponseViewModel
                    {
                        Success = false,
                        Message = message,
                        Error = new ErrorViewModel
                        {
                            Code = "DUPLICATE_NAME",
                            Message = message
                        }
                    });
                }

                if (await _companyService.IsExistsForUpdate(model.Id, "Isin", model.Isin, cancellationToken))
                {
                    message = $"The company code- '{model.Isin}' already exists";
                    return StatusCode(StatusCodes.Status400BadRequest, new ResponseViewModel
                    {
                        Success = false,
                        Message = message,
                        Error = new ErrorViewModel
                        {
                            Code = "DUPLICATE_CODE",
                            Message = message
                        }
                    });
                }

                try
                {
                    await _companyService.Update(model, cancellationToken);

                    // Remove data from cache by key
                    _memoryCache.Remove($"Company_{model.Id}");

                    var response = new ResponseViewModel
                    {
                        Success = true,
                        Message = "Company updated successfully"
                    };

                    return Ok(response);
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, $"An error occurred while updating the company");
                    message = $"An error occurred while updating the company- " + ex.Message;

                    return StatusCode(StatusCodes.Status500InternalServerError, new ResponseViewModel
                    {
                        Success = false,
                        Message = message,
                        Error = new ErrorViewModel
                        {
                            Code = "UPDATE_ROLE_ERROR",
                            Message = message
                        }
                    });
                }
            }

            return StatusCode(StatusCodes.Status400BadRequest, new ResponseViewModel
            {
                Success = false,
                Message = "Invalid input",
                Error = new ErrorViewModel
                {
                    Code = "INPUT_VALIDATION_ERROR",
                    Message = ModelStateHelper.GetErrors(ModelState)
                }
            });
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id, CancellationToken cancellationToken)
        {
            try
            {
                await _companyService.Delete(id, cancellationToken);
                
                // Remove data from cache by key
                _memoryCache.Remove($"Company_{id}");

                var response = new ResponseViewModel
                {
                    Success = true,
                    Message = "Company deleted successfully"
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                if (ex.Message == "No data found")
                {
                    return StatusCode(StatusCodes.Status404NotFound, new ResponseViewModel
                    {
                        Success = false,
                        Message = "Company not found",
                        Error = new ErrorViewModel
                        {
                            Code = "NOT_FOUND",
                            Message = "Company not found"
                        }
                    });
                }

                _logger.LogError(ex, "An error occurred while deleting the company");

                return StatusCode(StatusCodes.Status500InternalServerError, new ResponseViewModel
                {
                    Success = false,
                    Message = "Error deleting the company",
                    Error = new ErrorViewModel
                    {
                        Code = "DELETE_ROLE_ERROR",
                        Message = ex.Message
                    }
                });

            }
        }
    }

}
