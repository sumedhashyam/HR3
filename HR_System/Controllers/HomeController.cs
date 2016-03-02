using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAO;
using DAL;
using HR_System.Models;
using System.Web.Security;

namespace HR_System.Controllers
{

    // [Authorize(Roles="hr")]
    [Authorize]
    public class HomeController : Controller
    {
        #region Varibles
        dbHRSystemEntities db = new dbHRSystemEntities();
        clsOfficeLocation Officelocation = new clsOfficeLocation();
        clsDepartment objDepartmentRepository = new clsDepartment();
        clsJobType ObjJobType = new clsJobType();
        clsEmployee ObjEmployeRepository = new clsEmployee();
        clsWeekend objWeekendRepository = new clsWeekend();
        #endregion

        Guid CurrentCountryID = MVCUtility.getCurrentCountryID();
        public ActionResult Index()
        {
            return View();
        }

        #region Employee
        [Authorize(Roles = "superadmin,hr")]
        public ActionResult Employee()
        { return View(); }
        public ActionResult EmployeePV()
        {
            clsEmployee emp = new clsEmployee();
            List<Employee> li = emp.getEmployees().Where(a => a.CountryID == CurrentCountryID && a.UserID != null).OrderBy(a => a.FirstNameEn).ToList();

            return PartialView(li);
        }

        #endregion

        #region Add Employee -STEP 1

        public ActionResult AddEmployee()
        {
            return View();

        }

        public ActionResult AddEmployeePV()
        {
            ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();
            ViewBag._Gender = MVCSelectList.getGender();
            ViewBag._Country = MVCSelectList.getCountryDropdown();
            ViewBag.CurrentCountryID = CurrentCountryID;
            return PartialView();

        }

        [HttpPost]
        public ActionResult AddEmployeePV(EmpPersonalDetailModel EmpDetail, FormCollection coll)
        {
            try
            {
                ViewBag.CurrentCountryID = CurrentCountryID;
                bool role_setup = coll["role_setup"].Contains("true");
                bool role_hr = coll["role_hr"].Contains("true");
                bool role_admin = coll["role_admin"].Contains("true");
                MembershipUser newUser = null;

                if (ModelState.IsValid)
                {
                    clsEmployee objemp = new clsEmployee();
                    Employee objAdd = new Employee();
                    // string hasRole = "employee";

                    bool isSuperadmin = MVCUtility.IsSuperAdmin();
                    bool isAdmin = MVCUtility.IsAdmin();
                    MembershipCreateStatus status = new MembershipCreateStatus();
                    if (isSuperadmin || isAdmin)
                    {

                        newUser = Membership.CreateUser(EmpDetail.UserName, EmpDetail.Password, EmpDetail.Email, null, null, true, out status);


                        if (!Roles.RoleExists(SiteRoles.Employee))
                        {
                            Roles.CreateRole(SiteRoles.Employee);
                        }
                        Roles.AddUserToRole(newUser.UserName, SiteRoles.Employee);

                        // Roles Management
                        if (!Roles.RoleExists(SiteRoles.Setup))
                        {
                            Roles.CreateRole(SiteRoles.Setup);
                        }
                        if (!Roles.RoleExists(SiteRoles.HR))
                        {
                            Roles.CreateRole(SiteRoles.HR);
                        }
                        if (!Roles.RoleExists(SiteRoles.Admin))
                        {
                            Roles.CreateRole(SiteRoles.Admin);
                        }
                        if (role_setup)
                        {
                            Roles.AddUserToRole(newUser.UserName, SiteRoles.Setup);
                        }
                        if (role_hr)
                        {
                            Roles.AddUserToRole(newUser.UserName, SiteRoles.HR);
                        }
                        if (role_admin)
                        {
                            Roles.AddUserToRole(newUser.UserName, SiteRoles.Admin);
                        }
                    }

                    objAdd.EmployeeID = Guid.NewGuid();

                    objAdd.FirstNameAr = EmpDetail.FirstNameAr;
                    objAdd.FirstNameEn = EmpDetail.FirstNameEn;
                    objAdd.SecondNameEn = EmpDetail.SecondNameEn != null ? EmpDetail.SecondNameEn : null;
                    objAdd.SecondNameAr = EmpDetail.SecondNameAr != null ? EmpDetail.SecondNameAr : null;
                    objAdd.ThirdNameAr = EmpDetail.ThirdNameAr != null ? EmpDetail.ThirdNameAr : null;
                    objAdd.ThirdNameEn = EmpDetail.ThirdNameEn != null ? EmpDetail.ThirdNameEn : null;
                    objAdd.LastNameAr = EmpDetail.LastNameAr;
                    objAdd.LastNameEn = EmpDetail.LastNameEn;
                    objAdd.DateOfBirth = EmpDetail.DateOfBirth;
                    objAdd.MaritalStatus = EmpDetail.MaritalStatus;
                    objAdd.Gender = EmpDetail.Gender;
                    objAdd.Email = EmpDetail.Email;
                    objAdd.CountryID = (Guid)EmpDetail.country;
                    if (newUser != null)
                    {
                        objAdd.UserID = new Guid(newUser.ProviderUserKey.ToString());
                    }
                    if ((isSuperadmin || isAdmin) && newUser == null)
                    {
                        throw new Exception(GetErrorMessage(status));
                    }
                    if (objemp.addEmployee(objAdd))
                    {
                        //TempData["success"] = "Employee Detail Added";
                        return RedirectToAction("jobDetailPV", new { id = objAdd.EmployeeID });
                    }
                    else
                    {

                        ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();
                        ViewBag.Country = MVCSelectList.getCountryDropdown();
                        // ModelState.AddModelError("", GetErrorMessage(status));
                        MembershipUser u = Membership.GetUser(EmpDetail.Email);
                        if (u != null)
                        {
                            Membership.DeleteUser(u.UserName);
                            string[] arr = Roles.GetRolesForUser(u.UserName);
                            foreach (string role in arr)
                            {
                                Roles.RemoveUserFromRole(u.UserName, role);
                            }

                        }
                        return PartialView(EmpDetail);
                    }
                }
                else
                {
                    ViewBag.Country = MVCSelectList.getCountryDropdown();
                    ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();
                    ViewBag._Gender = MVCSelectList.getGender();
                    return PartialView(EmpDetail);
                }
            }
            catch (Exception ee)
            {
                ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();

                MembershipUser u = Membership.GetUser(EmpDetail.UserName);
                if (u != null)
                {
                    Membership.DeleteUser(u.UserName);
                    string[] arr = Roles.GetRolesForUser(u.UserName);
                    foreach (string role in arr)
                    {
                        Roles.RemoveUserFromRole(u.UserName, role);
                    }

                }
                ModelState.AddModelError("", "Error :" + ee.Message);
                return PartialView(EmpDetail);
            }



        }

