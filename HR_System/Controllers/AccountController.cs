using System;
using System.Data;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using HR_System.Models;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using HR_System.Models;
using System.Net.Mail;
using DAL;
using DAO;
using BusinessLogics;


namespace HR_System.Controllers
{
    [HandleError]
    public class AccountController : Controller
    {

        dbHRSystemEntities db = new dbHRSystemEntities();
        clsEmployee objclsEmployee = new clsEmployee();
        clsOfficeLocation objclsOfficeLocation = new clsOfficeLocation();
        //
        // GET: /Account/LogOn

        public ActionResult LogOn()
        {

            try
            {
                
                if (Request.Cookies["country"] != null)
                {
                    Response.Cookies["country"].Expires = DateTime.Now.AddDays(-1);
                }
               
                ViewBag._Country = MVCSelectList.getCountryDropdown();
                return View();
            }
            catch (Exception ex)
            {
                TempData["error"] = "some error occurred.";
                return View();
            }
        }

        //
        // POST: /Account/LogOn

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            try
            {
                ViewBag._Country = MVCSelectList.getCountryDropdown();
                bool UseCountry = Convert.ToBoolean(System.Web.Configuration.WebConfigurationManager.AppSettings["UseCountry"].ToString());

                string defaultCountry = System.Web.Configuration.WebConfigurationManager.AppSettings["defaultCountry"].ToString();
                string MasterDefaultcountry = System.Web.Configuration.WebConfigurationManager.AppSettings["MasterDefaultcountry"].ToString();
                CountryOffice cntry = db.CountryOffices.Where(a => a.CountryName.Trim().ToLower() == defaultCountry.Trim().ToLower()).FirstOrDefault();
                CountryOffice masterCntry = db.CountryOffices.Where(a => a.CountryName.Trim().ToLower() == MasterDefaultcountry.Trim().ToLower()).FirstOrDefault();

                string errorMessgae = "";
                if (ModelState.IsValid)
                {
                    bool isOkay = false;
                    if (Membership.ValidateUser(model.UserName, model.Password))
                    {

                        if (MVCUtility.IsSuperAdmin(model.UserName))
                        {
                            if (UseCountry)
                            {
                                // model.country = model.country;
                                isOkay = true;
                            }
                            else
                            {
                                if (masterCntry != null)
                                {
                                    model.country = masterCntry.CountryOfficeID;
                                    isOkay = true;
                                }
                                else
                                {
                                    errorMessgae = "Default country not found in database";
                                }
                            }

                        }
                        else
                        {
                            MembershipUser u = Membership.GetUser(model.UserName);
                            Guid userGuid = (Guid)u.ProviderUserKey;
                            Employee empid = objclsEmployee.getEmployeesbyUserId(userGuid);
                            if (UseCountry)
                            {
                                if (empid.CountryID == model.country)
                                {
                                    isOkay = true;
                                }
                                else
                                {
                                    errorMessgae = "Access denied for selected country";
                                }
                            }
                            else
                            {
                                if (cntry != null)
                                {
                                    if (empid.CountryID == cntry.CountryOfficeID)
                                    {
                                        model.country = cntry.CountryOfficeID;
                                        isOkay = true;
                                    }
                                    else
                                    {
                                        errorMessgae = "Access denied for default country";
                                    }
                                }
                                else
                                {
                                    errorMessgae = "Default country not found in database";
                                }
                            }
                        }
                        if (isOkay)
                        {

                            string cookieeName = "country";
                            if (MVCUtility.hasCookie(cookieeName))
                            {
                                Request.Cookies.Remove("country");
                            }
                            HttpCookie country = new HttpCookie("country", model.country.ToString());
                            country.Expires = DateTime.Now.AddDays(20);
                            Response.Cookies.Add(country);

                             MembershipUser u = Membership.GetUser(model.UserName);
                            Guid userGuid = (Guid)u.ProviderUserKey;
                            Employee emp = db.Employees.Where(a => a.UserID == userGuid).FirstOrDefault();
                            #region Login Superadmin
                            if (MVCUtility.IsSuperAdmin(model.UserName))
                            {
                                FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                                return RedirectToAction("Index", "Home");
                            }
                            #endregion

                            #region login User
                            if (emp != null)
                            {
                                if (emp.IsTerminated != true && emp.EmployeeStatus == true)
                                {
                                    if (MVCUtility.willAnnual_Increase() && MVCUtility.IsCompletedOneYear(emp.HireDate))
                                    {
                                        if (!MVCUtility.IsServiceBonusIncrementedForThisYesar(emp.EmployeeID, MVCUtility.IncrementServiceBonusForYear(emp.HireDate)))
                                        {
                                            MVCUtility.IncrementServiceBonusForThisYesar(emp.EmployeeID, emp.HireDate);
                                        }
                                    }
                                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                                    return RedirectToAction("Index", "Home");
                                   
                                }
                                else
                                {
                                    if ( emp.IsTerminated !=null && emp.IsTerminated == true)
                                    {
                                        if (emp.EmployeeStatus!=null && emp.EmployeeStatus != true)
                                        {
                                            ModelState.AddModelError("", "  Can not login. Your Employee status is inactive. & You are Terminated");
                                        }
                                        else
                                        {
                                            ModelState.AddModelError("", "  Can not login. You are Terminated");
                                        }

                                    }
                                    else
                                    {
                                        ModelState.AddModelError("", "   Can not login. Your Employee status is inactive.");
                                    }


                                }
                            }
                            #endregion


                        }
                        else
                        {
                            ModelState.AddModelError("", errorMessgae);
                        }

                    }
                    else
                    {
                        MembershipUser u = Membership.GetUser(model.UserName);
                        if (u != null && u.IsApproved == false)
                        {
                            ModelState.AddModelError("", "  Can not login. Your account is inactive.");
                        }
                        else if (u != null && u.IsLockedOut == true)
                        {
                            ModelState.AddModelError("", "  Can not login. Your account has been locked.");
                        }
                        else
                        {
                            ModelState.AddModelError("", "Username or password provided is incorrect.");
                        }
                    }

                }
                return View(model);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", (ex.InnerException!=null?ex.InnerException.Message.ToString():ex.Message));
                return View(model);
            }

        }

