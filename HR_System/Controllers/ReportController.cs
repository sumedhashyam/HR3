using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Security;
using DAL;
using DAO;
using HR_System.Models;

namespace HR_System.Controllers
{
    [Authorize]
    public class ReportController : Controller
    {
        #region Deceleration : Object & Variable 
        //
        // GET: /Report/ 
        Guid CurrentCountryID = MVCUtility.getCurrentCountryID();
        clsEmployee _objEmployee = new clsEmployee();
        clsProject _objProject = new clsProject();
        clsEmployeeProjects _objEmployeeProjects = new clsEmployeeProjects();
        clsTimesheet _objTimesheet = new clsTimesheet();
        clsEmployeeLeaves _objEmployeeLeaves = new clsEmployeeLeaves();
        LeaveSummary _objLeaveSummary = new LeaveSummary();
        clsHoliday _objHoliday = new clsHoliday();
        #endregion

        #region All Employees
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult EmployeeList()
        {
            // employee admin setup 

            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();

            List<Employee> emplList = new List<Employee>();
            if (superAdmin || hr)
            {
                emplList = _objEmployee.getEmployees().OrderBy(a => a.FirstNameEn).Where(a => a.CountryID == CurrentCountryID).ToList();
            }
            else
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                DateTime todaysDate = DateTime.Now.Date;
                emplList = (from e in _objEmployee.getEmployees()
                            where e.CountryID == CurrentCountryID &&
                            (e.SupervisorID == employeeID || (e.AlternativeSupervisorID == employeeID && todaysDate >= e.AltFromDate && todaysDate <= e.AltEndDate))
                            select e).ToList();

            }
            emplList = emplList.Where(a => a.UserID.HasValue).ToList();
            return PartialView(emplList);
        }
        public ActionResult PrintEmployeeReport()
        {
            // employee admin setup 

            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();

            List<Employee> emplList = new List<Employee>();
            if (superAdmin || hr)
            {
                emplList = _objEmployee.getEmployees().OrderBy(a => a.FirstNameEn).Where(a => a.CountryID == CurrentCountryID).ToList();
            }
            else
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                DateTime todaysDate = DateTime.Now.Date;
                emplList = (from e in _objEmployee.getEmployees()
                            where e.CountryID == CurrentCountryID &&
                            (e.SupervisorID == employeeID || (e.AlternativeSupervisorID == employeeID && todaysDate >= e.AltFromDate && todaysDate <= e.AltEndDate))
                            select e).ToList();

            }
            emplList = emplList.Where(a => a.UserID.HasValue).ToList();
            return PartialView(emplList);
        }
        #endregion

        #region Employee's Projects

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">EmployeeID</param>
        /// <returns></returns>
        public ActionResult Projects(Guid id)
        {
            ViewBag.EmployeeID = id;
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">EmployeeID</param>
        /// <returns></returns>
        public ActionResult ProjectList(Guid id, int year)
        {
            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            List<EmployeeProject> li = _objEmployeeProjects.getEmployeesProjects(id, year);
            return PartialView(li);
        }
        public ActionResult PrintProjectList(Guid id, int year)
        {
            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            List<EmployeeProject> li = _objEmployeeProjects.getEmployeesProjects(id, year);
            return PartialView(li);
        }
        #endregion

        #region Employee's Timesheets

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">EmployeeID</param>
        /// <returns></returns>
        public ActionResult Timesheet(Guid id)
        {
            ViewBag.EmployeeID = id;
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">EmployeeID</param>
        /// <returns></returns>
        public ActionResult TimesheetList(Guid id, int year)
        {
            int workingHours = 8;
            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Utils.Try(() => workingHours = Convert.ToInt32(WebConfigurationManager.AppSettings["WorkingHours"].ToString()));
            ViewBag.workingHours = workingHours;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            List<TimeSheetMaster> li = _objTimesheet.getEmployeesTimesheet(id, year).Where(a => a.Status != null && a.Status.ToLower() == "approved").ToList();
            return PartialView(li);
        }

        public ActionResult PrintTimesheetList(Guid id, int year)
        {
            int workingHours = 8;
            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Utils.Try(() => workingHours = Convert.ToInt32(WebConfigurationManager.AppSettings["WorkingHours"].ToString()));
            ViewBag.workingHours = workingHours;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            List<TimeSheetMaster> li = _objTimesheet.getEmployeesTimesheet(id, year).Where(a => a.Status != null && a.Status.ToLower() == "approved").ToList();
            return PartialView(li);
        }

        public ActionResult TimesheetSummary(Guid EmployeeID, Guid TimesheetMasterId, string returnUrl)
        {
            ViewBag.returnUrl = returnUrl;
            ViewBag.EmployeeID = EmployeeID;
            ViewBag.TimeSheetMasterID = TimesheetMasterId;
            return View();
        }

        public ActionResult TimesheetSummaryPV(Guid EmployeeID, Guid TimesheetMasterId, string returnUrl)
        {
            ViewBag.TimesheetMasterId = TimesheetMasterId;
            ViewBag.returnUrl = returnUrl;
            Employee empoyeeObj = _objEmployee.getEmployeesbyId(EmployeeID);
            ViewBag.Employee = empoyeeObj;

            TimeSheetMaster obj = _objTimesheet.getTimesheetByID(TimesheetMasterId);
            List<LeaveSummaryVM> li = _objLeaveSummary.getLeaveSummary(empoyeeObj, TimesheetMasterId, obj);
            ViewBag.monthyear = string.Format("{0} - {1}", obj.Month, obj.Year);
            ViewBag.totalHours = "Total working hours - " + li.Sum(a => a.hour);
            ViewBag.productiveHours = "Productive working hours -" + li.Where(a => a.isLeave == false).Sum(a => a.hour);
            string status = "";
            if (obj.IsSubmit == true)
            {
                if (obj.Status != null && obj.Status.ToLower().Trim() == "approved")
                {
                    status = "Timesheet Is Approved";
                }
                else
                {
                    status = "Timesheet Is Pending";
                }
            }
            else
            {
                status = "Timesheet Is Not Submitted";
            }
            ViewBag.status = status;
            return PartialView(li);
        }
        #endregion

        #region Leave Balance
        public ActionResult LeaveBalance(Guid id)
        {
            ViewBag.EmployeeID = id;
            return View();
        }
        public ActionResult LeaveBalancePV(Guid id, bool isEmployeee, int year, string ReturnUrl)
        {
            ViewBag.isEmployeee = isEmployeee;
            ViewBag.EmployeeID = id;
            ViewBag.year = year;
            ViewBag.returnUrl = ReturnUrl;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            MVCUtility objMVCUtility = new MVCUtility();
            List<EmployeeLeaveModified> li = objMVCUtility.getLeaveSummary(id, year);

            return PartialView(li);
        }
        public ActionResult PrintLeaveBalancePV(Guid id, bool isEmployeee, int year)
        {
            ViewBag.isEmployeee = isEmployeee;
            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            MVCUtility objMVCUtility = new MVCUtility();
            List<EmployeeLeaveModified> li = objMVCUtility.getLeaveSummary(id, year);

            return PartialView(li);
        }
        #endregion

        #region Vacation Balance Report
        public ActionResult VacationBalanceReport()
        {
            return View();
        }
        public ActionResult VacationBalanceReportPV()
        {
            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();

            GetList();
            int CurrentYear = (DateTime.Now).Year;
            //int CurrentYear = DateTime.Now.Month >= 10 ? (DateTime.Now.Year + 1) : (DateTime.Now.Month <= 9 ? DateTime.Now.Year : DateTime.Now.Year);

            ViewBag.year = CurrentYear;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            MVCUtility objMVCUtility = new MVCUtility();
            List<EmployeeLeaveModified> li = objMVCUtility.getLeaveSummarybyYear(CurrentYear);
            if (superAdmin || hr)
            {
                li = li.Where(a => a.EmployeeName.CountryID.Value == CurrentCountryID).ToList();
            }

            return PartialView(li);

        }

        [HttpPost]
        public ActionResult VacationBalanceReportPV(FormCollection frm)
        {
            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();

            GetList();
            int CurrentYear = (DateTime.Now).Year;
            //int CurrentYear = DateTime.Now.Month >= 10 ? (DateTime.Now.Year + 1) : (DateTime.Now.Month <= 9 ? DateTime.Now.Year : DateTime.Now.Year);

            ViewBag._YearSelected = (frm["ddlYear"] != null && frm["ddlYear"] != "") ? (frm["ddlYear"].ToString()) : "";

            ViewBag._DepartmentSelected = (frm["ddlDepartment"] != null && frm["ddlDepartment"] != "") ? (new Guid(frm["ddlDepartment"])).ToString() : "";
            ViewBag._LeaveTypeSelected = (frm["ddlLeaveType"] != null && frm["ddlLeaveType"] != "") ? (new Guid(frm["ddlLeaveType"])).ToString() : "";
            ViewBag._OfficeLocationSelected = (frm["ddlLocation"] != null && frm["ddlLocation"] != "") ? (new Guid(frm["ddlLocation"])).ToString() : "";
            ViewBag._EmpNameSelected = (frm["ddlEmpName"] != null && frm["ddlEmpName"] != "") ? (frm["ddlEmpName"].ToString()) : "";

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            MVCUtility objMVCUtility = new MVCUtility();
            List<EmployeeLeaveModified> li = objMVCUtility.getLeaveSummary();
            if (superAdmin || hr)
            {
                li = li.Where(a => a.EmployeeName.CountryID.Value == CurrentCountryID).ToList();
            }
            if (frm["ddlYear"] != null && frm["ddlYear"] != "")
            {
                ViewBag.year = Convert.ToInt32(frm["ddlYear"]);
                li = li.Where(a => a.Year.HasValue && a.Year.Value == Convert.ToInt32(frm["ddlYear"])).ToList();
            }
            else
            {
                ViewBag.year = CurrentYear;
                li =li.Where(a => a.Year.HasValue && a.Year.Value == CurrentYear).ToList(); 
            }

            if (frm["ddlLeaveType"] != null && frm["ddlLeaveType"] != "")
            {
                li = li.Where(a => a.LeaveTypeID == new Guid(frm["ddlLeaveType"])).ToList();
            }
            if (frm["ddlLocation"] != null && frm["ddlLocation"] != "")
            {
                li = li.Where(a => a.EmployeeName.OfficeLocationID == new Guid(frm["ddlLocation"])).ToList();
            }

            if (frm["ddlDepartment"] != null && frm["ddlDepartment"] != "")
            {
                li = li.Where(a => a.EmployeeName.DepartmentID == new Guid(frm["ddlDepartment"])).ToList();
            }

            if (frm["ddlEmpName"] != null && frm["ddlEmpName"] != "")
            {
                li = li.Where(a => a.EmpId == new Guid(frm["ddlEmpName"])).ToList();
            }
            return PartialView(li);

        }

        public ActionResult PrintVacationBalanceReportPV(Guid? empname, int? year, Guid? leavetype, Guid? location, Guid? department)
        {
            GetList();
            int CurrentYear = (DateTime.Now).Year;
            //int CurrentYear = DateTime.Now.Month >= 10 ? (DateTime.Now.Year + 1) : (DateTime.Now.Month <= 9 ? DateTime.Now.Year : DateTime.Now.Year);

            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            MVCUtility objMVCUtility = new MVCUtility();
            List<EmployeeLeaveModified> li = (objMVCUtility.getLeaveSummary().OrderBy(a => a.EmpName)).ToList();
            if (superAdmin || hr)
            {
                li = li.Where(a => a.EmployeeName.CountryID.Value == CurrentCountryID).ToList();
            }
            if (empname != null)
            {
                li = li.Where(a => a.EmpId == empname).ToList();
            }
            if (leavetype != null)
            {
                li = li.Where(a => a.LeaveTypeID == leavetype).ToList();
            }
            if (location != null)
            {
                li = li.Where(a => a.EmployeeName.OfficeLocationID == location).ToList();
            }
            if (department != null)
            {
               li = li.Where(a => a.EmployeeName.DepartmentID == department).ToList();
            }
            if (year.HasValue)
            {
                ViewBag.year = year;
                li = li.Where(a => a.Year == year).ToList();
            }
            else
            {
                ViewBag.year = CurrentYear;
                li = li.Where(a => a.Year.HasValue && a.Year == CurrentYear).ToList();
            }

            return PartialView(li);
        }
        #endregion

        #region Holidays
        public ActionResult Holidays(Guid id)
        {
            ViewBag.EmployeeID = id;
            return View();
        }
        public ActionResult HolidaysPV(Guid id, int year)
        {
            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            List<EmployeeHoilday> holidayList = _objHoliday.getHolidayByEmpID_Year(id, year);
            return PartialView(holidayList);
        }

        public ActionResult PrintHolidaysPV(Guid id, int year)
        {
            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            List<EmployeeHoilday> holidayList = _objHoliday.getHolidayByEmpID_Year(id, year);
            return PartialView(holidayList);
        }

        #endregion

        #region Vacation Request
        public ActionResult VacationRequest(Guid id)
        {
            ViewBag.EmployeeID = id;
            return View();
        }
        public ActionResult VacationRequestPV(Guid id, int year)
        {

            //year dropdown
            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<EmployeeLeaveRequest> li = _objEmployeeLeaves.getSelectedYearLeavesRequests(id, year);
            return PartialView(li);
        }

        public ActionResult PrintVacationRequestPV(Guid id, int year)
        {

            //year dropdown
            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag.yearsList = yearsList;

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;

            ViewBag.EmployeeID = id;
            ViewBag.year = year;

            List<EmployeeLeaveRequest> li = _objEmployeeLeaves.getSelectedYearLeavesRequests(id, year);
            return PartialView(li);
        }

        #endregion

        #region Carry Forward
        public ActionResult CarryForward(Guid id)
        {
            ViewBag.EmployeeID = id;
            return View();
        }
        public ActionResult CarryForwardPV(Guid id, string returnUrl)
        {
            ViewBag.returnUrl = returnUrl;
            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;
            int currentYear = DateTime.Now.Year + 1;
            ViewBag.currentYear = currentYear;

            clsLeaveType objLeaveType = new clsLeaveType();
            List<LeaveType> leaveTypeList = objLeaveType.getLeaveType();
            ViewBag.leaveTypeList = leaveTypeList;

            List<EmployeeLeaf> EmployeeLeavesList = _objEmployeeLeaves.getEmployeeLeavesByYear(empoyeeObj.EmployeeID, currentYear);
            if (EmployeeLeavesList != null && EmployeeLeavesList.Count() > 0)
            {
                // Open in edit mode 
                ViewBag.edit = true;
                List<EmployeeLeaveModified> li = new List<EmployeeLeaveModified>();
                foreach (EmployeeLeaf item in EmployeeLeavesList)
                {
                    EmployeeLeaveModified ob = new EmployeeLeaveModified();
                    ob.BalanceLeaves = item.BalanceLeaves ?? 0;
                    ob.CreatedDate = item.CreatedDate;
                    ob.EmpId = item.EmpId;
                    ob.IssuedLeaves = item.IssuedLeaves ?? 0;
                    ob.LeaveTypeID = item.LeaveTypeID;
                    ob.TotalLeaves = item.TotalLeaves ?? 0;
                    ob.Year = item.Year;
                    ob.PostponedLeave = item.PostponedLeave ?? 0;
                    li.Add(ob);
                }

                #region Get Last Year Leave Balance
                Dictionary<Guid, decimal> lastYearBalance = new Dictionary<Guid, decimal>();
                MVCUtility objMVCUtility = new MVCUtility();
                List<EmployeeLeaveModified> currentYearsSenctionedLeaves = objMVCUtility.getLeaveSummary(id);
                foreach (EmployeeLeaveModified item in currentYearsSenctionedLeaves)
                {
                    lastYearBalance.Add(item.LeaveTypeID, item.BalanceLeaves);
                }
                ViewBag.lastYearBalance = lastYearBalance;
                #endregion

                #region Get Postponed Leave Balance
                Dictionary<Guid, decimal> postponedBalance = new Dictionary<Guid, decimal>();

                List<EmployeeLeaveModified> currentYearsSenctionedPostponedLeaves = objMVCUtility.getLeaveSummary(id, currentYear);
                foreach (EmployeeLeaveModified item in currentYearsSenctionedPostponedLeaves)
                {
                    decimal pLev = item.PostponedLeave ?? 0;
                    postponedBalance.Add(item.LeaveTypeID, pLev);
                }
                ViewBag.PostponedLeaves = postponedBalance;
                #endregion

                li = li.OrderBy(a => a.LeaveTypeName).ToList();
                return PartialView(li);
            }
            else
            {
                // Open in add new mode
                ViewBag.edit = false;
                MVCUtility objMVCUtility = new MVCUtility();
                List<EmployeeLeaveModified> li = objMVCUtility.getLeaveSummary(id);
                li = li.OrderBy(a => a.LeaveTypeName).ToList();
                return PartialView(li);
            }

        }

        [HttpPost]
        public ActionResult CarryForwardPV(FormCollection coll)
        {
            try
            {
                clsLeaveType _objLeaveType = new clsLeaveType();
                clsEmployeeLeaves _objEmployeeLeaves = new clsEmployeeLeaves();

                int year = Convert.ToInt32(coll["hfyear"].ToString());
                Guid employeeID = new Guid(coll["hfemployeeID"].ToString());
                int count = Convert.ToInt32(coll["hfCount"].ToString());

                bool isEdit = Convert.ToBoolean(coll["hfEdit"].ToString());
                if (isEdit)
                {
                    // delete previous years entry
                    bool deleteSuccess = _objEmployeeLeaves.deletePreviousYearsEntries(employeeID, year);
                    if (!deleteSuccess)
                    {
                        return Json(new { success = false, msg = "Some error occurred while processing your request" }, JsonRequestBehavior.AllowGet);
                    }
                }
                for (int i = 1; i <= count; i++)
                {
                    bool usingBalanceLeave = coll["chboxBalanceLeaves_" + i].ToString().Contains("true");
                    bool usingPostponedLeave = coll["chboxpostponedLeaves_" + i].ToString().Contains("true");
                    decimal balanceLeaves = usingBalanceLeave ? Convert.ToDecimal(coll["balanceLeaves_" + i].ToString()) : 0;
                    decimal postpondLeaves = usingPostponedLeave ? Convert.ToDecimal(coll["postpBalance_" + i].ToString()) : 0;
                    decimal totalleaves = Convert.ToDecimal(coll["totalLeaves_" + i].ToString());
                    

                    //temp
                    //int balLeave = 0;
                    //int totLeave = 0;
                    //if (usingBalanceLeave)
                    //{
                    //    try
                    //    {
                    //        string total = coll["totalLeaves_" + i].ToString();
                    //        string balance = coll["balanceLeaves_" + i].ToString();
                    //        balLeave = Convert.ToInt32(Convert.ToDecimal(balance));
                    //        totLeave = Convert.ToInt32(Convert.ToDecimal(total));
                    //    }
                    //    catch (Exception ee) { }
                    //}
                    //int balanceLeaves = usingBalanceLeave ? balLeave : 0;
                    //int totalleaves = usingBalanceLeave ? totLeave : 0;
                    //end of temp

                    int leaves = Convert.ToInt32(coll["leaves_" + i].ToString());

                    Guid leaveTypeID = new Guid(coll["hfLeaveTypeID_" + i].ToString());
                    EmployeeLeaf newLeave = new EmployeeLeaf();
                    newLeave.EmpId = employeeID;
                    newLeave.EmployeeLeaveID = Guid.NewGuid();
                    newLeave.LeaveTypeID = leaveTypeID;
                    newLeave.BalanceLeaves = balanceLeaves;
                    newLeave.IssuedLeaves = leaves;
                    //this Field added on 25-Nov-2014
                    newLeave.PostponedLeave = postpondLeaves;
                    newLeave.TotalLeaves = totalleaves;
                    newLeave.Year = year;
                    newLeave.CreatedDate = DateTime.Now;
                    _objLeaveType.addNewEmployeeLeave(newLeave);
                }
                // code to add

                TempData["success"] = "Carry forward operation done successfully";
                return Json(new { success = true, msg = "Leave" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ee)
            {
                return Json(new { success = false, msg = "Error :" + ee.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        #endregion

        #region Timesheet Report

        public ActionResult TimesheetReport()
        {
            List<SelectListItem> liMonths = MVCSelectList.getMonth();
            SelectListItem item = new SelectListItem();
            item.Text = "Select Month";
            item.Value = "";
            item.Selected = true;
            liMonths.Insert(0, item);
            List<SelectListItem> liYears = MVCSelectList.getYearForTimeSheet();
            List<SelectListItem> liOfficeLocation = MVCSelectList.getOfficeLocationDropDown();
            List<SelectListItem> liDepartment = MVCSelectList.getAllDepartments();
            List<SelectListItem> liStatus = MVCSelectList.getDistinctStatus();

            ViewBag.monthslist = liMonths;
            ViewBag.yearlist = liYears;
            ViewBag.OfficeLocationList = liOfficeLocation;
            ViewBag.DepartmentList = liDepartment;
            ViewBag.StatusList = liStatus;
            return View();
        }

        #region comment old TimesheetReport
        //public ActionResult TimesheetReportPV(string month, int? year)
        //{
        //    // used sql helper and procedure SP_Report

        //    string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
        //    SqlConnection con = new SqlConnection(connectionString);
        //    SqlCommand cmd = new SqlCommand("SP_Report", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@action", 1);
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    da.SelectCommand = cmd;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);

        //    List<ReportTimeSheet> li = new List<ReportTimeSheet>();
        //    foreach (DataRow item in ds.Tables[0].Rows)
        //    {
        //        ReportTimeSheet timesheetRow = new ReportTimeSheet();
        //        timesheetRow.TimeSheetMasterID = new Guid(item["TimeSheetMasterID"].ToString());
        //        timesheetRow.EmployeeID = new Guid(item["EmployeeID"].ToString());
        //        timesheetRow.ProjectNumber = item["ProjectNumber"].ToString();
        //        timesheetRow.Month = item["Month"].ToString();
        //        timesheetRow.ProjectName = item["ProjectName"].ToString();
        //        timesheetRow.TotalHours = Convert.ToDecimal(item["TotalHours"].ToString());
        //        timesheetRow.EmployeeName = item["EmployeeName"].ToString();
        //        timesheetRow.Status = item["Status"].ToString();
        //        timesheetRow.Year = Convert.ToInt32(item["Year"].ToString());
        //        timesheetRow.supervisorID = item["SupervisorID"] != DBNull.Value ? new Guid(item["SupervisorID"].ToString()) : (Guid?)null;
        //        timesheetRow.alternativeSupervisorID = item["AlternativeSupervisorID"] != DBNull.Value ? new Guid(item["AlternativeSupervisorID"].ToString()) : (Guid?)null;
        //        timesheetRow.altFromDate = item["AltFromDate"] != DBNull.Value ? Convert.ToDateTime(item["AltFromDate"].ToString()) : (DateTime?)null;
        //        timesheetRow.altEndDate = item["AltEndDate"] != DBNull.Value ? Convert.ToDateTime(item["AltEndDate"].ToString()) : (DateTime?)null;
        //        timesheetRow.CountryID = item["CountryID"] != DBNull.Value ? new Guid(item["CountryID"].ToString()) : (Guid?)null;

        //        if (item["IsSubmit"] != null)
        //        {
        //            timesheetRow.IsSubmit = Convert.ToBoolean(item["IsSubmit"].ToString());
        //        }
        //        li.Add(timesheetRow);
        //    }
        //    if (!string.IsNullOrEmpty(month))
        //    {
        //        li = li.Where(a => a.Month == month).ToList();
        //    }
        //    if (year.HasValue)
        //    {
        //        li = li.Where(a => a.Year == year).ToList();
        //    }

        //    string username = Membership.GetUser().UserName;
        //    bool hr = Roles.IsUserInRole(SiteRoles.HR);
        //    bool superAdmin = MVCUtility.IsSuperAdmin();
        //    if (superAdmin || hr)
        //    {
        //        li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
        //    }
        //    else
        //    {
        //        Guid? employeeID = MVCUtility.getCurrentEmployeeID();
        //        DateTime todaysDate = DateTime.Now.Date;
        //        try
        //        {
        //            li = (from lv in li
        //                  where lv.CountryID == CurrentCountryID &&
        //                  (lv.supervisorID == employeeID || (lv.alternativeSupervisorID == employeeID && todaysDate >= lv.altFromDate && todaysDate <= lv.altEndDate)
        //                  || (lv.EmployeeID == employeeID))
        //                  select lv).ToList();
        //        }
        //        catch (Exception ee)
        //        {
        //        }
        //    }

        //    return PartialView(li);
        //}


        #endregion


        #region comment old PrintTimesheetReport

        //public ActionResult PrintTimesheetReport(string month, int? year)
        //{
        //    // used sql helper and procedure SP_Report

        //    string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
        //    SqlConnection con = new SqlConnection(connectionString);
        //    SqlCommand cmd = new SqlCommand("SP_Report", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@action", 1);
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    da.SelectCommand = cmd;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);

        //    List<ReportTimeSheet> li = new List<ReportTimeSheet>();
        //    foreach (DataRow item in ds.Tables[0].Rows)
        //    {
        //        ReportTimeSheet timesheetRow = new ReportTimeSheet();
        //        timesheetRow.TimeSheetMasterID = new Guid(item["TimeSheetMasterID"].ToString());
        //        timesheetRow.EmployeeID = new Guid(item["EmployeeID"].ToString());
        //        timesheetRow.ProjectNumber = item["ProjectNumber"].ToString();
        //        timesheetRow.Month = item["Month"].ToString();
        //        timesheetRow.ProjectName = item["ProjectName"].ToString();
        //        timesheetRow.TotalHours = Convert.ToDecimal(item["TotalHours"].ToString());
        //        timesheetRow.EmployeeName = item["EmployeeName"].ToString();
        //        timesheetRow.Status = item["Status"].ToString();
        //        timesheetRow.Year = Convert.ToInt32(item["Year"].ToString());
        //        timesheetRow.supervisorID = item["SupervisorID"] != DBNull.Value ? new Guid(item["SupervisorID"].ToString()) : (Guid?)null;
        //        timesheetRow.alternativeSupervisorID = item["AlternativeSupervisorID"] != DBNull.Value ? new Guid(item["AlternativeSupervisorID"].ToString()) : (Guid?)null;
        //        timesheetRow.altFromDate = item["AltFromDate"] != DBNull.Value ? Convert.ToDateTime(item["AltFromDate"].ToString()) : (DateTime?)null;
        //        timesheetRow.altEndDate = item["AltEndDate"] != DBNull.Value ? Convert.ToDateTime(item["AltEndDate"].ToString()) : (DateTime?)null;
        //        timesheetRow.CountryID = item["CountryID"] != DBNull.Value ? new Guid(item["CountryID"].ToString()) : (Guid?)null;

        //        if (item["IsSubmit"] != null)
        //        {
        //            timesheetRow.IsSubmit = Convert.ToBoolean(item["IsSubmit"].ToString());
        //        }
        //        li.Add(timesheetRow);
        //    }
        //    if (!string.IsNullOrEmpty(month))
        //    {
        //        li = li.Where(a => a.Month == month).ToList();
        //    }
        //    if (year.HasValue)
        //    {
        //        li = li.Where(a => a.Year == year).ToList();
        //    }

        //    string username = Membership.GetUser().UserName;
        //    bool hr = Roles.IsUserInRole(SiteRoles.HR);
        //    bool superAdmin = MVCUtility.IsSuperAdmin();
        //    if (superAdmin || hr)
        //    {
        //        li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
        //    }
        //    else
        //    {
        //        Guid? employeeID = MVCUtility.getCurrentEmployeeID();
        //        DateTime todaysDate = DateTime.Now.Date;
        //        try
        //        {
        //            li = (from lv in li
        //                  where lv.CountryID == CurrentCountryID &&
        //                  (lv.supervisorID == employeeID || (lv.alternativeSupervisorID == employeeID && todaysDate >= lv.altFromDate && todaysDate <= lv.altEndDate)
        //                  || (lv.EmployeeID == employeeID))
        //                  select lv).ToList();
        //        }
        //        catch (Exception ee)
        //        {
        //        }
        //    }
        #endregion

        public ActionResult TimesheetReportPV(string month, int? year, string Status, string Department, string OfficeLocation)
        {
            // used sql helper and procedure SP_Report

            string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_Report", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 1);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            List<ReportTimeSheet> li = new List<ReportTimeSheet>();
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                ReportTimeSheet timesheetRow = new ReportTimeSheet();
                timesheetRow.TimeSheetMasterID = new Guid(item["TimeSheetMasterID"].ToString());
                timesheetRow.EmployeeID = new Guid(item["EmployeeID"].ToString());
                timesheetRow.ProjectNumber = item["ProjectNumber"].ToString();
                timesheetRow.Month = item["Month"].ToString();
                timesheetRow.ProjectName = item["ProjectName"].ToString();
                timesheetRow.TotalHours = item["TotalHours"]!=null && item["TotalHours"].ToString()!=""?Convert.ToDecimal(item["TotalHours"].ToString()):0;
                timesheetRow.EmployeeName = item["EmployeeName"].ToString();
                timesheetRow.Status = item["Status"].ToString();
                timesheetRow.DepartmentID = item["DepartmentID"] != DBNull.Value ? new Guid(item["DepartmentID"].ToString()) : (Guid?)null;
                timesheetRow.OfficeLocationID = item["OfficeLocationID"] != DBNull.Value ? new Guid(item["OfficeLocationID"].ToString()) : (Guid?)null;
                timesheetRow.Year = Convert.ToInt32(item["Year"].ToString());
                timesheetRow.supervisorID = item["SupervisorID"] != DBNull.Value ? new Guid(item["SupervisorID"].ToString()) : (Guid?)null;
                timesheetRow.alternativeSupervisorID = item["AlternativeSupervisorID"] != DBNull.Value ? new Guid(item["AlternativeSupervisorID"].ToString()) : (Guid?)null;
                timesheetRow.altFromDate = item["AltFromDate"] != DBNull.Value ? Convert.ToDateTime(item["AltFromDate"].ToString()) : (DateTime?)null;
                timesheetRow.altEndDate = item["AltEndDate"] != DBNull.Value ? Convert.ToDateTime(item["AltEndDate"].ToString()) : (DateTime?)null;
                timesheetRow.CountryID = item["CountryID"] != DBNull.Value ? new Guid(item["CountryID"].ToString()) : (Guid?)null;

                if (item["IsSubmit"] != null)
                {
                    timesheetRow.IsSubmit = Convert.ToBoolean(item["IsSubmit"].ToString());
                }
                li.Add(timesheetRow);
            }
            if (!string.IsNullOrEmpty(month))
            {
                li = li.Where(a => a.Month == month).ToList();
            }
            if (year.HasValue)
            {
                li = li.Where(a => a.Year == year).ToList();
            }
            if (!string.IsNullOrEmpty(Status))
            {
                li = li.Where(a => a.Status == Status).ToList();
            }
            if (!string.IsNullOrEmpty(Department))
            {
                li = li.Where(a => a.DepartmentID == Guid.Parse(Department)).ToList();
            }
            if (!string.IsNullOrEmpty(OfficeLocation))
            {
                li = li.Where(a => a.OfficeLocationID == Guid.Parse(OfficeLocation)).ToList();
            }

            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();
            if (superAdmin || hr)
            {
                li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
            }
            else
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                DateTime todaysDate = DateTime.Now.Date;
                try
                {
                    li = (from lv in li
                          where lv.CountryID == CurrentCountryID &&
                          (lv.supervisorID == employeeID || (lv.alternativeSupervisorID == employeeID && todaysDate >= lv.altFromDate && todaysDate <= lv.altEndDate)
                          || (lv.EmployeeID == employeeID))
                          select lv).ToList();
                }
                catch (Exception ee)
                {
                }
            }

            return PartialView(li.OrderBy(n=>n.EmployeeName));
        }

        public ActionResult PrintTimesheetReport(string month, int? year, string Status, string Department, string OfficeLocation)
        {
            // used sql helper and procedure SP_Report

            string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_Report", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 1);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            List<ReportTimeSheet> li = new List<ReportTimeSheet>();
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                ReportTimeSheet timesheetRow = new ReportTimeSheet();
                timesheetRow.TimeSheetMasterID = new Guid(item["TimeSheetMasterID"].ToString());
                timesheetRow.EmployeeID = new Guid(item["EmployeeID"].ToString());
                timesheetRow.ProjectNumber = item["ProjectNumber"].ToString();
                timesheetRow.Month = item["Month"].ToString();
                timesheetRow.ProjectName = item["ProjectName"].ToString();
                timesheetRow.TotalHours = item["TotalHours"] != null && item["TotalHours"].ToString() != "" ? Convert.ToDecimal(item["TotalHours"].ToString()) : 0;
                timesheetRow.EmployeeName = item["EmployeeName"].ToString();
                timesheetRow.Status = item["Status"].ToString();
                timesheetRow.DepartmentID = item["DepartmentID"] != DBNull.Value ? new Guid(item["DepartmentID"].ToString()) : (Guid?)null;
                timesheetRow.OfficeLocationID = item["OfficeLocationID"] != DBNull.Value ? new Guid(item["OfficeLocationID"].ToString()) : (Guid?)null;
                timesheetRow.Year = Convert.ToInt32(item["Year"].ToString());
                timesheetRow.supervisorID = item["SupervisorID"] != DBNull.Value ? new Guid(item["SupervisorID"].ToString()) : (Guid?)null;
                timesheetRow.alternativeSupervisorID = item["AlternativeSupervisorID"] != DBNull.Value ? new Guid(item["AlternativeSupervisorID"].ToString()) : (Guid?)null;
                timesheetRow.altFromDate = item["AltFromDate"] != DBNull.Value ? Convert.ToDateTime(item["AltFromDate"].ToString()) : (DateTime?)null;
                timesheetRow.altEndDate = item["AltEndDate"] != DBNull.Value ? Convert.ToDateTime(item["AltEndDate"].ToString()) : (DateTime?)null;
                timesheetRow.CountryID = item["CountryID"] != DBNull.Value ? new Guid(item["CountryID"].ToString()) : (Guid?)null;

                if (item["IsSubmit"] != null)
                {
                    timesheetRow.IsSubmit = Convert.ToBoolean(item["IsSubmit"].ToString());
                }
                li.Add(timesheetRow);
            }
            if (!string.IsNullOrEmpty(month))
            {
                li = li.Where(a => a.Month == month).ToList();
            }
            if (year.HasValue)
            {
                li = li.Where(a => a.Year == year).ToList();
            }
            if (!string.IsNullOrEmpty(Status))
            {
                li = li.Where(a => a.Status == Status).ToList();
            }
            if (!string.IsNullOrEmpty(Department))
            {
                li = li.Where(a => a.DepartmentID == Guid.Parse(Department)).ToList();
            }
            if (!string.IsNullOrEmpty(OfficeLocation))
            {
                li = li.Where(a => a.OfficeLocationID == Guid.Parse(OfficeLocation)).ToList();
            }

            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();
            if (superAdmin || hr)
            {
                li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
            }
            else
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                DateTime todaysDate = DateTime.Now.Date;
                try
                {
                    li = (from lv in li
                          where lv.CountryID == CurrentCountryID &&
                          (lv.supervisorID == employeeID || (lv.alternativeSupervisorID == employeeID && todaysDate >= lv.altFromDate && todaysDate <= lv.altEndDate)
                          || (lv.EmployeeID == employeeID))
                          select lv).ToList();
                }
                catch (Exception ee)
                {
                }
            }

            return PartialView(li);

        }
        #endregion

        #region Email Leave Balances

        public ActionResult EmailLeaveBalances()
        {
            return View();
        }
        public ActionResult sendEmailForLeaveBalance()
        {
            try
            {
                EmailLeaveBalance objEmailLeaveBalance = new EmailLeaveBalance();
                bool result = objEmailLeaveBalance.sendLeaveBalance();
                if (result)
                {
                    return Json(new { success = true, msg = "Mail sent successfully" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    throw new Exception("Unexpected error occured");
                }
            }
            catch (Exception ee)
            {
                return Json(new { success = false, msg = "Error :" + ee.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        #endregion

        #region VacationReport

        public ActionResult VacationReport()
        {
            return View();
        }


        public ActionResult VacationReportPV()
        {

            GetList();
            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();

            List<EmployeeLeaveRequest> li = _objEmployeeLeaves.getCurrentYearsLeavesRequests();
            if (superAdmin || hr)
            {
                li = li.Where(a => a.Employee.CountryID == CurrentCountryID).ToList();
            }
            else
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                DateTime todaysDate = DateTime.Now.Date;
                try
                {
                    li = (from lv in li
                          where lv.Employee.CountryID == CurrentCountryID &&
                          (lv.Employee.SupervisorID == employeeID || (lv.Employee.AlternativeSupervisorID == employeeID && todaysDate >= lv.Employee.AltFromDate && todaysDate <= lv.Employee.AltEndDate)
                          || (lv.Employee.EmployeeID == employeeID))
                          select lv).ToList();
                }
                catch (Exception ee)
                {
                }
            }

            return PartialView(li);
        }

        public void GetList()
        {
            ViewBag._Department = MVCSelectList.getAllDepartments();
            ViewBag._LeaveType = MVCSelectList.getAllLeaveType();

            Guid CurrentUserID = MVCUtility.getCurrentUserID();

            clsEmployee objclsEmp = new clsEmployee();
            Employee JobDetail = new Employee();
            JobDetail = objclsEmp.getEmployeesbyUserId(CurrentUserID);


            ViewBag._OfficeLocation = MVCSelectList.getOfficeLocationDropDownByCountryID((JobDetail != null) ? JobDetail.CountryID.Value : CurrentCountryID);

            ViewBag._EmpName = MVCSelectList.getAllEmployee((JobDetail != null) ? JobDetail.CountryID.Value : CurrentCountryID);

            List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
            ViewBag._Year = yearsList;

            ViewBag._MonthFrom = MVCSelectList.getMonthList();
            ViewBag._MonthTo = MVCSelectList.getMonthList();
        }

        [HttpPost]
        public ActionResult VacationReportPV(FormCollection frm)
        {
            GetList();
            ViewBag._FRomDateSelected = (frm["FRom_Date"] != null && frm["FRom_Date"] != "") ? (frm["FRom_Date"].ToString()) : "";
            ViewBag._ToDateSelected = (frm["To_Date"] != null && frm["To_Date"] != "") ? (frm["To_Date"].ToString()) : "";

            ViewBag._DepartmentSelected = (frm["ddlDepartment"] != null && frm["ddlDepartment"] != "") ? (new Guid(frm["ddlDepartment"])).ToString() : "";
            ViewBag._LeaveTypeSelected = (frm["ddlLeaveType"] != null && frm["ddlLeaveType"] != "") ? (new Guid(frm["ddlLeaveType"])).ToString() : "";
            ViewBag._OfficeLocationSelected = (frm["ddlLocation"] != null && frm["ddlLocation"] != "") ? (new Guid(frm["ddlLocation"])).ToString() : "";

            //  new Guid(frm["ddlLocation"])

            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();

            List<EmployeeLeaveRequest> li = _objEmployeeLeaves.getCurrentYearsLeavesRequests();
            try
            {
                if (superAdmin || hr)
                {
                    li = li.Where(a => a.Employee.CountryID == CurrentCountryID).ToList();
                    if (frm["FRom_Date"] != null && frm["FRom_Date"] != "")
                    {
                        li = li.Where(a => a.FromDate >= Convert.ToDateTime(frm["FRom_Date"].ToString())).ToList();
                    }


                    if (frm["To_Date"] != null && frm["To_Date"] != "")
                    {
                        li = li.Where(a => a.ToDate <= Convert.ToDateTime(frm["To_Date"].ToString())).ToList();
                    }


                    if (frm["ddlLocation"] != null && frm["ddlLocation"] != "")
                    {
                        li = li.Where(a => a.Employee.OfficeLocationID == new Guid(frm["ddlLocation"])).ToList();
                    }

                    if (frm["ddlDepartment"] != null && frm["ddlDepartment"] != "")
                    {
                        li = li.Where(a => a.Employee.DepartmentID == new Guid(frm["ddlDepartment"])).ToList();
                    }
                    if (frm["ddlLeaveType"] != null && frm["ddlLeaveType"] != "")
                    {
                        li = li.Where(a => a.LeaveType.LeaveTypeID == new Guid(frm["ddlLeaveType"])).ToList();
                    }

                }
                else
                {
                    Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                    DateTime todaysDate = DateTime.Now.Date;

                    li = (from lv in li
                          where lv.Employee.CountryID == CurrentCountryID &&
                          (lv.Employee.SupervisorID == employeeID || (lv.Employee.AlternativeSupervisorID == employeeID && todaysDate >= lv.Employee.AltFromDate && todaysDate <= lv.Employee.AltEndDate)
                          || (lv.Employee.EmployeeID == employeeID))
                          select lv).ToList();


                }



            }
            catch (Exception ee)
            {
            }


            return PartialView(li);
        }


        public ActionResult PrintVacationReport(string from, string to, string location, string department, string vacationtype)
        {

            GetList();
            string username = Membership.GetUser().UserName;
            bool hr = Roles.IsUserInRole(SiteRoles.HR);
            bool superAdmin = MVCUtility.IsSuperAdmin();

            List<EmployeeLeaveRequest> li = _objEmployeeLeaves.getCurrentYearsLeavesRequests();
            if (superAdmin || hr)
            {
                li = li.Where(a => a.Employee.CountryID == CurrentCountryID).OrderBy(a=>a.Employee.FirstNameEn).ToList();
                if (from != null && from != "")
                {
                    li = li.Where(a => a.FromDate >= Convert.ToDateTime(from.ToString())).ToList();
                }


                if (to != null && to != "")
                {
                    li = li.Where(a => a.ToDate <= Convert.ToDateTime(to.ToString())).ToList();
                }


                if (location != null && location != "")
                {
                    li = li.Where(a => a.Employee.OfficeLocationID == new Guid(location.ToString())).ToList();
                }

                if (department != null && department != "")
                {
                    li = li.Where(a => a.Employee.DepartmentID == new Guid(department)).ToList();
                }
                if (vacationtype != null && vacationtype != "")
                {
                    li = li.Where(a => a.LeaveType.LeaveTypeID == new Guid(vacationtype)).ToList();
                }
            }
            else
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                DateTime todaysDate = DateTime.Now.Date;
                try
                {
                    li = (from lv in li
                          where lv.Employee.CountryID == CurrentCountryID &&
                          (lv.Employee.SupervisorID == employeeID || (lv.Employee.AlternativeSupervisorID == employeeID && todaysDate >= lv.Employee.AltFromDate && todaysDate <= lv.Employee.AltEndDate)
                          || (lv.Employee.EmployeeID == employeeID))
                          select lv).ToList();
                }
                catch (Exception ee)
                {
                }
            }

            return PartialView(li);
        }



        #endregion

        #region VacationSummaryReport
        public ActionResult VacationSummaryReport()
        {
            return View();
        }

        public ActionResult VacationSummaryReportPV()
        {
            try
            {
                GetList();
                int CurrentYear = (DateTime.Now).Year;



                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                clsEmployeeLeaves clsEmployee = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> lstLeaveRequest = new List<EmployeeLeaveRequest>();

                List<EmployeeLeaveRequest> emprequest = new List<EmployeeLeaveRequest>();

                //if (!string.IsNullOrEmpty(status) && status != "all")
                //{
                //    ViewBag.status = status;
                //    emprequest = clsEmployee.getAllLeaveRequestByEmployeeId(employee.EmployeeID, status.ToLower().Trim());
                //}
                //else
                //{
                //emprequest = clsEmployee.getLeaveAllRequest(employee.EmployeeID);
                Guid CountryID = MVCUtility.getCurrentCountryID();
                emprequest = (clsEmployee.getLeaveRequestForSuperadmin(CountryID)).Where(a => a.FromDate.HasValue && a.FromDate.Value.Year == CurrentYear).ToList();

                //}


                foreach (EmployeeLeaveRequest emp in emprequest)
                {
                    MembershipUser superviser = Membership.GetUser(emp.Employee.UserID);
                    emp.Employee.Email = superviser.UserName;
                    lstLeaveRequest.Add(emp);
                }

                // Filter By Year
                //if (year.HasValue)
                //{
                //    lstLeaveRequest = lstLeaveRequest.Where(a => a.FromDate.HasValue && a.FromDate.Value.Year == year).ToList();
                //}

                return PartialView(lstLeaveRequest);


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [HttpPost]
        public ActionResult VacationSummaryReportPV(FormCollection frm)
        {
            try
            {
                GetList();
                int CurrentYear = (DateTime.Now).Year;

                ViewBag._YearSelected = (frm["ddlYear"] != null && frm["ddlYear"] != "") ? (frm["ddlYear"].ToString()) : "";

                ViewBag._DepartmentSelected = (frm["ddlDepartment"] != null && frm["ddlDepartment"] != "") ? (new Guid(frm["ddlDepartment"])).ToString() : "";
                ViewBag._LeaveTypeSelected = (frm["ddlLeaveType"] != null && frm["ddlLeaveType"] != "") ? (new Guid(frm["ddlLeaveType"])).ToString() : "";
                ViewBag._OfficeLocationSelected = (frm["ddlLocation"] != null && frm["ddlLocation"] != "") ? (new Guid(frm["ddlLocation"])).ToString() : "";
                ViewBag._EmpNameSelected = (frm["ddlEmpName"] != null && frm["ddlEmpName"] != "") ? (frm["ddlEmpName"].ToString()) : "";


                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                clsEmployeeLeaves clsEmployee = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> lstLeaveRequest = new List<EmployeeLeaveRequest>();

                List<EmployeeLeaveRequest> li = new List<EmployeeLeaveRequest>();


                Guid CountryID = MVCUtility.getCurrentCountryID();
                li = clsEmployee.getLeaveRequestForSuperadmin(CountryID).ToList();



                if (frm["ddlYear"] != null && frm["ddlYear"] != "")
                {
                    li = li.Where(a => a.FromDate.HasValue && a.FromDate.Value.Year == Convert.ToInt32(frm["ddlYear"])).ToList();
                }
                else
                {
                    li = (clsEmployee.getLeaveRequestForSuperadmin(CountryID)).Where(a => a.FromDate.HasValue && a.FromDate.Value.Year == CurrentYear).ToList();
                }

                if (frm["ddlLeaveType"] != null && frm["ddlLeaveType"] != "")
                {
                    li = li.Where(a => a.LeaveType.LeaveTypeID == new Guid(frm["ddlLeaveType"])).ToList();
                }
                if (frm["ddlLocation"] != null && frm["ddlLocation"] != "")
                {
                    li = li.Where(a => a.Employee.OfficeLocationID == new Guid(frm["ddlLocation"])).ToList();
                }

                if (frm["ddlDepartment"] != null && frm["ddlDepartment"] != "")
                {
                    li = li.Where(a => a.Employee.DepartmentID == new Guid(frm["ddlDepartment"])).ToList();
                }

                if (frm["ddlEmpName"] != null && frm["ddlEmpName"] != "")
                {
                    li = li.Where(a => a.Employee.EmployeeID == new Guid(frm["ddlEmpName"])).ToList();
                }
                foreach (EmployeeLeaveRequest emp in li)
                {
                    MembershipUser superviser = Membership.GetUser(emp.Employee.UserID);
                    emp.Employee.Email = superviser.UserName;
                    lstLeaveRequest.Add(emp);
                }



                return PartialView(lstLeaveRequest);


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult PrintVacationSummaryReportPV(Guid? empname, int? year, Guid? leavetype, Guid? location, Guid? department)
        {
            try
            {
                GetList();
                int CurrentYear = (DateTime.Now).Year;

                List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
                ViewBag._Year = yearsList;

                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                clsEmployeeLeaves clsEmployee = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> lstLeaveRequest = new List<EmployeeLeaveRequest>();

                List<EmployeeLeaveRequest> emprequest = new List<EmployeeLeaveRequest>();

                Guid CountryID = MVCUtility.getCurrentCountryID();
                emprequest = clsEmployee.getLeaveRequestForSuperadmin(CountryID).ToList();

                if (empname != null)
                {
                    emprequest = emprequest.Where(a => a.EmployeeID == empname).ToList();
                }
                if (leavetype != null)
                {
                    emprequest = emprequest.Where(a => a.LeaveTypeID == leavetype).ToList();
                }
                if (location != null)
                {
                    emprequest = emprequest.Where(a => a.Employee.OfficeLocationID == location).ToList();
                }
                if (department != null)
                {
                    emprequest = emprequest.Where(a => a.Employee.DepartmentID == department).ToList();
                }
                if (year.HasValue)
                {
                    emprequest = emprequest.Where(a => a.CreateDate.Value.Year == year).ToList();
                }
                else
                {
                    emprequest = emprequest.Where(a => a.FromDate.HasValue && a.FromDate.Value.Year == CurrentYear).ToList();
                }
                

                foreach (EmployeeLeaveRequest emp in emprequest)
                {
                    MembershipUser superviser = Membership.GetUser(emp.Employee.UserID);
                    emp.Employee.Email = superviser.UserName;
                    lstLeaveRequest.Add(emp);
                }

                return PartialView(lstLeaveRequest);


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region TimesheetListDetail
        public ActionResult TimesheetListDetail()
        {
            return View();
        }
        public ActionResult TimesheetListDetailPV()
        {
            try
            {

                GetList();


                // used sql helper and procedure SP_Report

                string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("SP_Report", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", 1);

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);

                List<ReportTimeSheet> li = new List<ReportTimeSheet>();
                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    ReportTimeSheet timesheetRow = new ReportTimeSheet();
                    timesheetRow.TimeSheetMasterID = new Guid(item["TimeSheetMasterID"].ToString());
                    timesheetRow.EmployeeID = new Guid(item["EmployeeID"].ToString());
                    timesheetRow.ProjectNumber = item["ProjectNumber"].ToString();
                    timesheetRow.Month = item["Month"].ToString();
                    timesheetRow.ProjectName = item["ProjectName"].ToString();
                    timesheetRow.TotalHours = item["TotalHours"] != null && item["TotalHours"].ToString() != "" ? Convert.ToDecimal(item["TotalHours"].ToString()) : 0;
                    timesheetRow.EmployeeName = item["EmployeeName"].ToString();
                    timesheetRow.Status = item["Status"].ToString();
                    timesheetRow.Year = Convert.ToInt32(item["Year"].ToString());
                    timesheetRow.OfficeLocationID = item["OfficeLocationID"] != DBNull.Value ? new Guid(item["OfficeLocationID"].ToString()) : (Guid?)null;
                    timesheetRow.supervisorID = item["SupervisorID"] != DBNull.Value ? new Guid(item["SupervisorID"].ToString()) : (Guid?)null;
                    timesheetRow.alternativeSupervisorID = item["AlternativeSupervisorID"] != DBNull.Value ? new Guid(item["AlternativeSupervisorID"].ToString()) : (Guid?)null;
                    timesheetRow.altFromDate = item["AltFromDate"] != DBNull.Value ? Convert.ToDateTime(item["AltFromDate"].ToString()) : (DateTime?)null;
                    timesheetRow.altEndDate = item["AltEndDate"] != DBNull.Value ? Convert.ToDateTime(item["AltEndDate"].ToString()) : (DateTime?)null;
                    timesheetRow.CountryID = item["CountryID"] != DBNull.Value ? new Guid(item["CountryID"].ToString()) : (Guid?)null;

                    if (item["IsSubmit"] != null)
                    {
                        timesheetRow.IsSubmit = Convert.ToBoolean(item["IsSubmit"].ToString());
                    }
                    li.Add(timesheetRow);
                }
                //if (!string.IsNullOrEmpty(month))
                //{
                //li = li.Where(a => a.Month == month).ToList();
                //}
                //if (year.HasValue)
                //{
                //    li = li.Where(a => a.Year == year).ToList();
                //}

                string username = Membership.GetUser().UserName;
                bool hr = Roles.IsUserInRole(SiteRoles.HR);
                bool superAdmin = MVCUtility.IsSuperAdmin();
                if (superAdmin || hr)
                {
                    li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
                }
                else
                {
                    Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                    DateTime todaysDate = DateTime.Now.Date;
                    try
                    {
                        li = (from lv in li
                              where lv.CountryID == CurrentCountryID &&
                              (lv.supervisorID == employeeID || (lv.alternativeSupervisorID == employeeID && todaysDate >= lv.altFromDate && todaysDate <= lv.altEndDate)
                              || (lv.EmployeeID == employeeID))
                              select lv).ToList();
                    }
                    catch (Exception ee)
                    {
                    }
                }

                return PartialView(li);


            }
            catch (Exception ex)
            {
                TempData["error"] = "No data is available for timesheet.";
                return PartialView();
            }
        }

        [HttpPost]
        public ActionResult TimesheetListDetailPV(FormCollection frm)
        {
            try
            {

                GetList();
                int CurrentYear = (DateTime.Now).Year;

                ViewBag._YearSelected = (frm["ddlYear"] != null && frm["ddlYear"] != "") ? (frm["ddlYear"].ToString()) : "";
                ViewBag._MonthFromSelected = (frm["ddlMonthFrom"] != null && frm["ddlMonthFrom"] != "") ? (frm["ddlMonthFrom"].ToString()) : "";
                ViewBag._MonthToSelected = (frm["ddlMonthTo"] != null && frm["ddlMonthTo"] != "") ? (frm["ddlMonthTo"].ToString()) : "";
                ViewBag._DepartmentSelected = (frm["ddlDepartment"] != null && frm["ddlDepartment"] != "") ? (new Guid(frm["ddlDepartment"])).ToString() : "";
                ViewBag._OfficeLocationSelected = (frm["ddlLocation"] != null && frm["ddlLocation"] != "") ? (new Guid(frm["ddlLocation"])).ToString() : "";
                ViewBag._EmpNameSelected = (frm["ddlEmpName"] != null && frm["ddlEmpName"] != "") ? (frm["ddlEmpName"].ToString()) : "";

                int intMonthFrom = GetIntMonth(frm["ddlMonthFrom"].ToString());
                int intMonthTo = GetIntMonth(frm["ddlMonthTo"].ToString());

                string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("SP_Report", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", 1);

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);

                List<ReportTimeSheet> li = new List<ReportTimeSheet>();
                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    ReportTimeSheet timesheetRow = new ReportTimeSheet();
                    timesheetRow.TimeSheetMasterID = new Guid(item["TimeSheetMasterID"].ToString());
                    timesheetRow.EmployeeID = new Guid(item["EmployeeID"].ToString());
                    timesheetRow.ProjectNumber = item["ProjectNumber"].ToString();
                    timesheetRow.Month = item["Month"].ToString();
                    timesheetRow.MonthInt = GetIntMonth(item["Month"].ToString());
                    timesheetRow.ProjectName = item["ProjectName"].ToString();
                    timesheetRow.TotalHours = item["TotalHours"] != null && item["TotalHours"].ToString() != "" ? Convert.ToDecimal(item["TotalHours"].ToString()) : 0;
                    timesheetRow.EmployeeName = item["EmployeeName"].ToString();
                    timesheetRow.Status = item["Status"].ToString();
                    timesheetRow.Year = Convert.ToInt32(item["Year"].ToString());
                    timesheetRow.supervisorID = item["SupervisorID"] != DBNull.Value ? new Guid(item["SupervisorID"].ToString()) : (Guid?)null;
                    timesheetRow.alternativeSupervisorID = item["AlternativeSupervisorID"] != DBNull.Value ? new Guid(item["AlternativeSupervisorID"].ToString()) : (Guid?)null;
                    timesheetRow.altFromDate = item["AltFromDate"] != DBNull.Value ? Convert.ToDateTime(item["AltFromDate"].ToString()) : (DateTime?)null;
                    timesheetRow.altEndDate = item["AltEndDate"] != DBNull.Value ? Convert.ToDateTime(item["AltEndDate"].ToString()) : (DateTime?)null;
                    timesheetRow.CountryID = item["CountryID"] != DBNull.Value ? new Guid(item["CountryID"].ToString()) : (Guid?)null;
                    timesheetRow.OfficeLocationID = item["OfficeLocationID"] != DBNull.Value ? new Guid(item["OfficeLocationID"].ToString()) : (Guid?)null;
                    timesheetRow.DepartmentID = item["DepartmentID"] != DBNull.Value ? new Guid(item["DepartmentID"].ToString()) : (Guid?)null;

                    if (item["IsSubmit"] != null)
                    {
                        timesheetRow.IsSubmit = Convert.ToBoolean(item["IsSubmit"].ToString());
                    }
                    li.Add(timesheetRow);
                }




                string username = Membership.GetUser().UserName;
                bool hr = Roles.IsUserInRole(SiteRoles.HR);
                bool superAdmin = MVCUtility.IsSuperAdmin();
                if (superAdmin || hr)
                {
                    li = li.Where(a => a.CountryID == CurrentCountryID).ToList();

                    if (frm["ddlYear"] != null && frm["ddlYear"].ToString() != "")
                    {
                        li = li.Where(a => a.Year == Convert.ToInt32(frm["ddlYear"])).ToList();
                    }

                    if (frm["ddlDepartment"] != null && frm["ddlDepartment"].ToString() != "")
                    {
                        li = li.Where(a => a.DepartmentID == new Guid(frm["ddlDepartment"])).ToList();
                    }
                    if (frm["ddlLocation"] != null && frm["ddlLocation"].ToString() != "")
                    {
                        li = li.Where(a => a.OfficeLocationID == new Guid(frm["ddlLocation"])).ToList();
                    }
                    if (frm["ddlEmpName"] != null && frm["ddlEmpName"].ToString() != "")
                    {
                        li = li.Where(a => a.EmployeeID == new Guid(frm["ddlEmpName"])).ToList();
                    }
                    if (frm["ddlEmpName"] != null && frm["ddlEmpName"].ToString() != "")
                    {
                        li = li.Where(a => a.EmployeeID == new Guid(frm["ddlEmpName"])).ToList();
                    }
                    if (frm["ddlMonthFrom"] != null && frm["ddlMonthFrom"].ToString() != "")
                    {
                        li = li.Where(a => a.MonthInt >= intMonthFrom).ToList();
                    }
                    if (frm["ddlMonthTo"] != null && frm["ddlMonthTo"].ToString() != "")
                    {
                        li = li.Where(a => a.MonthInt <= intMonthTo).ToList();
                    }


                }
                else
                {
                    Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                    DateTime todaysDate = DateTime.Now.Date;
                    try
                    {
                        li = (from lv in li
                              where lv.CountryID == CurrentCountryID &&
                              (lv.supervisorID == employeeID || (lv.alternativeSupervisorID == employeeID && todaysDate >= lv.altFromDate && todaysDate <= lv.altEndDate)
                              || (lv.EmployeeID == employeeID))
                              select lv).ToList();
                    }
                    catch (Exception ee)
                    {
                    }
                }

                return PartialView(li);



            }
            catch (Exception ex)
            {
                TempData["error"] = "No data is available for timesheet.";
                return PartialView();
            }
        }

        public ActionResult PrintTimesheetListDetail(string Year, string MonthFrom, string MonthTo, string Location, string Department, string EmpName)
        {
            try
            {

        //         url = url + "&Year=" + $("#dllYear").val();
        //url = url + "&MonthFrom=" + $("#ddlMonthFrom").val();
        //url = url + "&MonthTo=" + $("#ddlMonthTo").val();      
        //url = url + "&Location=" + $("#ddlLocation").val();
        //url = url + "&Department=" + $("#ddlDepartment").val();
        //url = url + "&EmpName=" + $("#ddlEmpName").val();
                GetList();
                int CurrentYear = (DateTime.Now).Year;

                //ViewBag._YearSelected = (frm["ddlYear"] != null && frm["ddlYear"] != "") ? (frm["ddlYear"].ToString()) : "";
                //ViewBag._MonthFromSelected = (frm["ddlMonthFrom"] != null && frm["ddlMonthFrom"] != "") ? (frm["ddlMonthFrom"].ToString()) : "";
                //ViewBag._MonthToSelected = (frm["ddlMonthTo"] != null && frm["ddlMonthTo"] != "") ? (frm["ddlMonthTo"].ToString()) : "";
                //ViewBag._DepartmentSelected = (frm["ddlDepartment"] != null && frm["ddlDepartment"] != "") ? (new Guid(frm["ddlDepartment"])).ToString() : "";
                //ViewBag._OfficeLocationSelected = (frm["ddlLocation"] != null && frm["ddlLocation"] != "") ? (new Guid(frm["ddlLocation"])).ToString() : "";
                //ViewBag._EmpNameSelected = (frm["ddlEmpName"] != null && frm["ddlEmpName"] != "") ? (frm["ddlEmpName"].ToString()) : "";

                int intMonthFrom = GetIntMonth(MonthFrom);
                int intMonthTo = GetIntMonth(MonthTo);

                string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("SP_Report", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", 1);

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);

                List<ReportTimeSheet> li = new List<ReportTimeSheet>();
                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    ReportTimeSheet timesheetRow = new ReportTimeSheet();
                    timesheetRow.TimeSheetMasterID = new Guid(item["TimeSheetMasterID"].ToString());
                    timesheetRow.EmployeeID = new Guid(item["EmployeeID"].ToString());
                    timesheetRow.ProjectNumber = item["ProjectNumber"].ToString();
                    timesheetRow.Month = item["Month"].ToString();
                    timesheetRow.MonthInt = GetIntMonth(item["Month"].ToString());
                    timesheetRow.ProjectName = item["ProjectName"].ToString();
                    timesheetRow.TotalHours = item["TotalHours"] != null && item["TotalHours"].ToString() != "" ? Convert.ToDecimal(item["TotalHours"].ToString()) : 0;
                    timesheetRow.EmployeeName = item["EmployeeName"].ToString();
                    timesheetRow.Status = item["Status"].ToString();
                    timesheetRow.Year = Convert.ToInt32(item["Year"].ToString());
                    timesheetRow.supervisorID = item["SupervisorID"] != DBNull.Value ? new Guid(item["SupervisorID"].ToString()) : (Guid?)null;
                    timesheetRow.alternativeSupervisorID = item["AlternativeSupervisorID"] != DBNull.Value ? new Guid(item["AlternativeSupervisorID"].ToString()) : (Guid?)null;
                    timesheetRow.altFromDate = item["AltFromDate"] != DBNull.Value ? Convert.ToDateTime(item["AltFromDate"].ToString()) : (DateTime?)null;
                    timesheetRow.altEndDate = item["AltEndDate"] != DBNull.Value ? Convert.ToDateTime(item["AltEndDate"].ToString()) : (DateTime?)null;
                    timesheetRow.CountryID = item["CountryID"] != DBNull.Value ? new Guid(item["CountryID"].ToString()) : (Guid?)null;
                    timesheetRow.OfficeLocationID = item["OfficeLocationID"] != DBNull.Value ? new Guid(item["OfficeLocationID"].ToString()) : (Guid?)null;
                    timesheetRow.DepartmentID = item["DepartmentID"] != DBNull.Value ? new Guid(item["DepartmentID"].ToString()) : (Guid?)null;

                    if (item["IsSubmit"] != null)
                    {
                        timesheetRow.IsSubmit = Convert.ToBoolean(item["IsSubmit"].ToString());
                    }
                    li.Add(timesheetRow);
                }




                string username = Membership.GetUser().UserName;
                bool hr = Roles.IsUserInRole(SiteRoles.HR);
                bool superAdmin = MVCUtility.IsSuperAdmin();
                if (superAdmin || hr)
                {
                    li = li.Where(a => a.CountryID == CurrentCountryID).ToList();

                    if (Year != null && Year != "")
                    {
                        li = li.Where(a => a.Year == Convert.ToInt32(Year)).ToList();
                    }

                    if (intMonthFrom > 0)
                    {
                        li = li.Where(a => a.MonthInt >= intMonthFrom).ToList();
                    }
                    if (intMonthTo > 0)
                    {
                        li = li.Where(a => a.MonthInt <= intMonthTo).ToList();
                    }

                    if (Department != null && Department != "")
                    {
                        li = li.Where(a => a.DepartmentID == new Guid(Department)).ToList();
                    }
                    if (Location != null && Location != "")
                    {
                        li = li.Where(a => a.OfficeLocationID == new Guid(Location)).ToList();
                    }

                    if (EmpName != null && EmpName != "")
                    {
                        li = li.Where(a => a.EmployeeID == new Guid(EmpName)).ToList();
                    }
                  

                }
                else
                {
                    Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                    DateTime todaysDate = DateTime.Now.Date;
                    try
                    {
                        li = (from lv in li
                              where lv.CountryID == CurrentCountryID &&
                              (lv.supervisorID == employeeID || (lv.alternativeSupervisorID == employeeID && todaysDate >= lv.altFromDate && todaysDate <= lv.altEndDate)
                              || (lv.EmployeeID == employeeID))
                              select lv).ToList();
                    }
                    catch (Exception ee)
                    {
                    }
                }

                return PartialView(li);



            }
            catch (Exception ex)
            {
                TempData["error"] = "No data is available for timesheet.";
                return PartialView();
            }
        }
        public int GetIntMonth(string mon)
        {
            int intMonth = 0;

            switch (mon)
            {
                case "Jan": intMonth = 1; break;
                case "Feb": intMonth = 2; break;
                case "Mar": intMonth = 3; break;
                case "Apr": intMonth = 4; break;
                case "May": intMonth = 5; break;
                case "Jun": intMonth = 6; break;
                case "Jul": intMonth = 7; break;
                case "Aug": intMonth = 8; break;
                case "Sep": intMonth = 9; break;
                case "Oct": intMonth = 10; break;
                case "Nov": intMonth = 11; break;
                case "Dec": intMonth = 12; break;
            }

            return intMonth;
        }

        #endregion
    }
}