        #endregion

        #region Add Employee -STEP 2 (Job Detail)
        public ActionResult jobDetailPV(Guid id)
        {
            clsEmployee objclsEmp = new clsEmployee();
            Employee JobDetail = new Employee();
            JobDetail = objclsEmp.getEmployeesbyId(id);

            ViewBag._OfficeLocation = MVCSelectList.getOfficeLocationDropDownByCountryID(JobDetail.CountryID.Value);
            ViewBag._DepartmentID = MVCSelectList.getAllDepartments();
            ViewBag._JobID = MVCSelectList.getAllJobTypes();
            ViewBag._EmpStatus = MVCSelectList.getEmployeeStatus();
            ViewBag._SupervisorID = MVCSelectList.getAllEmployeeExcludeGiven(id, JobDetail.CountryID.Value);
            ViewBag._AltSupervisorID = MVCSelectList.getAllEmployeeExcludeGiven(id, JobDetail.CountryID.Value);
            ViewBag.EmployeeID = id;


            JobInformationModel obj = new JobInformationModel();
            obj.EmployeeID = id;
            obj.DepartmentID = JobDetail.DepartmentID;
            obj.JobID = JobDetail.JobID;
            obj.EmployeeStatus = JobDetail.EmployeeStatus;
            obj.HireDate = JobDetail.HireDate;
            obj.SupervisorID = JobDetail.SupervisorID;
            obj.OfficeLocationID = JobDetail.OfficeLocationID;
            obj.AlternativeSupervisorID = JobDetail.AlternativeSupervisorID;
            obj.AltFromDate = JobDetail.AltFromDate;
            obj.AltEndDate = JobDetail.AltEndDate;
            obj.UserID = JobDetail.UserID;
            //obj.JobTitle = JobDetail.JobTitle;
            //obj.E_ID = JobDetail.E_ID;
            //obj.InsuranceNumber = JobDetail.InsuranceNumber;
            //obj.SUNSystem = JobDetail.SUNSystem;
            return PartialView(obj);
        }
        [HttpPost]
        public ActionResult jobDetailPV(JobInformationModel JobDetail, FormCollection col)
        {
            clsEmployee objemp = new clsEmployee();
            var id = Guid.Parse(col["id"].ToString());

            Employee obj = new Employee();
            try
            {

                if (ModelState.IsValid)
                {

                    obj.EmployeeID = id;
                    obj.DepartmentID = JobDetail.DepartmentID;
                    obj.JobID = JobDetail.JobID;
                    obj.EmployeeStatus = JobDetail.EmployeeStatus;
                    obj.HireDate = JobDetail.HireDate;
                    obj.SupervisorID = JobDetail.SupervisorID;
                    obj.OfficeLocationID = JobDetail.OfficeLocationID;
                    obj.AlternativeSupervisorID = JobDetail.AlternativeSupervisorID;
                    obj.AltFromDate = JobDetail.AlternativeSupervisorID != null ? JobDetail.AltFromDate : null;
                    obj.AltEndDate = JobDetail.AlternativeSupervisorID != null ? JobDetail.AltEndDate : null;
                    //obj.JobTitle = JobDetail.JobTitle;
                    //obj.E_ID = JobDetail.E_ID;
                    //obj.InsuranceNumber = JobDetail.InsuranceNumber;
                    //obj.SUNSystem = JobDetail.SUNSystem;
                    if (objemp.updateJobdetail(obj))
                    {
                        try
                        {
                            if (JobDetail.UserID != null)
                            {
                                MembershipUser u = Membership.GetUser(JobDetail.UserID);
                                if (u != null)
                                {
                                    u.IsApproved = JobDetail.EmployeeStatus ?? true;
                                    Membership.UpdateUser(u);
                                }
                            }
                        }
                        catch (Exception ee) { }
                        // TempData["success"] = "Detail Added";
                        return RedirectToAction("LeaveDetailPV", new { id = obj.EmployeeID });
                    }
                    else
                    {
                        ModelState.AddModelError("", "Some error occurred while updating job.");
                    }
                }

            }
            catch (Exception ee)
            {
                ModelState.AddModelError("", "Error: " + ee.Message);

            }
            clsEmployee objclsEmp = new clsEmployee();

            Employee _employee = objclsEmp.getEmployeesbyId(id);


            ViewBag._OfficeLocation = MVCSelectList.getOfficeLocationDropDownByCountryID(_employee.CountryID.Value);
            ViewBag._DepartmentID = MVCSelectList.getAllDepartments();
            ViewBag._JobID = MVCSelectList.getAllJobTypes();
            ViewBag._EmpStatus = MVCSelectList.getEmployeeStatus();
            ViewBag._SupervisorID = MVCSelectList.getAllEmployeeExcludeGiven(obj.EmployeeID, _employee.CountryID.Value);
            ViewBag._AltSupervisorID = MVCSelectList.getAllEmployeeExcludeGiven(obj.EmployeeID, _employee.CountryID.Value);
            ViewBag.EmployeeID = id;
            return PartialView(JobDetail);

        }

        #endregion

        #region Add Employee -STEP 3 (Leave Detail)