        //
        // GET: /Account/LogOff

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("LogOn", "Account");
        }

        //
        // GET: /Account/Register

        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.UserName, model.Password, model.Email, null, null, true, null, out createStatus);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePassword

        [Authorize]
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Account/ChangePassword

        [Authorize]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {

                // ChangePassword will throw an exception rather
                // than return false in certain failure scenarios.
                bool changePasswordSucceeded;
                try
                {
                    MembershipUser currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
                    if (currentUser.IsLockedOut == false)
                    {
                        changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);

                    }
                    else
                    {

                        TempData["error"] = "User is blocked.";
                        changePasswordSucceeded = false;
                    }
                }
                catch (Exception)
                {
                    changePasswordSucceeded = false;
                }

                if (changePasswordSucceeded)
                {

                    TempData["success"] = "Password changed successfully.";

                }
                else
                {
                    TempData["error"] = "The current password is incorrect or the new password is invalid.";
                    //ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                }
            }


            // If we got this far, something failed, redisplay form
            return View();
        }

        //
        // GET: /Account/ChangePasswordSuccess

        public ActionResult ResetPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ResetPassword(ResetPasswordModel model)
        {

            sendMail send = new sendMail();
            if (ModelState.IsValid)
            {
                MembershipUser user = Membership.GetUser(model.UserName);
                if (user != null)
                {
                    if (user.IsLockedOut == false)
                    {
                        string username = user.UserName;
                        string password = user.ResetPassword();
                        string to = "yawh02003@yahoo.com";
                        string EmailTitle = "Password Reset Confirmation";
                        string subjects = "Password Reset Confirmation";
                        string Message = "<table><tr><th>Your password have been reset</th></tr><tr><td>Username   :" + username.ToString() + "</td></tr><tr><td>Password    :" + password.ToString() + "</td></tr></table>";
                        string SiteUrl = "";
                        string SiteLogUrl = WebConfigurationManager.AppSettings["SiteLogUrl"];
                        string WebsiteUrl = WebConfigurationManager.AppSettings["WebsiteUrl"]; ;
                        string websitename = "HR Management System";
                        string html = sendMail.getMailHTML(websitename, EmailTitle, username, Message, SiteUrl, SiteLogUrl, WebsiteUrl).ToString();
                        bool mail = send.MailSender(to, html, subjects);

                        if (mail == true)
                        {
                            TempData["success"] = "Mail for password reset has been sent to your email id " + to.ToString();
                        }
                        else
                        {
                            TempData["error"] = "Some error occurred. E-Mail was not sent.";
                        }
                    }
                    else
                    {
                        TempData["error"] = "User is blocked.";
                    }
                }
                else
                {

                    TempData["error"] = "User does not exist.";
                }
            }

            else
            {
                TempData["error"] = "Please give valid username.";
            }

            return View(model);
        }

        #region Status Codes
        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion



        #region Common Function
        public void setViewData(string key, object value)
        {
            ViewData[key] = value;
        }
        public string GetErrorMessage(MembershipCreateStatus status)
        {
            switch (status)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion

        public ActionResult AccessDenied()
        {
            return View();
        }


    }
}