        public ActionResult LeaveDetailPV(Guid id)
        {
            clsWeekend ObjWeekedRepository = new clsWeekend();
            List<Weekend> ObjWeekend = ObjWeekedRepository.GetWeekendByEmployeeID(id);
            ViewBag.Weekend = ObjWeekend;
            ViewBag.EmployeeID = id;
            return PartialView();
        }
        [HttpPost]
        public ActionResult LeaveDetailPV(FormCollection fc)
        {
            clsLeaveType lvt = new clsLeaveType();
            clsWeekend ObjWeekedRepository = new clsWeekend();
            var id = Guid.Parse(fc["id"].ToString());
            int j = Convert.ToInt32(fc["count"]);
            bool b = false;
            try
            {
                if (ModelState.IsValid)
                {
                    int i;

                    for (i = 1; i < j; i++)
                    {
                        EmployeeLeaf objEmployeeLeaf = new EmployeeLeaf();
                        objEmployeeLeaf.EmployeeLeaveID = Guid.NewGuid();
                        objEmployeeLeaf.EmpId = id;
                        decimal l = 0;
                        try
                        {
                            //l = Convert.ToInt32(fc["noOfLeaves_ " + i].ToString());
                            l = getDeimcalRoundedValue(fc["noOfLeaves_ " + i].ToString());
                        }
                        catch (Exception ee) { }
                        bool LeaveType = fc["leave_" + i].Contains("true");
                        if (LeaveType && l > 0)
                        {
                            objEmployeeLeaf.LeaveTypeID = new Guid(fc["leaveid_" + i]);
                            objEmployeeLeaf.IssuedLeaves = fc["noOfLeaves_ " + i] != null ? l : 0;

                            objEmployeeLeaf.BalanceLeaves = fc["balanceLeave_"+i]!=null?Convert.ToDecimal(fc["balanceLeave_"+i].ToString()):0;
                            objEmployeeLeaf.TotalLeaves = objEmployeeLeaf.IssuedLeaves + objEmployeeLeaf.BalanceLeaves;
                            objEmployeeLeaf.Year = System.DateTime.Now.Year;
                            b = lvt.addEmployeeLeave(objEmployeeLeaf, i);
                        }
                        else
                        {
                            Guid lvtid = new Guid(fc["leaveid_" + i]);
                            Guid emp = objEmployeeLeaf.EmpId;
                            b = lvt.delEmployeeLeave(lvtid, emp);
                        }
                    }
                    if (b)
                    {
                        // weekend code here
                        bool Del = ObjWeekedRepository.DeleteAllWeekendEmployee(id);
                        if (Del)
                        {
                            if (fc["Monday"] != null)
                            {
                                Weekend objWeekend = new Weekend();
                                objWeekend.EmployeeID = id;
                                objWeekend.WeekEndName = "Monday";
                                ObjWeekedRepository.AddNewWeekend(objWeekend);
                            }
                            if (fc["Tuesday"] != null)
                            {
                                Weekend objWeekend = new Weekend();
                                objWeekend.EmployeeID = id;
                                objWeekend.WeekEndName = "Tuesday";
                                ObjWeekedRepository.AddNewWeekend(objWeekend);
                            }
                            if (fc["Wednesday"] != null)
                            {
                                Weekend objWeekend = new Weekend();
                                objWeekend.EmployeeID = id;
                                objWeekend.WeekEndName = "Wednesday";
                                ObjWeekedRepository.AddNewWeekend(objWeekend);
                            }
                            if (fc["Thursday"] != null)
                            {
                                Weekend objWeekend = new Weekend();
                                objWeekend.EmployeeID = id;
                                objWeekend.WeekEndName = "Thursday";
                                ObjWeekedRepository.AddNewWeekend(objWeekend);
                            }
                            if (fc["Friday"] != null)
                            {
                                Weekend objWeekend = new Weekend();
                                objWeekend.EmployeeID = id;
                                objWeekend.WeekEndName = "Friday";
                                ObjWeekedRepository.AddNewWeekend(objWeekend);
                            }
                            if (fc["Saturday"] != null)
                            {
                                Weekend objWeekend = new Weekend();
                                objWeekend.EmployeeID = id;
                                objWeekend.WeekEndName = "Saturday";
                                ObjWeekedRepository.AddNewWeekend(objWeekend);
                            }
                            if (fc["Sunday"] != null)
                            {
                                Weekend objWeekend = new Weekend();
                                objWeekend.EmployeeID = id;
                                objWeekend.WeekEndName = "Sunday";
                                ObjWeekedRepository.AddNewWeekend(objWeekend);
                            }
                        }
                        // TempData["success"] = "Employee saved successfully";
                        return RedirectToAction("ProjectDetailPV", new { id = id });
                        //return Json(new { success = true, msg = "" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        // delete employee
                        // deleteFromMembership(id);
                        return Json(new { success = false, msg = "Error: Some error occured while adding employee" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    // delete employee
                    //deleteFromMembership(id);
                    return Json(new { success = false, msg = "Error: Some error occured while adding employee" }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ee)
            {
                deleteFromMembership(id);
                ModelState.AddModelError("", "Please fill proper values in all fields");
                return Json(new { success = false, msg = "Error:" + ee.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public void deleteFromMembership(Guid id)
        {

            var ruselt = db.Employees.Find(id);
            MembershipUser u = Membership.GetUser(ruselt.Email);
            if (u != null)
            {
                clsEmployee del = new clsEmployee();
                bool c = del.deleteEpmloyee(id);

                Membership.DeleteUser(u.UserName);
                string[] arr = Roles.GetRolesForUser(u.UserName);
                foreach (string role in arr)
                {
                    Roles.RemoveUserFromRole(u.UserName, role);
                }

            }
        }

        #endregion

        #region Add Employee -STEP 4 (Project Detail)

        public ActionResult ProjectDetailPV(Guid id)
        {
            ViewBag.CurrentCountryID = CurrentCountryID;
            ViewBag._JobID = MVCSelectList.getAllJobTypes();
            ViewBag.EmployeeID = id;
            return PartialView();
        }

        [HttpPost]
        public ActionResult ProjectDetailPV(FormCollection fc)
        {

            clsEmployee objEmployee = new clsEmployee();

            var id = Guid.Parse(fc["id"].ToString());
            int j = Convert.ToInt32(fc["count"]);
            bool b = false;
            clsEmployeeProjects objEmployeeProjects = new clsEmployeeProjects();
            if (j <= 1)
            {
                return Json(new { success = true, msg = "" }, JsonRequestBehavior.AllowGet);
            }
            try
            {
                if (objEmployeeProjects.deleteAllProjectsOfAnEmployee(id))
                {
                    int i;
                    for (i = 1; i < j; i++)
                    {
                        EmployeeProject objEmpProject = new EmployeeProject();

                        objEmpProject.EmpProjectsID = Guid.NewGuid();
                        Guid jobID = Guid.Empty;
                        objEmpProject.EmployeeID = id;
                        bool LeaveType = fc["leave_" + i].Contains("true");
                        if (LeaveType)
                        {
                            jobID = new Guid(fc["ddl_" + i].ToString());
                            objEmpProject.FromDate = Convert.ToDateTime(fc["fromDate-" + i].ToString());
                            objEmpProject.ToDate = Convert.ToDateTime(fc["ToDate-" + i].ToString());
                            objEmpProject.JobID = jobID;
                            objEmpProject.IsActive = true;
                            objEmpProject.ProjectID = new Guid(fc["leaveid_" + i]);
                            objEmpProject.Working = fc["working_" + i].Contains("true");
                            b = objEmployee.AssignEmployeeProject(objEmpProject, i);
                            bool c = addnewProjectToTimeSheet(id, new Guid(fc["leaveid_" + i]));
                        }

                    }
                    if (b)
                    {

                        
                        // TempData["success"] = "Employee saved successfully";
                        return Json(new { success = true, msg = "" }, JsonRequestBehavior.AllowGet);
                    }
                }
            }
            catch (Exception ee)
            {
                //deleteFromMembership(id);
                return Json(new { success = false, msg = "Error:" + ee.Message }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { success = false, msg = "Error: Some error occured while adding employee" }, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region Edit Employee
        public ActionResult EditEmployee(Guid id)
        {
            ViewBag.EmployeeID = id;
            ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();
            return View();

        }


        public ActionResult EditEmployeePV(Guid id)
        {
            ViewBag.CurrentCountryID = CurrentCountryID;
            clsEmployee emppv = new clsEmployee();
            ViewBag._Country = MVCSelectList.getCountryDropdown();
            ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();
            ViewBag._Gender = MVCSelectList.getGender();
            Employee EmpDetail = emppv.getEmployeesbyId(id);
            EmpPersonalDetailModel objAdd = new EmpPersonalDetailModel();
            objAdd.FirstNameAr = EmpDetail.FirstNameAr;
            objAdd.FirstNameEn = EmpDetail.FirstNameEn;
            objAdd.SecondNameEn = EmpDetail.SecondNameEn != null ? EmpDetail.SecondNameEn : null;
            objAdd.SecondNameAr = EmpDetail.SecondNameAr != null ? EmpDetail.SecondNameAr : null;
            objAdd.ThirdNameAr = EmpDetail.ThirdNameAr != null ? EmpDetail.ThirdNameAr : null;
            objAdd.ThirdNameEn = EmpDetail.ThirdNameEn != null ? EmpDetail.ThirdNameEn : null;
            objAdd.LastNameAr = EmpDetail.LastNameAr;
            objAdd.LastNameEn = EmpDetail.LastNameEn;
            objAdd.DateOfBirth = EmpDetail.DateOfBirth;
            objAdd.country = (Guid)EmpDetail.CountryID;
            objAdd.MaritalStatus = EmpDetail.MaritalStatus;
            objAdd.Gender = EmpDetail.Gender;
            objAdd.UserID = EmpDetail.UserID;
            objAdd.Email = EmpDetail.Email;
            objAdd.EmployeeID = EmpDetail.EmployeeID;

            bool hrRole = false;
            bool setupRole = false;
            bool adminRole = false;
            try
            {
                MembershipUser u = Membership.GetUser(EmpDetail.UserID);
                if (u != null)
                {
                    hrRole = Roles.IsUserInRole(u.UserName, SiteRoles.HR);
                    setupRole = Roles.IsUserInRole(u.UserName, SiteRoles.Setup);
                    adminRole = Roles.IsUserInRole(u.UserName, SiteRoles.Admin);
                }
            }
            catch (Exception ee) { }
            ViewBag.hrRole = hrRole;
            ViewBag.setupRole = setupRole;
            ViewBag.adminRole = adminRole;
            return PartialView(objAdd);

        }

        [HttpPost]
        public ActionResult EditEmployeePV(EmpPersonalDetailModel EmpDetail, FormCollection coll)
        {
            ViewBag.CurrentCountryID = CurrentCountryID;
            try
            {

                bool role_setup = coll["role_setup"].Contains("true");
                bool role_hr = coll["role_hr"].Contains("true");
                bool role_admin = coll["role_admin"].Contains("true");
                if (ModelState.IsValid)
                {
                    clsEmployee emppv = new clsEmployee();
                    Employee objAdd = new Employee();
                    objAdd.UserID = EmpDetail.UserID;
                    objAdd.EmployeeID = EmpDetail.EmployeeID;
                    objAdd.FirstNameAr = EmpDetail.FirstNameAr != null ? EmpDetail.FirstNameAr : EmpDetail.FirstNameAr;
                    objAdd.FirstNameEn = EmpDetail.FirstNameEn != null ? EmpDetail.FirstNameEn : EmpDetail.FirstNameEn;
                    objAdd.SecondNameEn = EmpDetail.SecondNameEn != null ? EmpDetail.SecondNameEn : null;
                    objAdd.SecondNameAr = EmpDetail.SecondNameAr != null ? EmpDetail.SecondNameAr : null;
                    objAdd.ThirdNameAr = EmpDetail.ThirdNameAr != null ? EmpDetail.ThirdNameAr : null;
                    objAdd.ThirdNameEn = EmpDetail.ThirdNameEn != null ? EmpDetail.ThirdNameEn : null;
                    objAdd.LastNameAr = EmpDetail.LastNameAr != null ? EmpDetail.LastNameAr : EmpDetail.LastNameAr;
                    objAdd.LastNameEn = EmpDetail.LastNameEn != null ? EmpDetail.LastNameEn : EmpDetail.LastNameEn;
                    objAdd.DateOfBirth = EmpDetail.DateOfBirth;
                    objAdd.MaritalStatus = EmpDetail.MaritalStatus;
                    objAdd.Gender = EmpDetail.Gender;
                    if (MVCUtility.IsSuperAdmin())
                    {
                        objAdd.CountryID = EmpDetail.country;
                    }
                    else
                    {
                        objAdd.CountryID = CurrentCountryID;
                    }
                    //objAdd.UserID = EmpDetail.UserID;
                    objAdd.Email = EmpDetail.Email != null ? EmpDetail.Email.ToString() : EmpDetail.Email;


                    // Roles Management
                    if (!Roles.RoleExists(SiteRoles.Setup))
                    {
                        Roles.CreateRole(SiteRoles.Setup);
                    }
                    if (!Roles.RoleExists(SiteRoles.HR))
                    {
                        Roles.CreateRole(SiteRoles.HR);
                    }
                    if (!Roles.RoleExists(SiteRoles.Admin))
                    {
                        Roles.CreateRole(SiteRoles.Admin);
                    }
                    bool isSuperadmin = MVCUtility.IsSuperAdmin();
                    bool isAdmin = MVCUtility.IsAdmin();
                    if (isSuperadmin || isAdmin)
                    {

                        MembershipUser u = Membership.GetUser(EmpDetail.UserID);
                        if (u != null)
                        {
                            u.Email = EmpDetail.Email;
                            Membership.UpdateUser(u);
                            if (Roles.IsUserInRole(u.UserName, SiteRoles.HR))
                                Roles.RemoveUserFromRole(u.UserName, SiteRoles.HR);
                            if (Roles.IsUserInRole(u.UserName, SiteRoles.Setup))
                                Roles.RemoveUserFromRole(u.UserName, SiteRoles.Setup);
                            if (Roles.IsUserInRole(u.UserName, SiteRoles.Admin))
                                Roles.RemoveUserFromRole(u.UserName, SiteRoles.Admin);
                        }
                        if (role_setup)
                        {
                            Roles.AddUserToRole(u.UserName, SiteRoles.Setup);
                        }
                        if (role_hr)
                        {
                            Roles.AddUserToRole(u.UserName, SiteRoles.HR);
                        }
                        if (role_admin)
                        {
                            Roles.AddUserToRole(u.UserName, SiteRoles.Admin);
                        }
                        // End of Role Management
                    }


                    if (emppv.updateEmployedetail(objAdd))
                    {
                        // TempData["success"] = "Employee Detail Updated";
                        return RedirectToAction("jobDetailPV", new { id = objAdd.EmployeeID });
                    }
                }

                ViewBag._Country = MVCSelectList.getCountryDropdown();
                ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();

                bool hrRole = false;
                bool setupRole = false;
                bool adminRole = false;
                MembershipUser u2 = Membership.GetUser(EmpDetail.UserID);
                if (u2 != null)
                {
                    hrRole = Roles.IsUserInRole(u2.UserName, SiteRoles.HR);
                    setupRole = Roles.IsUserInRole(u2.UserName, SiteRoles.Setup);
                    adminRole = Roles.IsUserInRole(u2.UserName, SiteRoles.Admin);
                }
                ViewBag.hrRole = hrRole;
                ViewBag.setupRole = setupRole;
                ViewBag.adminRole = adminRole;
            }
            catch (Exception ee)
            {
                ModelState.AddModelError("", "Employee Detail Not Updated,Some error occured");
            }
            return PartialView(EmpDetail);
        }
        #endregion

        #region Detail Employee

        public ActionResult EmployeeDetail(Guid id)
        {
            ViewBag.EmployeeID = id;
            ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();
            ViewBag._Gender = MVCSelectList.getGender();
            clsEmployee emppv = new clsEmployee();

            //Get employee
            Employee EmpDetail = emppv.getEmployeesbyId(id);
            ViewBag.EmpDetail = EmpDetail;

            //Get employee location name
            ViewBag.LocationName = Officelocation.GetLocationNameByEmployeeID(EmpDetail.OfficeLocationID.Value);

            // get employee supervisor 
            if (EmpDetail.SupervisorID.HasValue)
            {
                Employee ObjSuper = ObjEmployeRepository.getEmployeesbyId(EmpDetail.SupervisorID.Value);
                if (ObjSuper != null)
                    ViewBag.Supervisor = ObjSuper.FirstNameEn + " " + ObjSuper.SecondNameEn + " " + ObjSuper.ThirdNameEn + " " + ObjSuper.LastNameEn;
                else
                    ViewBag.Supervisor = "Not Found";
            }
            // get employee supervisor 

            if (EmpDetail.AlternativeSupervisorID.HasValue)
            {
                Employee ObjSuper = ObjEmployeRepository.getEmployeesbyId(EmpDetail.AlternativeSupervisorID.Value);
                if (ObjSuper != null)
                    ViewBag.AlternativeSupervisor = ObjSuper.FirstNameEn + " " + ObjSuper.SecondNameEn + " " + ObjSuper.ThirdNameEn + " " + ObjSuper.LastNameEn;
                else
                    ViewBag.AlternativeSupervisor = "Not Found";
            }
            return View();

        }
        public ActionResult EmployeeDetailPV(Guid id)
        {
            clsEmployee emppv = new clsEmployee();
            ViewBag._MaritalStatus = MVCSelectList.getMaritalStatus();
            Employee EmpDetail = emppv.getEmployeesbyId(id);
            EmpPersonalDetailModel objAdd = new EmpPersonalDetailModel();
            objAdd.FirstNameAr = EmpDetail.FirstNameAr;
            objAdd.FirstNameEn = EmpDetail.FirstNameEn;
            objAdd.SecondNameEn = EmpDetail.SecondNameEn != null ? EmpDetail.SecondNameEn : null;
            objAdd.SecondNameAr = EmpDetail.SecondNameAr != null ? EmpDetail.SecondNameAr : null;
            objAdd.ThirdNameAr = EmpDetail.ThirdNameAr != null ? EmpDetail.ThirdNameAr : null;
            objAdd.ThirdNameEn = EmpDetail.ThirdNameEn != null ? EmpDetail.ThirdNameEn : null;
            objAdd.LastNameAr = EmpDetail.LastNameAr;
            objAdd.LastNameEn = EmpDetail.LastNameEn;
            objAdd.DateOfBirth = EmpDetail.DateOfBirth;
            objAdd.MaritalStatus = EmpDetail.MaritalStatus;
            objAdd.Gender = EmpDetail.Gender;
            //objAdd.UserID = EmpDetail.UserID;
            objAdd.Email = EmpDetail.Email;
            objAdd.EmployeeID = EmpDetail.EmployeeID;
            return PartialView(objAdd);

        }
        #endregion



        #region  Employee Holidays

        public ActionResult DeleteEmployee(Guid id, Guid userid)
        {
            try
            {
                string username = Membership.GetUser(userid).ToString();
                dbHRSystemEntities db = new DAO.dbHRSystemEntities();
                clsEmployee empObj = new clsEmployee();
                Employee e = db.Employees.Find(id);
                if (empObj.deleteEpmloyee(id))
                {
                    MembershipUser u = Membership.GetUser(username);
                    if (u != null)
                    {
                        Membership.DeleteUser(u.UserName);
                        string[] arr = Roles.GetRolesForUser(u.UserName);
                        foreach (string role in arr)
                        {
                            Roles.RemoveUserFromRole(u.UserName, role);
                        }
                        TempData["success"] = "Employee Record Deleted Successfully";
                        return RedirectToAction("Employee", "Home");
                    }
                    else
                    {
                        TempData["success"] = "Employee Record Deleted Successfully";
                        return RedirectToAction("Employee", "Home");
                    }
                }
                else
                {
                    TempData["error"] = "Employee record not deleted. May be it is used by some another record.";
                    return RedirectToAction("Employee", "Home");
                }
            }
            catch (Exception ee)
            {
                TempData["error"] = "Employee record not deleted. " + ee.Message;
                return RedirectToAction("Employee", "Home");
            }
        }

        public ActionResult EmployeeHolidays(Guid id, string returnUrl)
        {
            clsEmployee objEployee = new clsEmployee();
            Employee employee = objEployee.getEmployeesbyId(id);
            ViewBag.EmployeeID = employee.EmployeeID;
            ViewBag.name = string.Empty;
            if (employee != null)
            {
                ViewBag.name = employee.FirstNameEn;
            }

            DateTime dt = DateTime.Now;
            List<Holiday> holidaysList = db.Holidays.Where(a => a.CountryID == CurrentCountryID && a.HolidayDate.Year>=System.DateTime.Now.Year).ToList();
            ViewBag.holidaysList = holidaysList;

            List<EmployeeHoilday> usersHoliday = new List<EmployeeHoilday>();
            if (employee != null && employee.EmployeeHoildays != null)
            {
                usersHoliday = employee.EmployeeHoildays.Where(a => a.Holiday != null && a.Holiday.HolidayDate.Year == dt.Year).ToList();
            }
            ViewBag.usersHoliday = usersHoliday;
            ViewBag.returnUrl = returnUrl;
            return View(usersHoliday);
        }
        [HttpPost]
        public ActionResult EmployeeHolidays(FormCollection fc)
        {

            clsHoliday Hday = new clsHoliday();

            var id = Guid.Parse(fc["id"].ToString());
            int j = Convert.ToInt32(fc["count"]);
            bool b = false;
            try
            {

                int i;
                if (Hday.deleteAllHolidays(id))
                {
                    for (i = 1; i < j; i++)
                    {
                        EmployeeHoilday objEmployeeHoliday = new EmployeeHoilday();
                        objEmployeeHoliday.EmployeeHoildayID = Guid.NewGuid();
                        objEmployeeHoliday.EmpID = id;
                        bool isHoliday = fc["leave_" + i].Contains("true");
                        if (isHoliday)
                        {
                            objEmployeeHoliday.HolidayID = new Guid(fc["leaveid_" + i]);
                            b = Hday.AssignEmployeeHoliday(objEmployeeHoliday, i);
                        }
                        else
                        {
                            objEmployeeHoliday.HolidayID = new Guid(fc["leaveid_" + i]);
                        }
                    }
                    if (b)
                    {
                        TempData["success"] = "New Holidays assign to Employee";
                        return RedirectToAction("Employee");
                    }
                }
            }
            catch (Exception ee)
            {

            }
            TempData["error"] = "Some unexpected error occured while assigning holidays";
            return RedirectToAction("Employee");


        }
        #endregion

        #region Employee without Membership
        public ActionResult UserAccess()
        { return View(); }
        public ActionResult UserAccessPV()
        {
            clsEmployee emp = new clsEmployee();
            List<Employee> li = emp.getEmployees().Where(a => a.CountryID == CurrentCountryID && a.UserID == null).OrderBy(a => a.FirstNameEn).ToList();
            return PartialView(li);
        }
        public ActionResult CreateUser(Guid id)
        {
            clsEmployee emp = new clsEmployee();
            Employee objEmployee = emp.getEmployees().Where(a => a.EmployeeID == id && a.CountryID == CurrentCountryID).FirstOrDefault();
            createUser u = new createUser();
            u.employeeID = objEmployee.EmployeeID;
            u.Name = "";
            try { u.Name = string.Format("{0} {1}", objEmployee.FirstNameEn, objEmployee.LastNameEn); }
            catch (Exception ee) { }
            u.Email = objEmployee.Email;
            return View(u);
        }
        [HttpPost]
        public ActionResult CreateUser(createUser obj, FormCollection fc)
        {

            if (ModelState.IsValid)
            {
                bool role_setup = fc["role_setup"].Contains("true");
                bool role_hr = fc["role_hr"].Contains("true");
                bool role_admin = fc["role_admin"].Contains("true");
                bool isSuperadmin = MVCUtility.IsSuperAdmin();

                MembershipCreateStatus status = new MembershipCreateStatus();
                MembershipUser newUser = Membership.CreateUser(obj.UserName, obj.Password, obj.Email, null, null, true, out status);

                if (newUser != null)
                {
                    if (!Roles.RoleExists(SiteRoles.Employee))
                    {
                        Roles.CreateRole(SiteRoles.Employee);
                    }
                    Roles.AddUserToRole(newUser.UserName, SiteRoles.Employee);

                    // Roles Management
                    if (!Roles.RoleExists(SiteRoles.Setup))
                    {
                        Roles.CreateRole(SiteRoles.Setup);
                    }
                    if (!Roles.RoleExists(SiteRoles.HR))
                    {
                        Roles.CreateRole(SiteRoles.HR);
                    }
                    if (!Roles.RoleExists(SiteRoles.Admin))
                    {
                        Roles.CreateRole(SiteRoles.Admin);
                    }
                    if (role_setup)
                    {
                        Roles.AddUserToRole(newUser.UserName, SiteRoles.Setup);
                    }
                    if (role_hr)
                    {
                        Roles.AddUserToRole(newUser.UserName, SiteRoles.HR);
                    }
                    if (role_admin)
                    {
                        Roles.AddUserToRole(newUser.UserName, SiteRoles.Admin);
                    }
                    Employee objupdate = new Employee();
                    objupdate.EmployeeID = obj.employeeID;
                    objupdate.UserID = new Guid(newUser.ProviderUserKey.ToString());
                    clsEmployee objClsemployee = new clsEmployee();
                    if (objClsemployee.updateUserAccess(objupdate))
                    {
                        TempData["Success"] = "User Created";
                        return RedirectToAction("UserAccess");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Some unexcepted occured");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Error: " + GetErrorMessage(status));
                }
            }

            clsEmployee emp = new clsEmployee();
            Employee objEmployee = emp.getEmployees().Where(a => a.EmployeeID == obj.employeeID && a.CountryID == CurrentCountryID).FirstOrDefault();

            obj.employeeID = objEmployee.EmployeeID;
            obj.Name = "";
            try { obj.Name = string.Format("{0} {1}", objEmployee.FirstNameEn, objEmployee.LastNameEn); }
            catch (Exception ee) { }
            obj.Email = objEmployee.Email;
            return View(obj);

        }
        #endregion

        public ActionResult EmployeeProjects(Guid id, string returnUrl)
        {
            clsEmployee objEployee = new clsEmployee();
            Employee employee = objEployee.getEmployeesbyId(id);
            ViewBag.name = string.Empty;
            if (employee != null)
            {
                ViewBag.name = employee.FirstNameEn;
            }
            List<EmployeeProject> li = employee.EmployeeProjects.ToList();
            ViewBag.returnUrl = returnUrl;
            return View(li);
        }
        [HttpPost]
        public ActionResult EmployeeProjects(FormCollection fc)
        {

            clsEmployee emp = new clsEmployee();
            var id = Guid.Parse(fc["id"].ToString());
            int j = Convert.ToInt32(fc["count"]);
            bool b = false;
            try
            {
                if (ModelState.IsValid)
                {
                    int i;

                    for (i = 1; i < j; i++)
                    {
                        EmployeeProject objEmployeeProject = new EmployeeProject();
                        objEmployeeProject.EmpProjectsID = Guid.NewGuid();
                        objEmployeeProject.EmployeeID = id;
                        bool isProject = fc["project_" + i].Contains("true");
                        if (isProject)
                        {
                            objEmployeeProject.ProjectID = new Guid(fc["projectId_" + i]);
                            b = emp.AssignEmployeeProject(objEmployeeProject, i);
                        }
                        else
                        {
                            objEmployeeProject.ProjectID = new Guid(fc["projectId_" + i]);

                        }
                    }
                    if (b)
                    {
                        TempData["success"] = "Projects assigned to Employee";

                        return RedirectToAction("Employee");
                    }
                    else
                    {
                        TempData["error"] = "Projects assigned to Employee !Failed.Some Internal Error Occur";
                        return RedirectToAction("Employee");
                    }
                }
                else
                {
                    // delete employee
                    TempData["error"] = "Projects assigned to Employee.!Failed";
                    return RedirectToAction("Employee");
                }
            }
            catch (Exception ee)
            {
                TempData["error"] = "Projects assigned to Employee.!Failed";
                return RedirectToAction("Employee");

            }



        }

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
                    return "username already exists. Please enter a different username name.";

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


        /// <summary>
        /// This method show pending timesheet notification on top of tha page
        /// </summary>
        /// <returns></returns>
        public ActionResult TimesheetNotification()
        {
            try
            {
                bool all = true;

                clsEmployeeTimeSheet objTimesheet = new clsEmployeeTimeSheet();

                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);


                List<TimeSheetMaster> lstTimeSheetMaster = new List<TimeSheetMaster>();
                int dt = DateTime.Now.Year;
                bool isSuperAdmin = MVCUtility.IsSuperAdmin();
                if (isSuperAdmin)
                {
                    lstTimeSheetMaster = objTimesheet.getTimeSheetForSuperadmin(CurrentCountryID);
                }
                else
                {
                    List<TimeSheetMaster> listTimeSheetMasterAsSV = objTimesheet.getTimeSheetBySupervisorID(employee.EmployeeID, CurrentCountryID);
                    List<TimeSheetMaster> lstTimesheetMasterASAlternativeSV = objTimesheet.getTimeSheetByAltSupervisorID(employee.EmployeeID, CurrentCountryID);

                    listTimeSheetMasterAsSV.AddRange(lstTimesheetMasterASAlternativeSV);
                    listTimeSheetMasterAsSV = listTimeSheetMasterAsSV.Distinct().ToList();
                    lstTimeSheetMaster = listTimeSheetMasterAsSV;
                }
                lstTimeSheetMaster = lstTimeSheetMaster.ToList();

                //For pending Only
                lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.IsSubmit == true && a.Status == null).ToList();
                //if (all == false)
                //{
                //    //filter by year
                //    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.Year == year).ToList();
                //}

                return PartialView(lstTimeSheetMaster);
            }
            catch (Exception ee)
            {
                return new EmptyResult();
            }
        }

        public ActionResult LeaveRequestNotification()
        {
            try
            {

                clsEmployeeLeaves clsemployeeLeave = new clsEmployeeLeaves();
                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);

                List<EmployeeLeaveRequest> lstLeaveRequest = new List<EmployeeLeaveRequest>();
                int dt = DateTime.Now.Year;
                List<EmployeeLeaveRequest> RequestList = new List<EmployeeLeaveRequest>();
                if (MVCUtility.IsSuperAdmin())
                {
                    RequestList = clsemployeeLeave.getLeaveRequestForSuperadmin(CurrentCountryID);
                }
                else
                {

                    List<EmployeeLeaveRequest> lstLeaverequestAsSV = clsemployeeLeave.getLeaveRequestBySupervisorID(employee.EmployeeID, CurrentCountryID);
                    List<EmployeeLeaveRequest> lstLeaverequestAsAlternativeSV = clsemployeeLeave.getLeaveRequestByAltSupervisorID(employee.EmployeeID, CurrentCountryID);
                    lstLeaverequestAsSV.AddRange(lstLeaverequestAsAlternativeSV);
                    RequestList = lstLeaverequestAsSV.Distinct().ToList();
                }
                return PartialView(RequestList);

            }
            catch (Exception ex)
            {
                //throw ex;
                return new EmptyResult();
            }
        }

        [Authorize(Roles = "superadmin,admin")]
        public ActionResult ChangeStaffPassword()
        {
            List<SelectListItem> CountryList = MVCSelectList.getAllEmployee(CurrentCountryID);
            ViewBag.CountryList = CountryList;
            return View();
        }

        public ActionResult ChangePassword(Guid employeeID)
        {
            clsEmployee _objEmployee = new clsEmployee();
            Employee emp = _objEmployee.getEmployeesbyId(employeeID);
            string name = string.Format("{0} {1}", emp.FirstNameEn, emp.LastNameEn);
            ViewBag.EmployeeName = name;
            changePassword obj = new changePassword();
            obj.userID = emp.UserID.Value;
            return PartialView(obj);
        }
        [HttpPost]
        public ActionResult ChangePassword(changePassword model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    MembershipUser u = Membership.GetUser(model.userID);
                    if (u != null)
                    {
                        string oldPsssword = u.ResetPassword();
                        u.ChangePassword(oldPsssword, model.NewPassword);
                        return Content("<ul style='clear: both;'><li class='mws-form-message success'>Password changed successfully</li></ul>", "text/html");
                    }
                    else
                    {
                        ModelState.AddModelError("", "User not found");
                    }
                }

            }
            catch (Exception ee)
            {
                ModelState.AddModelError("", "Error :" + ee.Message);
            }

            clsEmployee _objEmployee = new clsEmployee();
            Employee emp = _objEmployee.getEmployeesbyUserId(model.userID);
            string name = string.Format("{0} {1}", emp.FirstNameEn, emp.LastNameEn);
            ViewBag.EmployeeName = name;
            changePassword obj = new changePassword();
            obj.userID = emp.UserID.Value;

            return PartialView(model);
        }

        [Authorize(Roles = "superadmin,admin")]
        public ActionResult UnlockUser()
        {
            List<SelectListItem> employeeList = MVCSelectList.getAllEmployee(CurrentCountryID);
            ViewBag.employeeList = employeeList;
            return View();

        }

        public JsonResult UnlockUserJson(Guid employeeID)
        {
            string message = string.Empty;
            try
            {
                clsEmployee objEmployee = new clsEmployee();
                Employee emp = objEmployee.getEmployeesbyId(employeeID);
                if (emp.UserID.HasValue)
                {
                    MembershipUser u = Membership.GetUser(emp.UserID);
                    if (u != null)
                    {
                        u.UnlockUser();
                        return Json(new { success = true, message = "User unlocked successfully" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        message = "Error: Some unexpected error occured while unlocking user.";
                    }
                }
                else
                {
                    message = "This employee is not registered as user. Can not unlock";
                }
            }
            catch (Exception ee)
            {
                message = "Error :" + ee.Message;
            }
            return Json(new { success = false, message = message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult checkAvailablity(string username)
        {
            MembershipUser u = Membership.GetUser(username);
            if (u != null)
            {
                return Json(new { success = false, msg = "Username already exist" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { success = true, msg = "Username available" }, JsonRequestBehavior.AllowGet);
            }
        }

        public decimal getDeimcalRoundedValue(string value)
        {
            decimal d = 0;
            try
            {

                decimal actualValue = Convert.ToDecimal(value);
                int i = Convert.ToInt32(Math.Floor(actualValue));
                decimal valueInPrecisions = actualValue - Convert.ToDecimal(i);
                if (valueInPrecisions <= 0)
                {
                }
                else
                {
                    valueInPrecisions = valueInPrecisions <= .5m ? .5m : 1m;
                }
                actualValue = i + valueInPrecisions;
                d = actualValue;
            }
            catch (Exception ee) { }
            return d;
        }

        public ActionResult EmployeeRoles()
        {
            List<SelectListItem> employeeList = MVCSelectList.getAllEmployee(CurrentCountryID);
            ViewBag.employeeList = employeeList;
            return View();

        }

        public ActionResult ChangeEmployeeRoles(Guid employeeID)
        {
            clsEmployee _objEmployee = new clsEmployee();
            Employee emp = _objEmployee.getEmployeesbyId(employeeID);
            string name = string.Format("{0} {1}", emp.FirstNameEn, emp.LastNameEn);
            ViewBag.EmployeeName = name;
            ViewBag.employeeID = employeeID;
            bool hrRole = false;
            bool setupRole = false;
            bool adminRole = false;
            try
            {
                MembershipUser u = Membership.GetUser(emp.UserID);
                if (u != null)
                {
                    hrRole = Roles.IsUserInRole(u.UserName, SiteRoles.HR);
                    setupRole = Roles.IsUserInRole(u.UserName, SiteRoles.Setup);
                    adminRole = Roles.IsUserInRole(u.UserName, SiteRoles.Admin);
                }
            }
            catch (Exception ee) { }
            ViewBag.hrRole = hrRole;
            ViewBag.setupRole = setupRole;
            ViewBag.adminRole = adminRole;
            return PartialView();
        }

        [HttpPost]
        public ActionResult ChangeEmployeeRoles(FormCollection coll)
        {

            try
            {
                Guid employeeID = Guid.Empty;
                bool role_setup = coll["role_setup"].Contains("true");
                bool role_hr = coll["role_hr"].Contains("true");
                bool role_admin = coll["role_admin"].Contains("true");
                employeeID = Guid.Parse(coll["employeeID"].ToString());

                clsEmployee _objEmployee = new clsEmployee();
                Employee emp = _objEmployee.getEmployeesbyId(employeeID);
                string name = string.Format("{0} {1}", emp.FirstNameEn, emp.LastNameEn);
                ViewBag.EmployeeName = name;

                if (!Roles.RoleExists(SiteRoles.Setup))
                {
                    Roles.CreateRole(SiteRoles.Setup);
                }
                if (!Roles.RoleExists(SiteRoles.HR))
                {
                    Roles.CreateRole(SiteRoles.HR);
                }
                if (!Roles.RoleExists(SiteRoles.Admin))
                {
                    Roles.CreateRole(SiteRoles.Admin);
                }
                bool isSuperadmin = MVCUtility.IsSuperAdmin();
                bool isAdmin = MVCUtility.IsAdmin();
                if (isSuperadmin || isAdmin)
                {
                    MembershipUser u = Membership.GetUser(emp.UserID);
                    if (u != null)
                    {
                        if (Roles.IsUserInRole(u.UserName, SiteRoles.HR))
                            Roles.RemoveUserFromRole(u.UserName, SiteRoles.HR);
                        if (Roles.IsUserInRole(u.UserName, SiteRoles.Setup))
                            Roles.RemoveUserFromRole(u.UserName, SiteRoles.Setup);
                        if (Roles.IsUserInRole(u.UserName, SiteRoles.Admin))
                            Roles.RemoveUserFromRole(u.UserName, SiteRoles.Admin);

                        if (role_setup)
                        {
                            Roles.AddUserToRole(u.UserName, SiteRoles.Setup);
                        }
                        if (role_hr)
                        {
                            Roles.AddUserToRole(u.UserName, SiteRoles.HR);
                        }
                        if (role_admin)
                        {
                            Roles.AddUserToRole(u.UserName, SiteRoles.Admin);
                        }
                        TempData["success"] = "Roles Changed SuccessFully";
                        return RedirectToAction("EmployeeRoles", "Home");
                    }
                    TempData["error"] = "Error: Some unexpected error occured while Changing Role.";
                    return RedirectToAction("EmployeeRoles", "Home");
                }

            }
            catch (Exception ee)
            {
                ModelState.AddModelError("", "Error :" + ee.Message);
            }
            return PartialView();
        }

        public bool addnewProjectToTimeSheet(Guid uid,Guid pID)
        {
            string year = System.DateTime.Now.Year.ToString();
            var tsid = db.TimeSheetMasters.Where(t => t.Year == year && t.MonthNumber == System.DateTime.Now.Month && t.EmpID == uid && t.Status == "disapproved").FirstOrDefault();
            Guid tsmid = tsid != null ? tsid.TimeSheetMasterID : new Guid();
            TimeSheet workingday = db.TimeSheets.Where(ts => ts.TimeSheetMasterID == tsmid && ts.isOff != 1 && ts.IsWeekend != true).FirstOrDefault();
            TimeSheet isExists = db.TimeSheets.Where(ts => ts.TimeSheetMasterID == tsmid && ts.ProjectID == pID).FirstOrDefault();

            if (isExists == null && workingday!=null)
            {
                TimeSheet newprojectTimesheet = new TimeSheet();
                newprojectTimesheet.TimeSheetID = Guid.NewGuid();
                newprojectTimesheet.TimeSheetMasterID = workingday.TimeSheetMasterID;
                newprojectTimesheet.ProjectID = pID;
                //newprojectTimesheet.Hours = 0;
                newprojectTimesheet.Date = workingday.Date;
                newprojectTimesheet.CreatedDate = System.DateTime.Now.Date;
                db.TimeSheets.Add(newprojectTimesheet);
                db.SaveChanges();
            }
            return true;
        }


    }
}
