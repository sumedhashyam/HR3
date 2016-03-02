
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAO;
using DAL;
using HR_System.Models;
using System.Web.Security;
using BusinessLogics;
using System.Web.Configuration;
using System.Web.Helpers;
namespace HR_System.Controllers
{
    [Authorize]
    public class EmployeeController : Controller
    {
        #region Variables

        Guid CurrentCountryID = MVCUtility.getCurrentCountryID();
        clsEmployee _objEmployee = new clsEmployee();
        clsNotification _objNotification = new clsNotification();
        clsEmployeeLeaves _objEmployeeLeaves = new clsEmployeeLeaves();
        clsTimesheet _objTimesheet = new clsTimesheet();
        LeaveSummary _objLeaveSummary = new LeaveSummary();
        dbHRSystemEntities db = new dbHRSystemEntities();
        MVCUtility objUtility = new MVCUtility();
        clsLeaveType objclsLeaveType = new clsLeaveType();
        clsWeekend objclsWeekend = new clsWeekend();

        #endregion

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult requestForLeave()
        {
            try
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                ViewBag.employeeID = employeeID;

                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                List<SelectListItem> selectlist = new List<SelectListItem>();

                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                List<LeaveType> listLeave = new List<LeaveType>();
                List<LeaveType> lst = new List<LeaveType>();
                List<EmployeeLeaf> listemployeeLeave = clsEmployeeLeave.getEmployeesbyId(employee.EmployeeID).Where(a => a.Year == DateTime.Now.Year).ToList();
                foreach (EmployeeLeaf emp in listemployeeLeave)
                {
                    LeaveType l = MVCSelectList.getAllLeaveTypeID(emp.LeaveTypeID);
                    lst.Add(l);
                }

                selectlist = MVCSelectList.getAllLeaveTypeData(lst);
                ViewData["listLeave"] = selectlist;
                return View();

            }
            catch (Exception ex)
            {
                TempData["error"] = "Error: " + ex.Message;
                return RedirectToAction("Index");
            }
        }


        [HttpPost]
        public ActionResult requestForLeave(EmployeeLeaveRequest leaveRequest, FormCollection coll)
        {
            string siteurl = WebConfigurationManager.AppSettings["WebUrl"].ToString();
            MVCUtility utilityObj = new MVCUtility();
            try
            {
                Guid? currentEmployeeID = MVCUtility.getCurrentEmployeeID();
                ViewBag.employeeID = currentEmployeeID;

                #region For Drop down
                List<SelectListItem> selectlist = new List<SelectListItem>();
                List<LeaveType> lst = new List<LeaveType>();
                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                List<EmployeeLeaf> listemployeeLeave = clsEmployeeLeave.getEmployeesbyId(currentEmployeeID);
                foreach (EmployeeLeaf emp in listemployeeLeave)
                {
                    LeaveType l = MVCSelectList.getAllLeaveTypeID(emp.LeaveTypeID);
                    lst.Add(l);

                }
                selectlist = MVCSelectList.getAllLeaveTypeData(lst);
                LeaveType leaveType = new LeaveType();
                lst.Add(leaveType);
                ViewData["listLeave"] = selectlist;
                #endregion

                bool isEndDate = (leaveRequest.FromDate != leaveRequest.ToDate);

                if (!ModelState.IsValid)
                {
                    return View(leaveRequest);
                }
                else
                {
                    if (isEndDate && leaveRequest.ToDate.HasValue == false)
                    {
                        ModelState.AddModelError("", "ToDate is required");
                        return View(leaveRequest);
                    }

                }
                //if (leaveRequest.FromDate < DateTime.Now.Date)
                //{
                //    ModelState.AddModelError("FromDate", "From Date can not be a past date");
                //    return View(leaveRequest);
                //}
                DateTime? ToDate = isEndDate ? leaveRequest.ToDate : null;
                DateTime FromDate = leaveRequest.FromDate.Value;

                //string news_date = leaveRequest.FromDate.ToString();


                clsEmployee objEmployee = new clsEmployee();
                Guid UserID = MVCUtility.getCurrentUserID();
                Employee employee = objEmployee.getEmployeesbyIdForReq(UserID);

                List<LeaveType> listLeave = new List<LeaveType>();



                Holiday holiday = new Holiday();


                Employee employeeforAltSuperviser = new Employee();
                MembershipUser superviser = null;
                bool exist = false;


                #region Get superviseID OR alternative supervisor ID
                string supervisorEmail = "";
                Guid? SupervisorUserID = null;
                if (employee.AlternativeSupervisorID.HasValue)
                {
                    employeeforAltSuperviser = objEmployee.getEmployeesbyId(employee.AlternativeSupervisorID.Value);
                    if (employeeforAltSuperviser != null)
                    {
                        DateTime dateNow = DateTime.Now;
                        if (employee.AltFromDate.HasValue && employee.AltEndDate.HasValue)
                        {
                            DateTime altFromDate = Convert.ToDateTime(employee.AltFromDate);
                            DateTime altToDate = Convert.ToDateTime(employee.AltEndDate);
                            if (dateNow <= altToDate && dateNow >= altFromDate)
                            {
                                exist = true;
                                SupervisorUserID = employeeforAltSuperviser.UserID;
                            }
                        }
                    }
                }
                else if (employee.SupervisorID.HasValue)
                {
                    Employee employeeforSuper = objEmployee.getEmployeesbyId(employee.SupervisorID.Value);
                    if (employeeforSuper != null)
                    {
                        exist = true;
                        SupervisorUserID = employeeforSuper.UserID;
                    }
                }

                if (exist)
                {
                    MembershipUser u = Membership.GetUser(SupervisorUserID);
                    supervisorEmail = u.Email;
                    superviser = u;
                }
                #endregion

                // get all leave request to check if already exist
                List<EmployeeLeaveRequest> getAllLeaveRequest = clsEmployeeLeave.getAllLeaveRequesByEmployeeID(employee.EmployeeID);


                TimeSpan time = new TimeSpan();
                int year = FromDate.Year;
                // check how many leave  available in this year
                EmployeeLeaf employeeL = clsEmployeeLeave.getEmployeeLeveByLeaveID(employee.EmployeeID, leaveRequest.LeaveTypeID, year);

                if (isEndDate)
                {

                    #region Leave for a period
                    TimeSpan dateDiffrence = ToDate.Value - FromDate;
                    if (dateDiffrence.Days == 0)
                    {
                        ModelState.AddModelError("", "From Date and To Date can not be equal");
                        return View(leaveRequest);
                    }
                    else if (dateDiffrence.Days < 0)
                    {
                        ModelState.AddModelError("", "From Date must be lesser than To Date");
                        return View(leaveRequest);
                    }

                    #region Check If Leave is already requested or has weekends and holidays

                    //List<string> weekendHolidayList = utilityObj.checkForWeekendOrHolidays(employee.EmployeeID, FromDate, ToDate.Value);
                    List<string> weekendHolidayList = checkForLeaves(leaveRequest.LeaveTypeID, employee.EmployeeID, FromDate, ToDate.Value, false, false, null) as List<string>;
                    if (weekendHolidayList.Count() > 0)
                    {
                        foreach (var item in weekendHolidayList)
                            ModelState.AddModelError("", item);
                        return View(leaveRequest);
                    }
                    #endregion

                    HolidayWeekendCount CountObj = utilityObj.checkForWeekendOrHolidaysCount(employee.EmployeeID, FromDate, ToDate.Value, false, null);
                    
                    #region Changes made 24-Nov-2014
                    Guid LeaveTypeId = new Guid(leaveRequest.LeaveTypeID.ToString());
                    LeaveType LeaveTypeDeatil = objclsLeaveType.getLeaveTypebyId(LeaveTypeId);
                    if (LeaveTypeDeatil != null && Convert.ToBoolean(LeaveTypeDeatil.WillHolidaysCount))
                    {
                        CountObj.holiday = 0;
                        CountObj.weekend = 0;
                    }
                    #endregion

                    leaveRequest.EmployeeID = employee.EmployeeID;
                    leaveRequest.EmployeeLeaveRequestID = Guid.NewGuid();
                    leaveRequest.CreateDate = DateTime.Now;
                    leaveRequest.FromDate = FromDate.Date;
                    leaveRequest.ToDate = ToDate.Value.Date;
                    leaveRequest.ActualDate = CountObj.totalLeaves;
                    leaveRequest.AssignedDate = CountObj.totalLeaves - (CountObj.holiday + CountObj.weekend);
                    leaveRequest.LeaveDetectionReason = "";
                    if (clsEmployeeLeave.isLeaveDateBetweenCurrentAndNext(leaveRequest))
                    {
                        EmployeeLeaveRequest Emp_LeaveReq = leaveRequest;
                        try
                        {
                            List<EmployeeLeaveRequest> li = new List<EmployeeLeaveRequest>();

                            if (Emp_LeaveReq != null)
                            {
                                DateTime todate = new DateTime(Emp_LeaveReq.FromDate.Value.Year, 9, 30);
                                if ((Emp_LeaveReq.ToDate.HasValue && Emp_LeaveReq.ToDate.Value.Month >= 10 && Emp_LeaveReq.ToDate.Value.Year == Emp_LeaveReq.FromDate.Value.Year) || (Emp_LeaveReq.ToDate.HasValue && Emp_LeaveReq.ToDate.Value.Month < 10 && Emp_LeaveReq.ToDate.Value.Year == (Emp_LeaveReq.FromDate.Value.Year + 1)))
                                {
                                    #region Current Year
                                    HolidayWeekendCount CurrentYearCountObj = utilityObj.checkForWeekendOrHolidaysCount(employee.EmployeeID, FromDate, todate, false, null);

                                    EmployeeLeaveRequest item = new EmployeeLeaveRequest();
                                    item.EmployeeID = Emp_LeaveReq.EmployeeID;
                                    item.EmployeeLeaveRequestID = Emp_LeaveReq.EmployeeLeaveRequestID;
                                    item.CreateDate = Emp_LeaveReq.CreateDate;
                                    item.FromDate = Emp_LeaveReq.FromDate;
                                    item.ToDate = todate;
                                    item.ActualDate = CurrentYearCountObj.totalLeaves;
                                    item.LeaveTypeID = Emp_LeaveReq.LeaveTypeID;
                                    if (LeaveTypeDeatil != null && Convert.ToBoolean(LeaveTypeDeatil.WillHolidaysCount))
                                    {
                                        item.AssignedDate = CurrentYearCountObj.totalLeaves;
                                    }
                                    else
                                    {
                                        item.AssignedDate = CurrentYearCountObj.totalLeaves - (CurrentYearCountObj.holiday + CurrentYearCountObj.weekend);
                                    }
                                    item.LeaveDetectionReason = "";
                                    item.LeaveReason = Emp_LeaveReq.LeaveReason;
                                    clsEmployeeLeave.addEmployeeLeaveRquest(item);
                                    //li.Insert(0, item);
                                    #endregion
                                    #region Next Year
                                    DateTime fromdate = new DateTime(Emp_LeaveReq.ToDate.Value.Year, 10, 01);
                                    HolidayWeekendCount NextYearCountObj = utilityObj.checkForWeekendOrHolidaysCount(employee.EmployeeID, fromdate, Emp_LeaveReq.ToDate.Value, false, null);

                                    item = new EmployeeLeaveRequest();

                                    item.EmployeeID = Emp_LeaveReq.EmployeeID;
                                    item.EmployeeLeaveRequestID = Guid.NewGuid();
                                    item.CreateDate = Emp_LeaveReq.CreateDate;
                                    item.FromDate = fromdate;
                                    item.ToDate = Emp_LeaveReq.ToDate;
                                    item.ActualDate = NextYearCountObj.totalLeaves;
                                    item.LeaveTypeID = Emp_LeaveReq.LeaveTypeID;
                                    if (LeaveTypeDeatil != null && Convert.ToBoolean(LeaveTypeDeatil.WillHolidaysCount))
                                    {
                                        item.AssignedDate = NextYearCountObj.totalLeaves;
                                    }
                                    else
                                    {
                                        item.AssignedDate = NextYearCountObj.totalLeaves - (NextYearCountObj.holiday + NextYearCountObj.weekend);
                                    }
                                    item.LeaveDetectionReason = "";
                                    item.LeaveReason = Emp_LeaveReq.LeaveReason;
                                    item.LeaveBetweenThisAndNextYearID = Emp_LeaveReq.EmployeeLeaveRequestID;
                                   // li.Insert(1, item);
                                    clsEmployeeLeave.addEmployeeLeaveRquest(item);
                                    #endregion
                                }
                            }
                           // return li;
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                    }
                    else
                    {
                        clsEmployeeLeave.addEmployeeLeaveRquest(leaveRequest);
                    }
                    addLogTableEntry(leaveRequest.EmployeeLeaveRequestID, employee.EmployeeID, "submit", "");
                    if (exist)
                    {
                        string employeeName = string.Format("{0} {1}", employee.FirstNameEn, employee.LastNameEn);
                        string mainMessage = string.Format("{0} has made a leave request of {1} days.", employeeName, leaveRequest.AssignedDate);
                        string Link = siteurl + "Leave/DetailForLeave?req_ID=" + leaveRequest.EmployeeLeaveRequestID; ;
                        string message = "<table>";
                        message += "<tr><td>" + mainMessage + "</td></tr>";
                        message += "<tr><td>To know more about leave application</td></tr>";
                        message += "<tr><td><a href=" + Link + ">Click here</a></td></tr>";
                        message += "</table>";
                        //mailSend(superviser.Email, leaveRequest.EmployeeLeaveRequestID, superviser.UserName, message);
                        mailSend(superviser.Email,superviser.UserName, message);
                    }

                    TempData["success"] = "Leave Request successfully sent. Your request is for " + leaveRequest.AssignedDate + " days";
                    return RedirectToAction("leaveData");

                    #endregion
                }
                else
                {
                    #region Single Day Leave
                    string divFullHalfDay = coll["divFullHalfDay"].ToString();
                    List<Holiday> holidayList = clsEmployeeLeave.getEmployeeHolidayList(employee.EmployeeID).Select(a => a.Holiday).ToList();

                    int assigned_Date = 1;
                    DateTime dt = FromDate;

                    //List<string> errorList = utilityObj.checkForWeekendOrHolidays(employee.EmployeeID, FromDate);
                    List<string> errorList = checkForLeaves(leaveRequest.LeaveTypeID, employee.EmployeeID, FromDate, null, false, false, null) as List<string>;
                    if (errorList.Count() > 0)
                    {
                        foreach (var item in errorList)
                            ModelState.AddModelError("", item);
                        return View(leaveRequest);
                    }


                    bool halfDay = false;
                    if (divFullHalfDay.ToLower() == "halfday")
                    {
                        halfDay = true;
                    }
                    leaveRequest.EmployeeID = employee.EmployeeID;
                    leaveRequest.EmployeeLeaveRequestID = Guid.NewGuid();
                    //leaveRequest.LeaveDate = dt;
                    leaveRequest.FromDate = FromDate;
                    leaveRequest.ToDate = FromDate;
                    leaveRequest.ActualDate = 1;
                    leaveRequest.HalfDay = halfDay;
                    leaveRequest.AssignedDate = assigned_Date;
                    leaveRequest.CreateDate = DateTime.Now;

                    string leaveDays = halfDay == true ? "1/2" : "1";

                    clsEmployeeLeave.addEmployeeLeaveRquest(leaveRequest);
                    addLogTableEntry(leaveRequest.EmployeeLeaveRequestID, employee.EmployeeID, "submit", "");
                    if (exist)
                    {
                        string Link = siteurl + "Leave/DetailForLeave?req_ID=" + leaveRequest.EmployeeLeaveRequestID;
                        string employeeName = string.Format("{0} {1}", employee.FirstNameEn, employee.LastNameEn);
                        string mainMessage = string.Format("{0} has made a leave request of {1} days.", employeeName, leaveDays);
                        string message = "<table>";
                        message += "<tr><td>" + mainMessage + "</td></tr>";
                        message += "<tr><td>To know more about leave application</td></tr>";
                        message += "<tr><td><a href=" + Link + ">Click here</a></td></tr>";
                        message += "</table>";
                        //mailSend(superviser.Email, leaveRequest.EmployeeLeaveRequestID, superviser.UserName, message);
                        mailSend(superviser.Email, superviser.UserName, message);

                    }
                    TempData["success"] = "Leave Request send successfully.";
                    return RedirectToAction("leaveData");

                    #endregion
                }


            }
            catch (Exception ex)
            {
                TempData["error"] = "Error: " + ex.Message;
                return View();
            }
        }

        public object checkForLeaves(Guid? LeaveTypeID, Guid employeeID, DateTime FromDate, DateTime? ToDate, bool isAjax, bool ApprovalMode, Guid? requestID, bool halfDay = false)
        {
            MVCUtility utilityObj = new MVCUtility();
            List<string> errorList = new List<string>();
            try
            {


                if (ToDate.HasValue)
                {
                    errorList = utilityObj.checkForWeekendOrHolidays(employeeID, FromDate, ToDate.Value, ApprovalMode, requestID);
                }
                else
                {
                    errorList = utilityObj.checkForWeekendOrHolidays(employeeID, FromDate, ApprovalMode, requestID);
                }

            }
            catch (Exception ee)
            {
                errorList.Add("Error:" + ee.Message);
            }

            HolidayWeekendCount weekendCount = new HolidayWeekendCount();
            decimal actualDays = 0;
            if (ToDate.HasValue)
            {
                weekendCount = utilityObj.checkForWeekendOrHolidaysCount(employeeID, FromDate, ToDate.Value, ApprovalMode, requestID);
                actualDays = weekendCount.totalLeaves - (weekendCount.weekend + weekendCount.holiday);
                if (errorList.Count() <= 0)
                {
                    if (actualDays == 0)
                    {
                        errorList.Add("Either holidays or weekend occurred. Zero (actual) leave days found.");
                    }
                }
            }
            else
            {
                actualDays = halfDay ? .5m : 1;
            }
            if (errorList.Count() <= 0)
            {

                List<string> newErrorList = checkIfLeaveIsAvailable(LeaveTypeID, employeeID, actualDays, halfDay);
                if (newErrorList != null && newErrorList.Count() > 0)
                {
                    errorList.AddRange(newErrorList);
                }
            }


            #region Normal Mode
            if (isAjax)
            {
                bool success = errorList.Count() <= 0;

                if (success)
                {
                    if (ToDate.HasValue)
                    {
                        //weekendCount = utilityObj.checkForWeekendOrHolidaysCount(employeeID, FromDate, ToDate.Value, ApprovalMode, requestID);
                        return Json(new { success = success, msg = errorList, singleday = false, weekendCount = weekendCount }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        return Json(new { success = success, msg = errorList, singleday = true, halfDay = halfDay }, JsonRequestBehavior.AllowGet);
                    }
                }
                return Json(new { success = success, msg = errorList }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return errorList;
            }
            #endregion

        }


        public List<string> checkIfLeaveIsAvailable(Guid? leaveTypeID, Guid employeeID, decimal totalDays, bool isHalfday)
        {
            List<string> errorList = new List<string>();
            try
            {
                decimal totalRequestedLeaveDays = isHalfday ? .5m : totalDays;
                decimal totalAssignedLeaves = 0;
                dbHRSystemEntities db = new dbHRSystemEntities();
                EmployeeLeaf employeeLeaveModel = db.EmployeeLeaves.Where(a => a.EmpId == employeeID && a.LeaveTypeID == leaveTypeID && a.Year == DateTime.Now.Year).FirstOrDefault();
                if (employeeLeaveModel != null && employeeLeaveModel.TotalLeaves.HasValue && employeeLeaveModel.TotalLeaves > 0)
                {
                    totalAssignedLeaves = employeeLeaveModel.TotalLeaves.Value;
                    decimal balanceLeaves = 0;
                    decimal postpondLeaves = employeeLeaveModel.PostponedLeave ?? 0;
                    decimal prevLeaves = employeeLeaveModel.BalanceLeaves ?? 0;
                    decimal temp = 0;

                    List<EmployeeLeaveRequest> currentYearsLeaves = _objEmployeeLeaves.getCurrentYearsLeavesRequests(employeeID).Where(a => a.LeaveTypeID == leaveTypeID && a.Cancel != true).ToList();
                    int leavesTaken = currentYearsLeaves.Where(a => a.HalfDay != true).Sum(a => a.AssignedDate) ?? 0;
                    decimal halfDay_leavesTaken = (currentYearsLeaves.Where(a => a.HalfDay == true).Sum(a => a.AssignedDate) ?? 0);
                    halfDay_leavesTaken = halfDay_leavesTaken / 2;
                    decimal leavesRemaining = totalAssignedLeaves - (leavesTaken + halfDay_leavesTaken);

                    #region Checking Is Service bonus Incremented then deduct from Issued leave
                    Boolean isIncremented = false;
                    decimal IssueLeaves = Convert.ToDecimal(employeeLeaveModel.IssuedLeaves);
                    int serviceBonus = 0;
                    if (employeeLeaveModel.LeaveType.LeaveTypeName == "Annual Leave")
                    {

                        if (MVCUtility.willAnnual_Increase() && MVCUtility.IsServiceBonusIncrementedForThisYesar(employeeID, DateTime.Now.Year.ToString()))
                        {

                            serviceBonus = MVCUtility.getServiceBonus();
                            IssueLeaves = IssueLeaves - serviceBonus;
                            isIncremented = true;
                        }
                    }

                    #endregion
              
                    #region Calculating Balance Leave
                    if (employeeLeaveModel.LeaveType.LeaveTypeName == "Annual Leave")
                    {
                        #region Calculating Balance of today
                        int year = System.DateTime.Now.Year;
                        int currentMonth = System.DateTime.Now.Month;
                        decimal LeaveInmonths = IssueLeaves / 12;
                        if (LeaveInmonths > 0)
                        {
                            if (currentMonth < 10)
                            {
                                currentMonth = currentMonth + 3;
                            }
                            if (currentMonth >= 10)
                            {
                                currentMonth = currentMonth - 9;
                            }
                            LeaveInmonths = LeaveInmonths * currentMonth;
                        }
                        //leavesRemaining = Math.Round(LeaveInmonths, 2) + serviceBonus;

                        //leavesRemaining = totalAssignedLeaves;

                        #region Calculating leaves taken by user till date
                        var lvs_requset = currentYearsLeaves.Where(a => (a.FromDate.Value.Month >= 10 && a.FromDate.Value.Year == (year - 1)) || (a.ToDate.Value.Month <= currentMonth && a.ToDate.HasValue && a.ToDate.Value.Year == year)).ToList();

                        int allleavesTaken = lvs_requset.Where(a => a.LeaveTypeID == employeeLeaveModel.LeaveType.LeaveTypeID && a.HalfDay != true).Sum(a => a.AssignedDate) ?? 0;
                        decimal aahalfDay_leavesTaken = (lvs_requset.Where(a => a.LeaveTypeID == employeeLeaveModel.LeaveType.LeaveTypeID && a.HalfDay == true).Sum(a => a.AssignedDate) ?? 0);
                        leavesRemaining = leavesRemaining - (allleavesTaken + aahalfDay_leavesTaken);
                        #endregion
                        #endregion

                        decimal totalLeaveTaken = leavesTaken + halfDay_leavesTaken;

                        #region Deduct Leaves From Postponed Leaves
                        if (postpondLeaves > 0)
                        {
                            if (postpondLeaves >= totalLeaveTaken)
                            {
                                temp = postpondLeaves - totalLeaveTaken;
                                totalLeaveTaken = 0;
                                postpondLeaves = temp;
                            }
                            else
                            {
                                temp = totalLeaveTaken - postpondLeaves;
                                totalLeaveTaken = totalLeaveTaken - postpondLeaves;
                                postpondLeaves = 0;
                            }
                        }
                        #endregion

                        #region Deduct Leaves From prevLeaves
                        if (prevLeaves > 0)
                        {
                            if (prevLeaves >= totalLeaveTaken)
                            {
                                temp = prevLeaves - totalLeaveTaken;
                                totalLeaveTaken = 0;
                                prevLeaves = temp;
                            }
                            else
                            {
                                temp = totalLeaveTaken - prevLeaves;
                                totalLeaveTaken = totalLeaveTaken - prevLeaves;
                                prevLeaves = 0;
                            }
                        }
                        #endregion
                        leavesRemaining = leavesRemaining + postpondLeaves + prevLeaves;

                    }
                    #endregion                   
                    #region check  is requested leave is greater than or not to remaining leaves
                    if ((leavesRemaining - totalRequestedLeaveDays) >= 0)
                    {
                        // do nothinf in error list
                    }
                    else
                    {
                        errorList.Add("You can not request more leave than your available leaves. Your requested leave days " + totalRequestedLeaveDays + ". Your remaining leave Balance as of today " + leavesRemaining);
                    }
                    #endregion
                }
                else
                {
                    errorList.Add("You can not request leave for selected leave type. You have not been assigned any leaves for this category");
                }
            }
            catch (Exception EE)
            {
                errorList.Add("Error :" + EE.Message);
            }
            return errorList;
        }
        public ActionResult leaveData()
        {
            try
            {
                List<SelectListItem> selectList = new List<SelectListItem>();
                ViewData["List"] = selectList;

                List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
                ViewBag.yearsList = yearsList;

                return View();
            }
            catch (Exception ex)
            {
                return View();
            }
        }
        public ActionResult leaveDataPV(string status, int? year)
        {
            try
            {

                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                clsEmployeeLeaves clsEmployee = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> lstLeaveRequest = new List<EmployeeLeaveRequest>();

                List<EmployeeLeaveRequest> emprequest = new List<EmployeeLeaveRequest>();
                if (!string.IsNullOrEmpty(status) && status != "all")
                {
                    ViewBag.status = status;
                    emprequest = clsEmployee.getAllLeaveRequestByEmployeeId(employee.EmployeeID, status.ToLower().Trim());
                }
                else
                {
                    emprequest = clsEmployee.getLeaveAllRequest(employee.EmployeeID);
                }


                foreach (EmployeeLeaveRequest emp in emprequest)
                {
                    MembershipUser superviser = Membership.GetUser(emp.Employee.UserID);
                    emp.Employee.Email = superviser.UserName;
                    lstLeaveRequest.Add(emp);
                }

                // Filter By Year
                if (year.HasValue)
                {
                    lstLeaveRequest = lstLeaveRequest.Where(a => a.FromDate.HasValue && a.FromDate.Value.Year == year).ToList();
                }

                return PartialView(lstLeaveRequest);


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult leaveDetail(Guid? req_ID)
        {
            try
            {
                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                // get employee by ID
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                List<SelectListItem> selectlist = new List<SelectListItem>();

                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                List<LeaveType> listLeave = new List<LeaveType>();
                //get Employee leave detail by employeeID
                List<EmployeeLeaf> listemployeeLeave = clsEmployeeLeave.getEmployeesbyId(employee.EmployeeID);
                foreach (EmployeeLeaf emp in listemployeeLeave)
                {
                    //lst = MVCSelectList.getAllLeaveType(emp.LeaveTypeID);
                    selectlist = MVCSelectList.getAllLeaveType(emp.LeaveTypeID);


                }
                if (listemployeeLeave.Count() == 0)
                {
                    selectlist.Insert(0, new SelectListItem() { Text = "Select Leave Type", Value = "" });
                }
                ViewData["req_ID"] = req_ID;
                ViewData["listLeave"] = selectlist;
                // get employee Leave request detail by ID
                EmployeeLeaveRequest empLeaveRequest = clsEmployeeLeave.getDetailForEmployeeLeave(req_ID);
                if (empLeaveRequest != null)
                {
                    return View(empLeaveRequest);
                }
                else
                {
                    TempData["error"] = "No request is assigned for this employee.";
                    return View("Error");
                }

            }
            catch (Exception ex)
            {
                TempData["error"] = "some error occcoured when we go to view page.";
                return View("Error");
            }

        }

        public ActionResult holidays()
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ActionResult holidaysPV()
        {
            try
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                clsHoliday obj = new clsHoliday();
                List<EmployeeHoilday> li = obj.getHolidayByEmployeeID(employeeID.Value, true);
                return PartialView(li);

                //clsEmployee emp1 = new clsEmployee();
                //clsEmployeeLeaves clsEmployee = new clsEmployeeLeaves();
                //MembershipUser user = Membership.GetUser();
                //Guid empID = new Guid(user.ProviderUserKey.ToString());
                //Employee employee = emp1.getEmployeesbyIdForReq(empID);

                //// get Holidays list By empID

                //List<Holiday> holidayList = new List<Holiday>();
                //Holiday holiday = new Holiday();

                //// get Holiday List For this employee
                //List<string> lstString = new List<string>();
                //List<EmployeeHoilday> lstEmpHoliday = clsEmployee.getEmployeeHolidayList(employee.EmployeeID);
                //foreach (EmployeeHoilday Empholiday in lstEmpHoliday)
                //{
                //    holiday = clsEmployee.GetHolidayListByID(Empholiday.HolidayID);
                //    holidayList.Add(holiday);
                //}
                //ViewData["listofHoliday"] = holidayList;
                ////Get All Holidays List
                //List<Holiday> listHoliday = clsEmployee.getAllHolidays();
                //return PartialView(listHoliday);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult calendarView()
        {
            try
            {
                string status = "Pending";
                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                clsEmployeeLeaves clsEmployee = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> lstLeaveRequest = new List<EmployeeLeaveRequest>();
                List<EmployeeLeaveRequest> emprequest = clsEmployee.getAllLeaveRequestByEmployeeId(employee.EmployeeID, status);
                //if (emprequest.Count() != 0)
                //{
                foreach (EmployeeLeaveRequest emp in emprequest)
                {
                    MembershipUser superviser = Membership.GetUser(emp.Employee.UserID);
                    emp.Employee.Email = superviser.UserName;
                    lstLeaveRequest.Add(emp);
                }
                return Json(lstLeaveRequest, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region My Timesheets

        public ActionResult timeSheet()
        {
            try
            {
                ViewData["Year"] = MVCSelectList.getYearForTimeSheet();
                return View();
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        //public ActionResult timeSheetPV(string year)
        //{
        //    try
        //    {

        //        clsEmployee emp1 = new clsEmployee();
        //        MembershipUser user = Membership.GetUser();
        //        Guid empid = new Guid(user.ProviderUserKey.ToString());
        //        Employee employee = emp1.getEmployeesbyIdForReq(empid);
        //        List<TimeSheetMaster> timeSheet = new List<TimeSheetMaster>();
        //        clsEmployeeTimeSheet clsEmployeetime = new clsEmployeeTimeSheet();
        //        List<TimeSheetMaster> listTimeSheet = clsEmployeetime.getAllTimeSheet(employee.EmployeeID);

        //        if (!string.IsNullOrEmpty(year))
        //        {
        //            listTimeSheet = listTimeSheet.Where(a => a.Year == year).ToList();
        //        }

        //        foreach (TimeSheetMaster time in listTimeSheet)
        //        {
        //            MembershipUser superviser = Membership.GetUser(time.Employee.UserID);
        //            time.Employee.Email = superviser.UserName;
        //            timeSheet.Add(time);
        //        }

        //        ViewData["ListTimeSheet"] = timeSheet;
        //        return PartialView(timeSheet);
        //    }
        //    catch (Exception ex)
        //    {
        //        TempData["error"] = "No data is available for timesheet.";
        //        return PartialView();
        //    }
        //}
        public ActionResult timeSheetPV(string status, string year)
        {
            try
            {
                ViewBag.year = year;

                List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
                ViewBag.yearsList = yearsList;

                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                List<TimeSheetMaster> timeSheet = new List<TimeSheetMaster>();
                clsEmployeeTimeSheet clsEmployeetime = new clsEmployeeTimeSheet();
                List<TimeSheetMaster> listTimeSheet = clsEmployeetime.getAllTimeSheetMasterByEmployeeId(employee.EmployeeID, status.ToLower().Trim());

                if (!string.IsNullOrEmpty(status) && status == "pending")
                {
                    ViewBag.status = status;
                    listTimeSheet = clsEmployeetime.getTimeSheetMasterAllRequests(employee.EmployeeID);
                }

                else if (!string.IsNullOrEmpty(status) && status != "all")
                {
                    ViewBag.status = status;
                    listTimeSheet = clsEmployeetime.getAllTimeSheetMasterByEmployeeId(employee.EmployeeID, status.ToLower().Trim());
                }
                else
                {
                    listTimeSheet = clsEmployeetime.getTimeSheetMasterAllRequest(employee.EmployeeID);
                }
                if (!string.IsNullOrEmpty(year))
                {
                    listTimeSheet = listTimeSheet.Where(a => a.Year == year).ToList();
                }
                foreach (TimeSheetMaster emp in listTimeSheet)
                {
                    MembershipUser superviser = Membership.GetUser(emp.Employee.UserID);
                    emp.Employee.Email = superviser.UserName;
                    timeSheet.Add(emp);
                }

                // Filter By Year


                ViewData["ListTimeSheet"] = timeSheet;
                return PartialView(timeSheet);


            }
            catch (Exception ex)
            {
                TempData["error"] = "No data is available for timesheet.";
                return PartialView();
            }
        }
        #endregion

        public ActionResult timesheetMaster()
        {
            try
            {
                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                List<SelectListItem> selectlist = new List<SelectListItem>();
                List<SelectListItem> selectedItem = new List<SelectListItem>();
                int year = DateTime.Now.Year;
                //List<int> lstYear = MVCSelectList.getYear(year);
                selectlist = MVCSelectList.getYear(year);
                ViewData["listYear"] = selectlist;
                selectedItem = MVCSelectList.getMonth();
                ViewData["listMonth"] = selectedItem;
                ViewData["EmpId"] = employee.EmployeeID;
                return View();
            }
            catch (Exception ex)
            {
                TempData["error"] = ex.Message;
                return View();
            }
        }

        [HttpPost]
        public ActionResult timesheetMaster(TimeSheetMaster timeSheet, Guid EmpId)
        {
            try
            {
                clsEmployeeTimeSheet clsEmp = new clsEmployeeTimeSheet();
                List<SelectListItem> selectlist = new List<SelectListItem>();
                List<SelectListItem> selectedItem = new List<SelectListItem>();
                int year = DateTime.Now.Year;

                //List<int> lstYear = MVCSelectList.getYear(year);
                selectlist = MVCSelectList.getYear(year);
                ViewData["listYear"] = selectlist;
                selectedItem = MVCSelectList.getMonth();
                ViewData["listMonth"] = selectedItem;
                ViewData["EmpId"] = EmpId;
                if (timeSheet != null)
                {


                    TimeSheetMaster timeSheetData = clsEmp.getTimeSheet(EmpId, timeSheet.Month, timeSheet.Year);
                    if (timeSheetData == null)
                    {
                        timeSheet.MonthNumber = MVCUtility.getMonthNumber(timeSheet.Month.ToLower());
                        timeSheet.TimeSheetMasterID = Guid.NewGuid();
                        timeSheet.EmpID = EmpId;
                        timeSheet.CreatedDate = DateTime.Now;
                        timeSheet.IsSubmit = false;
                        if (clsEmp.addMasterTimeSheet(timeSheet))
                        {
                            TempData["success"] = "Timesheet Add successfully.";
                            return RedirectToAction("editTimeSheet", new { month = timeSheet.Month, year = timeSheet.Year, timM_ID = timeSheet.TimeSheetMasterID });
                        }
                        else
                        {
                            TempData["error"] = "can't add timesheet. ";
                            return View(timeSheet);
                        }
                    }
                    else
                    {
                        return RedirectToAction("editTimeSheet", "Employee", new { timM_ID = timeSheetData.TimeSheetMasterID });

                    }
                }
                else
                {
                    TempData["error"] = "TimeSheet Data is not valid";
                    return View(timeSheet);
                }


            }
            catch (Exception ex)
            {
                TempData["error"] = "TimeSheet not created.";
                return View();
            }
        }


        public ActionResult timeSheetPage(string month, string year)
        {
            try
            {
                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
                clsEmployeeTimeSheet timesheet = new clsEmployeeTimeSheet();
                List<Project> lstEmpProject = new List<Project>();

                // get List of Project for employee
                List<EmployeeProject> lstProjects = timesheet.listProjects(employee.EmployeeID);

                foreach (EmployeeProject emp_project in lstProjects)
                {
                    Project project = timesheet.GetEmployeeProject(emp_project.ProjectID);

                    lstEmpProject.Add(project);
                }

                // find which Day is holiday 
                List<Holiday> holidayList = new List<Holiday>();
                Holiday holiday = new Holiday();

                // get Holiday List For this employee


                List<EmployeeHoilday> lstEmpHoliday = clsEmployeeLeave.getEmployeeHolidayList(employee.EmployeeID);
                foreach (EmployeeHoilday Empholiday in lstEmpHoliday)
                {
                    holiday = clsEmployeeLeave.GetHolidayListByID(Empholiday.HolidayID);


                    if (holiday.HolidayDate.Year.ToString() == year)
                    {
                        if (holiday.HolidayDate.ToString("MMM") == month)
                        {
                            holidayList.Add(holiday);
                        }

                    }
                }

                // get Leaves for TimeSheet

                List<EmployeeLeaveRequest> lstLeave = new List<EmployeeLeaveRequest>();
                EmployeeLeaveRequest LeaveReq = new EmployeeLeaveRequest();
                List<EmployeeLeaveRequest> listLeaveRequest = timesheet.getLeaveRequest(employee.EmployeeID);
                foreach (EmployeeLeaveRequest empLR in listLeaveRequest)
                {

                    if (empLR.FromDate.Value.Year.ToString() == year)
                    {

                        if (empLR.ToDate != null)
                        {
                            TimeSpan? timeSpan = empLR.ToDate - empLR.FromDate;
                            for (int i = 0; i <= timeSpan.Value.Days; i++)
                            {
                                DateTime dt = empLR.FromDate.Value.AddDays(i);
                                if (dt.Date.ToString("MMM") == month)
                                {
                                    lstLeave.Add(empLR);
                                }

                            }
                        }
                        else
                        {
                            if (empLR.FromDate.Value.ToString("MMM") == month)
                            {
                                lstLeave.Add(empLR);
                            }
                        }
                    }
                }

                //get TimeSheet for this month
                TimeSheetMaster timeSheet = timesheet.getTimeSheet(employee.EmployeeID, month, year);

                if (timesheet != null)
                {
                    ViewData["Data"] = timeSheet;
                }

                // get saturday sunday of this month

                ViewData["Month"] = month;
                ViewData["Year"] = year;

                ViewData["listLeave"] = lstLeave;
                ViewData["HolidayList"] = holidayList;
                ViewData["lstProjects"] = lstEmpProject;
                return View();
            }

            catch (Exception ex)
            {
                TempData["error"] = "some error occour during load this page.";
                return View();
            }
        }

        /// <summary>
        /// This method submits timesheet
        /// </summary>
        /// <param name="month"></param>
        /// <param name="year"></param>
        /// <returns></returns>
        public ActionResult IsSubmitTimeSheet(string month, string year)
        {
            try
            {
                clsEmployeeTimeSheet clsEmp = new clsEmployeeTimeSheet();
                clsEmployee objEmployee = new clsEmployee();
                Guid UserID = MVCUtility.getCurrentUserID();
                Employee employee = objEmployee.getEmployeesbyUserId(UserID);
                bool exist = false;

                #region get supervisor or alternative supervisor

                Guid? SupervisorUserID = null;// for temp
                string supervisorName = "";
                string supervisorEmail = "";
                Employee employeeforAltSuperviser = new Employee();
                if (employee.AlternativeSupervisorID.HasValue)
                {
                    employeeforAltSuperviser = objEmployee.getEmployeesbyId(employee.AlternativeSupervisorID.Value);
                    if (employeeforAltSuperviser != null)
                    {
                        DateTime dateNow = DateTime.Now;
                        if (employee.AltFromDate.HasValue && employee.AltEndDate.HasValue)
                        {
                            DateTime altFromDate = Convert.ToDateTime(employee.AltFromDate);
                            DateTime altToDate = Convert.ToDateTime(employee.AltEndDate);
                            if (dateNow <= altToDate && dateNow >= altFromDate)
                            {
                                exist = true;
                                SupervisorUserID = employeeforAltSuperviser.UserID;
                            }
                        }
                    }
                }
                else if (employee.SupervisorID.HasValue)
                {
                    Employee employeeforSuper = objEmployee.getEmployeesbyId(employee.SupervisorID.Value);
                    if (employeeforSuper != null)
                    {
                        exist = true;
                        SupervisorUserID = employeeforSuper.UserID;
                    }
                }
                if (exist)
                {
                    MembershipUser u = Membership.GetUser(SupervisorUserID);
                    supervisorEmail = u.Email;
                    supervisorName = u.Email;
                    try
                    {
                        Employee supervisorEmployee = objEmployee.getEmployeesbyUserId(new Guid(u.ProviderUserKey.ToString()));
                        supervisorName = string.Format("{0} {1}", supervisorEmployee.FirstNameEn, supervisorEmployee.LastNameEn);
                    }
                    catch (Exception ee)
                    {
                    }
                }
                #endregion

                #region get timesheet for this month and submit it
                TimeSheetMaster timesheet = clsEmp.getTimeSheet(employee.EmployeeID, month, year);
                if (timesheet != null)
                {
                    timesheet.IsSubmit = true;
                    timesheet.Status = null;
                    int _month = DateTime.ParseExact(month, "MMM", System.Globalization.CultureInfo.CurrentCulture).Month;
                    if (clsEmp.SubmitTimesheet(timesheet, _month, Convert.ToInt32(year), employee.EmployeeID, employee.EmployeeProjects) == true)
                    {

                        addLogTableEntry(timesheet.TimeSheetMasterID, employee.EmployeeID, "submit", "");

                        string employeeName = string.Format("{0} {1}", employee.FirstNameEn, employee.LastNameEn);
                        if (exist)
                        {
                            mailSendForTimeSheet(supervisorEmail, supervisorName, timesheet.TimeSheetMasterID, month, year, employee.EmployeeID, employeeName);
                        }
                        TempData["success"] = "TimeSheet submitted successfully.";
                        //return RedirectToAction("timeSheet");
                        string _url = Url.Content("~/Employee/timesheet");
                        return Json(new { success = true, msg = _url }, JsonRequestBehavior.AllowGet);
                    }

                }
                #endregion

                return Json(new { success = true, msg = "Error :Some unexpected error occured while processing your request. Timesheet submission failed." }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = true, msg = "Error :" + ex.Message }, JsonRequestBehavior.AllowGet);
            }

            //return RedirectToAction("timeSheet");
        }


        public ActionResult UpdateTimeSheet(string month, string year, string day, Guid proj_ID, Guid timeMID, string hrs, bool _delete = false)
        {

            try
            {
                clsEmployeeTimeSheet objEmployeeTimeSheet = new clsEmployeeTimeSheet();
                // manage data
                string str = day + month + year;
                DateTime dt = Convert.ToDateTime(str);
                if (_delete)
                {
                    objEmployeeTimeSheet.deleteEntry(timeMID, proj_ID, dt);
                    return Json(new { success = true, msg = "Timesheet saved successfully" }, JsonRequestBehavior.AllowGet);
                }

                TimeSheet timesheet = new TimeSheet();
                TimeSheet t = objEmployeeTimeSheet.getTimesheet(dt, proj_ID, timeMID);
                if (t != null)
                {
                    t.Hours = Convert.ToDecimal(hrs);
                    if (objEmployeeTimeSheet.editTimeSheet(t) == true)
                    {
                        return Json(new { success = true, msg = "Timesheet saved succesfully" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        return Json(new { success = false, msg = "Timesheet not saved" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    //save timesheet
                    timesheet.TimeSheetID = Guid.NewGuid();
                    timesheet.CreatedDate = DateTime.Now;
                    timesheet.Date = dt;
                    timesheet.ProjectID = proj_ID;
                    timesheet.TimeSheetMasterID = timeMID;
                    timesheet.Hours = Convert.ToDecimal(hrs);
                    if (objEmployeeTimeSheet.saveTimeSheet(timesheet) == true)
                    {

                        return Json(new { success = true, msg = "Timesheet saved successfully" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {

                        return Json(new { success = false, msg = "Timesheet not saved" }, JsonRequestBehavior.AllowGet);
                    }
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, msg = "Error:" + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult editTimeSheet(string month, string year, Guid timM_ID, string returnUrl)
        {
            try
            {

                ViewBag.returnUrl = returnUrl;
                bool canApproveDisapprove = false;
                clsEmployeeTimeSheet timesheet = new clsEmployeeTimeSheet();
                TimeSheetMaster timeS = timesheet.getDetailByTimesheetID(timM_ID);
                int _month = DateTime.ParseExact(timeS.Month, "MMM", System.Globalization.CultureInfo.CurrentCulture).Month;
                int _year = Convert.ToInt32(timeS.Year);

                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                dbHRSystemEntities db = new dbHRSystemEntities();

                Employee employee = timeS.Employee;
                ViewData["_EmpID"] = employee.EmployeeID;

                List<Project> lstEmpProject = new List<Project>();

                #region For Status

                string status = "";
                string message = "";
                string _status = !string.IsNullOrEmpty(timeS.Status) ? timeS.Status.ToLower().Trim() : "pending";
                if (timeS.IsSubmit == false && timeS.Status == null)
                {
                    status = "notsubmitted";
                }
                else if (timeS.IsSubmit == true && timeS.Status == null)
                {
                    status = "pending";
                }
                else if (timeS.Status.ToLower().Trim() == "disapproved")
                {
                    status = "disapproved";
                }
                else if (timeS.Status.ToLower().Trim() == "approved")
                {
                    status = "approved";
                }

                ViewBag.status = status;

                ApprovalDisapprovalAbility objAbility = MVCUtility.checkApprovalDisapprovalAbility(employee);
                ViewBag.canApproveDisapprove = objAbility.canApproveDisapprove;
                ViewBag.message = objAbility.message;

                #endregion

                objUtility.deleteAnyTSEntryIfWeekendHolidayOccurs(timeS.TimeSheetMasterID);

                Employee empL = clsEmployeeLeave.getEmployee(timeS.EmpID);

                if (timeS != null)
                {
                    year = timeS.Year;
                    month = timeS.Month;
                    ViewData["Timesheet"] = timeS;
                }

                #region Delete weekend Entry from timesheet table

                if (status == "notsubmitted")
                {
                    MVCUtility.deleteOldWeekendAndHolidays(employee.EmployeeID, timeS.TimeSheetMasterID);
                    objUtility.deleteUnusedTimesheetID(timeS.TimeSheetMasterID, employee.EmployeeID);
                }



                #endregion

                // ALSO NEED TO DELETE HOLIDAYS AND LEAVES

                // get detail for timesheet
                List<TimeSheet> listTimesheet = timesheet.getDetailByTime_M_ID(timeS.TimeSheetMasterID);
                //int mth = int.Parse(timeS.Month.ToString());
                //int yr = int.Parse(timeS.Year.ToString());
                DateTime fdt = Convert.ToDateTime(_year + "-" + _month + "-" + "28");
                DateTime tdt = Convert.ToDateTime(_year + "-" + _month + "-" + "1");
                
                if (status == "notsubmitted")
                {
                    // ONLY CURRENT WORKING PROJECTS
                    //lstEmpProject = employee.EmployeeProjects.Where(A => A.Working.HasValue && A.Working == true && A.ToDate.Value.Month >= _month && A.ToDate.Value.Year >= _year && A.FromDate.Value.Month <= _month && A.FromDate.Value.Year <= _year).Select(A => A.Project).ToList();
                    lstEmpProject = employee.EmployeeProjects.Where(A => A.Working.HasValue && A.Working == true && A.ToDate.Value >= tdt && A.FromDate.Value <= fdt).Select(A => A.Project).ToList();
                }
                else
                {
                    List<Guid?> timesheetsProjectIDS = timeS.TimeSheets.Select(A => A.ProjectID).Distinct().ToList();
                    //List<EmployeeProject> emProjlist = db.EmployeeProjects.Where(eproj => eproj.ToDate.Value.Month >= _month && eproj.ToDate.Value.Year >= _year && eproj.FromDate.Value.Month <= _month && eproj.FromDate.Value.Year <= _year && eproj.EmployeeID == timeS.EmpID).ToList();
                    List<EmployeeProject> emProjlist = db.EmployeeProjects.Where(eproj => eproj.ToDate.Value >= tdt && eproj.FromDate.Value <= fdt && eproj.EmployeeID == timeS.EmpID).ToList();
                   

                    List<Project> timesheetsProjects = (from tProject in emProjlist
                                                        join proj in db.Projects
                                                        on tProject.ProjectID equals proj.ProjectId
                                                        select proj).ToList();
                    lstEmpProject = timesheetsProjects;

                }
                // lstEmpProject = employee.EmployeeProjects.Select(A => A.Project).ToList();


                // get Holiday List For this employee

                List<Holiday> holidayList = employee.EmployeeHoildays
                    .Where(a => a.Holiday != null && a.Holiday.HolidayDate.Year == _year && a.Holiday.HolidayDate.Month == _month).Select(a => a.Holiday).ToList();

                // get Leaves for TimeSheet
                List<EmployeeLeaveRequest> leaveRequestList = (from item in employee.EmployeeLeaveRequests
                                                               where ((item.FromDate.HasValue && item.FromDate.Value.Month >= _month && item.FromDate.Value.Year == _year)
                                                               || (item.ToDate.HasValue && item.ToDate.Value.Month >= _month && item.ToDate.Value.Year == _year))
                                                               && (item.Status.ToLower().Trim() == "approved") && (item.Cancel != true)
                                                               select item).ToList();


                //get TimeSheet for this month
                TimeSheetMaster timeSheet = timesheet.getTimeSheet(employee.EmployeeID, month, year);

                if (timesheet != null)
                {
                    ViewData["Data"] = timeSheet;
                }


                if (listTimesheet.Count() > 0)
                {
                    ViewData["listTime"] = listTimesheet;
                }
                // get saturday sunday of this month

                ViewData["Month"] = month;
                ViewData["Year"] = year;
                ViewData["empID"] = empL.SupervisorID;
                ViewData["empIDByLeave"] = employee.EmployeeID;
                ViewData["listLeave"] = leaveRequestList;
                ViewData["HolidayList"] = holidayList;
                ViewData["lstProjects"] = lstEmpProject;
                return View();
            }

            catch (Exception ex)
            {
                TempData["error"] = "some error occour during load this page.";
                return View();
            }
        }


        #region Employee Leaves

        public ActionResult detailedLeaveForSupervisor(Guid? id, string returnUrl)
        {
            ViewBag.returnUrl = returnUrl;
            ViewBag.EmployeeId = id;
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ActionResult detailedLeaveForSupervisorPV(Guid? id, string status, string returnUrl)
        {
            ViewBag.returnUrl = returnUrl;
            ViewBag.EmployeeId = id;
            try
            {
                bool all = true;
                if (!string.IsNullOrEmpty(status))
                {
                    ViewBag.status = status;
                    all = false;
                }

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
                if (all == false)
                {
                    RequestList = RequestList.Where(a => a.Status.ToLower().Trim() == status).ToList();
                }
                // For Employee Specific Leaves Requests
                if (id.HasValue)
                {
                    RequestList = RequestList.Where(a => a.EmployeeID == id).ToList();
                }
                return PartialView(RequestList);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region Employee Pending Leaves
        public ActionResult PendingLeaves()
        {
            try
            {
                List<SelectListItem> selectList = new List<SelectListItem>();
                ViewData["List"] = selectList;

                List<SelectListItem> yearsList = MVCSelectList.getYearForTimeSheet();
                ViewBag.yearsList = yearsList;
                if (Request.QueryString["SelectedYear"] != null && Request.QueryString["SelectedYear"] != "")
                {
                    ViewBag._SelectedYearQuerystring = Request.QueryString["SelectedYear"];
                }
                return View();
            }
            catch (Exception ex)
            {
                return View();
            }
        }
        public ActionResult PendingLeavesPV(string status, int? year)
        {
            try
            {

                status = "pending";
                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                bool isSuperAdmin = MVCUtility.IsSuperAdmin();
                Employee employee = new Employee();
                if (!isSuperAdmin)
                {
                    employee = emp1.getEmployeesbyIdForReq(empid);
                }
                else
                {
                }
                clsEmployeeLeaves clsEmployee = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> lstLeaveRequest = new List<EmployeeLeaveRequest>();

                List<EmployeeLeaveRequest> emprequest = new List<EmployeeLeaveRequest>();
                if (!string.IsNullOrEmpty(status) && status != "all")
                {
                    ViewBag.status = status;
                    emprequest = clsEmployee.getAllLeaveRequestByEmployeeId(employee.EmployeeID, status.ToLower().Trim());
                }

                foreach (EmployeeLeaveRequest emp in emprequest)
                {
                    MembershipUser superviser = Membership.GetUser(emp.Employee.UserID);
                    emp.Employee.Email = superviser.UserName;
                    lstLeaveRequest.Add(emp);
                }

                // Filter By Year
                if (year.HasValue)
                {
                    lstLeaveRequest = lstLeaveRequest.Where(a => a.FromDate.HasValue && a.FromDate.Value.Year == year).ToList();
                }
                ViewBag._SelectedYear = year;
                return PartialView(lstLeaveRequest);


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }





        #endregion

        #region Employee Timesheet

        public ActionResult EmployeetimeSheet(Guid? id, string returnUrl)
        {
            ViewBag.EmployeeId = id;
            ViewBag.returnUrl = returnUrl;
            try
            {
                ViewData["Year"] = MVCSelectList.getYearForTimeSheet();
                return View();
            }
            catch (Exception ex)
            {
                TempData["error"] = "Can't find the data.";
                return View();
            }
        }
        public ActionResult EmployeetimeSheetPV(Guid? id, string year, string returnUrl)
        {
            ViewBag.EmployeeId = id;
            ViewBag.returnUrl = returnUrl;
            try
            {

                bool all = false;
                int _year = DateTime.Now.Year;
                if (!string.IsNullOrEmpty(year))
                {
                    _year = Convert.ToInt32(year);
                }
                else
                {
                    all = true;
                }
                clsEmployeeTimeSheet objTimesheet = new clsEmployeeTimeSheet();

                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);
               
                List<TimeSheetMaster> lstTimeSheetMaster = new List<TimeSheetMaster>();
                int dt = DateTime.Now.Year;
                bool isSuperAdmin = MVCUtility.IsSuperAdmin();
                bool isHR = MVCUtility.IsHR();
               
                if (isSuperAdmin || isHR)
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
                lstTimeSheetMaster = (from item in lstTimeSheetMaster.ToList()
                                      where (item.Status != null && item.Status.ToLower().Trim() == "approved")
                                      || (item.Status != null && item.Status.ToLower().Trim() == "disapproved")
                                      || (item.Status == null && item.IsSubmit == true)
                                      select item).ToList();


                if (all == false)
                {
                    //filter by year
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.Year == year).ToList();
                }
                // For Employee Specific Employee Timesheet
                if (id.HasValue)
                {
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.EmpID == id).ToList();
                    
                }
                return PartialView(lstTimeSheetMaster);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region Timesheet with projects

        public ActionResult timeSheetWithProjects(Guid? id, string returnUrl)
        {
            ViewBag.EmployeeId = id;
            ViewBag.returnUrl = returnUrl;
            try
            {

                ViewData["Year"] = MVCSelectList.getYearForTimeSheet();
                return View();
            }
            catch (Exception ex)
            {
                TempData["error"] = "Can't find the data.";
                return View();
            }
        }

        public ActionResult timeSheetWithProjectsPV(Guid? id, string year, string returnUrl)
        {
            ViewBag.EmployeeId = id;
            ViewBag.returnUrl = returnUrl;
            try
            {
                bool all = false;
                int _year = DateTime.Now.Year;
                if (!string.IsNullOrEmpty(year))
                {
                    _year = Convert.ToInt32(year);
                }
                else
                {
                    all = true;
                }
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
                if (all == false)
                {
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.Year == year).ToList();
                }

                // For Employee Specific Timesheet with projects
                if (id.HasValue)
                {
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.EmpID == id).ToList();
                }
                return PartialView(lstTimeSheetMaster);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        #endregion

        #region EmployeeProjects

        public ActionResult EmployeeProjects(Guid id, string returnUrl)
        {
            ViewBag.returnUrl = returnUrl;
            ViewBag.EmployeeId = id;
            return View();
        }

        #endregion

        public ActionResult VacationsBalance()
        {
            try
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                ViewBag.employeeID = employeeID;
                return View();
            }
            catch (Exception ex)
            {
                TempData["error"] = "some error occcoured during get data.";
                return View();
            }
        }

        public ActionResult VacationsBalancePV(Guid? EmployeeId, bool isEmployee)
        {
            try
            {
                clsEmployeeLeaves objEmployeeLeave = new clsEmployeeLeaves();

                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);

                // get all Leaves assigned for current employee
                List<EmployeeLeaf> listEmployeeLeave = objEmployeeLeave.getEmployeesbyId(employee.EmployeeID);
                LeaveType leave = new LeaveType();
                List<LeaveType> listLeaveType = new List<LeaveType>();
                foreach (LeaveType leaveType in listLeaveType)
                {
                    leave = objEmployeeLeave.getLeveTypeByID(leaveType.LeaveTypeID);
                    listLeaveType.Add(leaveType);
                }
                if (listLeaveType != null)
                {
                    ViewData["ListLeaveType"] = listEmployeeLeave;
                }

                return PartialView(listEmployeeLeave);
            }
            catch (Exception ex)
            {
                TempData["error"] = "some error occurred during get data.";
                return PartialView();
            }
        }


        public ActionResult timeSheetWithProjectsForHR()
        {
            try
            {
                ViewData["Year"] = MVCSelectList.getYearForTimeSheet();
                return View();
            }
            catch (Exception ex)
            {
                TempData["error"] = "Can't find the data.";
                return View();
            }
        }
        public ActionResult timeSheetWithProjectsPVForHR(string year)
        {
            try
            {

                if (year == null)
                {
                    year = DateTime.Now.ToString("yyy");
                }
                if (year == "")
                {
                    TempData["error"] = "please select valid year.";
                    return PartialView();
                }
                clsEmployeeTimeSheet objTimesheet = new clsEmployeeTimeSheet();

                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());
                Employee employee = emp1.getEmployeesbyIdForReq(empid);


                List<TimeSheetMaster> lstTimeSheetMaster = new List<TimeSheetMaster>();
                int dt = DateTime.Now.Year;

                lstTimeSheetMaster = objTimesheet.getAllForHR();
                if (lstTimeSheetMaster == null)
                {
                    TempData["error"] = "";
                    return PartialView();
                }
                else
                {
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.Year == year).ToList();
                    //if (Request.Cookies["country"] != null)
                    //{

                    //    Guid c_ID = new Guid(Request.Cookies["country"].Value);

                    //    lstLeaveRequest = lstLeaveRequest.Where(a => a.Employee.CountryID == c_ID).ToList();

                    //}
                    return PartialView(lstTimeSheetMaster);
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult printTimesheet(string month, string year, Guid timM_ID,string pagenumber)
        {
            try
            {
                string p_num = "0";
                if (pagenumber != null && pagenumber.ToString() != "")
                {
                    p_num = pagenumber;
                }
                ViewBag.Page = p_num;

                clsEmployeeTimeSheet objTimeSheet = new clsEmployeeTimeSheet();
                TimeSheetMaster timeSheetMaster = objTimeSheet.getDetailByTimesheetID(timM_ID);
                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                List<TimeSheet> listTiimeSheet = objTimeSheet.getDetailByTime_M_ID(timeSheetMaster.TimeSheetMasterID);
                listTiimeSheet = listTiimeSheet.Where(a => a.Date.Value.ToString("yyyy") == year && a.Date.Value.ToString("MMM") == month).ToList();
               
                int _month = DateTime.ParseExact(timeSheetMaster.Month, "MMM", System.Globalization.CultureInfo.CurrentCulture).Month;
                int _year = Convert.ToInt32(timeSheetMaster.Year);
                Employee employee = timeSheetMaster.Employee;


                // get Holiday List For this employee

                List<Holiday> holidayList = employee.EmployeeHoildays
                    .Where(a => a.Holiday != null && a.Holiday.HolidayDate.Year == _year && a.Holiday.HolidayDate.Month == _month).Select(a => a.Holiday).ToList();


                // get Leaves for TimeSheet

                List<EmployeeLeaveRequest> lstLeave = new List<EmployeeLeaveRequest>();
                EmployeeLeaveRequest LeaveReq = new EmployeeLeaveRequest();

                // get Leaves for TimeSheet
                List<EmployeeLeaveRequest> leaveRequestList = (from item in employee.EmployeeLeaveRequests
                                                               where ((item.FromDate.HasValue && item.FromDate.Value.Month == _month && item.FromDate.Value.Year == _year)
                                                               || (item.ToDate.HasValue && item.ToDate.Value.Month == _month && item.ToDate.Value.Year == _year))
                                                               && (item.Status.ToLower().Trim() == "approved") && (item.Cancel != true)
                                                               select item).ToList();
                ViewData["listLeave"] = leaveRequestList;
                ViewData["HolidayList"] = holidayList;
                ViewData["Month"] = month;
                ViewData["Year"] = year;
                ViewData["ListTimesheet"] = listTiimeSheet;
                ViewData["timesheetMaster"] = timeSheetMaster;
                return View();
            }
            catch (Exception ex)
            {
                TempData["error"] = "some problem occour during printing,";
                return View();
            }
        }


        public bool mailSend(string email, string ClientName, string message)
        {
            try
            {
                sendMail send = new sendMail();

                string EmailTitle = "Leave Request";
                string subjects = "Leave Request from Employee";
                //string Message = "<table><tr><th>Request from</th></tr><tr><td>Username   :" + username + "</td></tr></table>";
                string Message = message;
                string SiteUrl = WebConfigurationManager.AppSettings["WebsiteUrl"]; ;
                string SiteLogUrl = WebConfigurationManager.AppSettings["SiteLogUrl"];
                string WebsiteUrl = WebConfigurationManager.AppSettings["WebsiteUrl"];
                string websitename = WebConfigurationManager.AppSettings["WebSiteName"];
                string html = sendMail.getMailHTML(websitename, EmailTitle, ClientName, Message, SiteUrl, SiteLogUrl, WebsiteUrl).ToString();
                bool mail = send.MailSender(email, html, subjects);
                return mail;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool mailSendForTimeSheet(string email, string supervisorName, Guid timesheetID, string month, string year, Guid EmployeeID, string employeeName)
        {
            try
            {
                sendMail send = new sendMail();
                string username = email;
                string WebsiteUrl = WebConfigurationManager.AppSettings["WebUrl"];
                string link = WebsiteUrl + "Employee/TimesheetSummary?EmployeeID=" + EmployeeID + "&TimesheetMasterId=" + timesheetID;
                string to = email;
                string _message = string.Format("{0} has submitted his timesheet of {1} {2}", employeeName, month, year);
                string EmailTitle = "Timesheet Submitted";
                string subjects = "Timesheet Submitted By Employee -" + employeeName;
                string Message = "<table>";
                Message += "<tr><td>" + _message + "</td></tr>";
                Message += "<tr><td>For more detail </td></tr>";
                Message += "<tr><td><a href=" + link + " >Click here</a></td></tr>";
                Message += "</table>";
                string SiteUrl = "";
                string SiteLogUrl = WebConfigurationManager.AppSettings["SiteLogUrl"];


                string websitename = "HR System";
                string html = sendMail.getMailHTML(websitename, EmailTitle, supervisorName, Message, SiteUrl, SiteLogUrl, WebsiteUrl).ToString();
                bool mail = send.MailSender(to, html, subjects);
                return mail;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        public bool ApproveTimeSheet(Guid id, bool approve, bool IsRecall)
        {
            try
            {
                string EmployeeName = "";
                string WebsiteUrl = WebConfigurationManager.AppSettings["WebUrl"];
                sendMail mail = new sendMail();

                string status = approve ? "approved" : "disapproved";
                bool isSubmit = approve ? true : false;
                dbHRSystemEntities db = new dbHRSystemEntities();
                TimeSheetMaster master = db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == id).FirstOrDefault();

                if (IsRecall)
                {
                    // Make it to not submitted
                    master.IsSubmit = false;
                    master.Status = null;
                }
                else
                {
                    // Either approve or disapprove
                    master.IsSubmit = isSubmit;
                    master.Status = status;
                }
                db.SaveChanges();

                //send mail with messgae and link to timesheet
                string link = WebsiteUrl + "Employee/editTimeSheet?month=" + master.Month + "&year=" + master.Year + "&timM_ID=" + master.TimeSheetMasterID;
                try
                {
                    string email = master.Employee.Email;
                    string EmailTitle = "Timesheet Approval/Disapproval";
                    string subjects = "Timesheet Approval/Disapproval";
                    string Message = "";
                    if (approve)
                    {
                        Message += "<table><tr><td>Congratulations !</td></tr>";
                        Message += "<tr><td>Your timesheet of " + master.Month + "," + master.Year + " has been approved.</td></tr>";
                        Message += "<tr><td><a href='" + link + "'>Click here to view detail</a></td></tr>";
                        Message += "</table>";
                    }
                    else
                    {
                        string approvalString = IsRecall ? "recalled" : "disapproved";

                        Message += "<table>";
                        Message += "<tr><td>Your timesheet of " + master.Month + "," + master.Year + " has been " + approvalString + ".</td></tr>";
                        Message += "<tr><td><a href='" + link + "'>Click here to view detail</a></td></tr>";
                        Message += "</table>";
                    }
                    EmployeeName = email;
                    try { EmployeeName = string.Format("{0} {1}", master.Employee.FirstNameEn, master.Employee.LastNameEn); }
                    catch (Exception ee) { EmployeeName = email; }

                    string SiteUrl = "";
                    string SiteLogUrl = WebConfigurationManager.AppSettings["SiteLogUrl"];

                    // WebsiteUrl += "Employee/editTimeSheet?timM_ID=" + master.TimeSheetMasterID;
                    string websitename = "HR System";
                    string html = sendMail.getMailHTML(websitename, EmailTitle, EmployeeName, Message, SiteUrl, SiteLogUrl, WebsiteUrl).ToString();
                    bool res = mail.MailSender(email, html, subjects);
                }
                catch (Exception ee)
                {

                }
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        #region My Project(s) timesheet

        public ActionResult MyProjects()
        {
            return View();
        }

        public ActionResult MyProjectsPV()
        {
            try
            {
                return PartialView();
            }
            catch (Exception ee)
            {
                return new EmptyResult();
            }
        }

        #endregion

        #region My Projects

        public ActionResult MyProjectsList()
        {
            try
            {
                Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                ViewBag.employeeID = employeeID;
                return View();
            }

            catch (Exception ex)
            {
                throw ex;
            }


        }

        public ActionResult MyProjectsListPV(string id, string returnUrl, bool publicEmployee)
        {
            ViewBag.returnUrl = returnUrl;
            ViewBag.publicEmployee = publicEmployee;
            var GuidID = new Guid(id);
            Employee emp = _objEmployee.getEmployeesbyId(GuidID);
            if (emp != null)
            {
                string name = emp.FirstNameEn + " " + emp.LastNameEn;
                ViewBag.Name = name;
            }

            ViewBag.employeeID = id;
            EmpProjDetailsList ObjempProjList = new EmpProjDetailsList();
            List<EmpProjDetails> empProjList = ObjempProjList.getEmpProjDetailsList(GuidID);
            return PartialView(empProjList);
        }

        #endregion
        #region Action For: AddProject
        public ActionResult AddProject(string id)
        {
            Guid EmpID = new Guid(Convert.ToString(id));
            ViewBag.CurrentCountryID = CurrentCountryID;
            ViewBag._JobID = MVCSelectList.getAllJobTypes();
            ViewBag.EmployeeID = EmpID;
            return View();

        }

        [HttpPost]
        public ActionResult AddProject(FormCollection fc)
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
            return Json(new { success = false, msg = "Error: Some error occurred while adding employee" }, JsonRequestBehavior.AllowGet);
        
        }
        #endregion

        //public ActionResult EmployeeWisetimeSheet()
        //{

        //    try
        //    {
        //        ViewData["Year"] = MVCSelectList.getYearForTimeSheet();
        //        return View();
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public ActionResult EmployeeWiseTimeSheetRep(string month, string year)
        //{
        //    TimeSheetReportList tsrListObj = new TimeSheetReportList();
        //    return PartialView(tsrListObj.getTimeSheetReport(month, year));
        //}

        #region Manage Staff

        public ActionResult ManageStaff()
        {

            return View();
        }

        public ActionResult ManageStaffPV()
        {
            try
            {
                dbHRSystemEntities db = new dbHRSystemEntities();
                List<Employee> li = _objEmployee.getEmployees();
                if (MVCUtility.IsSuperAdmin())
                {
                    li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
                }
                else
                {
                    // employee as supervisor
                    DateTime todayDate = DateTime.Now.Date;
                    Guid? supervisorID = MVCUtility.getCurrentEmployeeID();
                    li = (from emp in li
                          where emp.CountryID == CurrentCountryID &&
                          (emp.SupervisorID == supervisorID || (emp.AlternativeSupervisorID == supervisorID && todayDate >= emp.AltFromDate && todayDate <= emp.AltEndDate))
                          select emp).ToList();
                }

                li = (from item in li
                      join user in db.aspnet_Membership
                      on item.UserID equals user.UserId
                      where user.IsApproved == true
                      select item).ToList();

                return PartialView(li);
            }
            catch (Exception ee)
            {
                throw ee;
                // return new EmptyResult();
            }

        }

        #endregion

        #region Pending Timesheets

        public ActionResult PendingTimesheets()
        {
            ViewData["Year"] = MVCSelectList.getYearForTimeSheet();
            try
            {
                return View();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult PendingTimesheetsPV(Guid? id, string year)
        {

            ViewBag.EmployeeId = id;
            try
            {

                bool all = false;
                int _year = DateTime.Now.Year;
                if (!string.IsNullOrEmpty(year))
                {
                    _year = Convert.ToInt32(year);
                }
                else
                {
                    all = true;
                }
                clsEmployeeTimeSheet objTimesheet = new clsEmployeeTimeSheet();
                clsEmployee emp1 = new clsEmployee();
                MembershipUser user = Membership.GetUser();
                Guid empid = new Guid(user.ProviderUserKey.ToString());             
                Employee employee = emp1.getEmployeesbyIdForReq(empid);

                //changes made on 30-Jan-2014
                // I have added line code which is below 
                List<Employee> userUnderCurrentUserList = db.Employees.Where(cu => cu.SupervisorID == employee.EmployeeID || cu.AlternativeSupervisorID == employee.EmployeeID).ToList();

                List<TimeSheetMaster> lstTimeSheetMaster = new List<TimeSheetMaster>();
                int dt = DateTime.Now.Year;
                bool isSuperAdmin = MVCUtility.IsSuperAdmin();
                bool isHR = MVCUtility.IsHR();
                if (isSuperAdmin || isHR)
                {
                    lstTimeSheetMaster = objTimesheet.getTimeSheetForSuperadmin(CurrentCountryID);
                }
                else
                {

                    var allTimeSheetOfUserUnderMe = db.TimeSheetMasters.ToList();
               
                    //List<TimeSheetMaster> listTimeSheetMasterAsSV = objTimesheet.getTimeSheetBySupervisorID(employee.SupervisorID, CurrentCountryID);
                    List<TimeSheetMaster> listTimeSheetMasterAsSV = allTimeSheetOfUserUnderMe.ToList();
                    List<TimeSheetMaster> lstTimesheetMasterASAlternativeSV = objTimesheet.getTimeSheetByAltSupervisorID(employee.SupervisorID, CurrentCountryID);

                    listTimeSheetMasterAsSV.AddRange(lstTimesheetMasterASAlternativeSV);
                    listTimeSheetMasterAsSV = listTimeSheetMasterAsSV.Distinct().ToList();
                    lstTimeSheetMaster = listTimeSheetMasterAsSV.Where(a => a.IsSubmit == true && a.Status == null).ToList();
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.Employee.SupervisorID==employee.EmployeeID).ToList();

                }


                if (all == false)
                {
                    //filter by year
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.IsSubmit == true && a.Status == null).ToList();
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.Year == year).ToList();
                }
                // For Employee Specific Employee Timesheet
                if (id.HasValue)
                {
                    lstTimeSheetMaster = lstTimeSheetMaster.Where(a => a.EmpID == id).ToList();
                }
                return PartialView(lstTimeSheetMaster);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        #endregion

        #region Timesheet Summary

        public ActionResult TimesheetSummary(Guid EmployeeID, Guid TimesheetMasterId, string returnUrl, string encryptedUrl)
        {
            ViewBag.encryptedUrl = encryptedUrl;
            ViewBag.EmployeeID = EmployeeID;
            ViewBag.returnUrl = returnUrl;
            ViewBag.TimeSheetMasterID = TimesheetMasterId;

            bool result = objUtility.deleteAnyTSEntryIfWeekendHolidayOccurs(TimesheetMasterId);

            return View();
        }

        public ActionResult TimesheetSummaryPV(Guid EmployeeID, Guid TimesheetMasterId, string returnUrl, string encryptedUrl)
        {

            Employee empoyeeObj = _objEmployee.getEmployeesbyId(EmployeeID);
            ViewBag.Employee = empoyeeObj;
            ViewBag.returnUrl = returnUrl;
            ViewBag.encryptedUrl = encryptedUrl;
            TimeSheetMaster obj = _objTimesheet.getTimesheetByID(TimesheetMasterId);
            ViewBag.TimesheetMaster = obj;
            List<LeaveSummaryVM> li = _objLeaveSummary.getLeaveSummary(empoyeeObj, TimesheetMasterId, obj);
            ViewBag.monthyear = string.Format("{0} - {1}", obj.Month, obj.Year);
            ViewBag.totalHours = "Total working hour - " + li.Sum(a => a.hour);
            ViewBag.totalProductiveHours = "Prodcutive working hour is " + li.Where(a => a.isLeave == false).Sum(a => a.hour);
            bool approved = false;
            string status = "";
            if (obj.IsSubmit == true)
            {
                if (obj.Status != null && obj.Status.ToLower().Trim() == "approved")
                {
                    status = "Timesheet Is Approved";
                    approved = true;
                }
                else
                {
                    status = "Timesheet Is Pending (Submitted)";
                }
            }
            else
            {
                status = "Timesheet Is Not Submitted";
            }

            ViewBag.status = status;
            ViewBag.approved = approved;
            ApprovalDisapprovalAbility objAbility = MVCUtility.checkApprovalDisapprovalAbility(empoyeeObj);
            ViewBag.canApproveDisapprove = objAbility.canApproveDisapprove;
            ViewBag.message = objAbility.message;

            return PartialView(li);
        }

        [HttpPost]
        public ActionResult TimesheetApproval(string notes, Guid EmployeeID, Guid timesheetMasterID, bool approve)
        {
            try
            {
                //(Submit, Approve, Reject, Cancel)
                Guid? currentEmployeeID = MVCUtility.getCurrentEmployeeID();
                dbHRSystemEntities db = new dbHRSystemEntities();
                TimeSheetMaster objTimesheet = db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == timesheetMasterID).FirstOrDefault();
                string operation = approve ? "approve" : "reject";

                addLogTableEntry(timesheetMasterID, currentEmployeeID, operation, notes);
                bool result = ApproveTimeSheet(timesheetMasterID, approve, false);
                if (result)
                {
                    if (operation == "approve")
                    {
                        string message = string.Format("Your timesheet of {0}-{1} has been approved", objTimesheet.Month, objTimesheet.Year);
                        addNotification(objTimesheet.EmpID.Value, message);
                        TempData["success"] = "Timesheet approved successfully";
                    }
                    else
                    {
                        string message = string.Format("Your timesheet of {0}-{1} has been disapproved", objTimesheet.Month, objTimesheet.Year);
                        addNotification(objTimesheet.EmpID.Value, message);
                        TempData["success"] = "Timesheet disapproved successfully";
                    }
                }
                else
                {
                    TempData["error"] = "Timesheet approval failed. Some error occured.";
                }
            }
            catch (Exception ee)
            {
                TempData["error"] = "Error :" + ee.Message;
            }
            return RedirectToAction("PendingTimesheets");
        }

        #endregion

        #region Timesheet Log / Leave Log

        public ActionResult TimesheetLog(Guid TimesheetMasterId)
        {
            List<LogTable> li = db.LogTables.Where(a => a.ItemID == TimesheetMasterId).OrderBy(a => a.RecordDate).ToList();
            return PartialView(li);
        }

        public ActionResult LeaveLog(Guid LeaveID)
        {
            List<LogTable> li = db.LogTables.Where(a => a.ItemID == LeaveID).OrderBy(a => a.RecordDate).ToList();
            return PartialView(li);
        }
        #endregion

        #region Add LogTableEntry


        private void addLogTableEntry(Guid itemID, Guid? EmployeeID, string operation, string notes)
        {
            clsLogTable objLog = new clsLogTable();

            LogTable logObj = new LogTable();
            logObj.LogID = Guid.NewGuid();
            logObj.Notes = notes;
            logObj.EmployeeID = EmployeeID;
            logObj.Operation = operation;
            logObj.RecordDate = DateTime.Now;
            logObj.ItemID = itemID;
            objLog.addLogTableEntry(logObj);
        }
        #endregion

        #region EmployeeFiles
        [Authorize(Roles = "superadmin,hr")]
        public ActionResult EmployeeFiles()
        {
            return View();
        }

        public ActionResult EmployeeFilesPV()
        {
            try
            {
                dbHRSystemEntities db = new dbHRSystemEntities();
                List<Employee> li = _objEmployee.getEmployees().Where(a => a.CountryID == CurrentCountryID).ToList();
                li = (from item in li
                      join user in db.aspnet_Membership
                      on item.UserID equals user.UserId
                      where user.IsApproved == true
                      select item).ToList();

                return PartialView(li);
            }
            catch (Exception ee)
            {
                throw ee;
                // return new EmptyResult();
            }

        }
        #endregion


        #region HR Functions
        [Authorize(Roles = "superadmin,hr")]
        public ActionResult HRFunctions()
        {
            return View();
        }

        public ActionResult HRFunctionsPV()
        {
            List<Employee> emplList = new List<Employee>();
            emplList = _objEmployee.getEmployees().OrderBy(a => a.FirstNameEn).Where(a => a.CountryID == CurrentCountryID && a.UserID != null).ToList();
            //if (MVCUtility.IsSuperAdmin())
            //{
            //    emplList = _objEmployee.getEmployees().OrderBy(a => a.FirstNameEn).Where(a => a.CountryID == CurrentCountryID).ToList();
            //}
            //else
            //{
            //    Guid? employeeID = MVCUtility.getCurrentEmployeeID();

            //    DateTime todaysDate = DateTime.Now.Date;

            //    emplList = (from e in _objEmployee.getEmployees()
            //                where e.CountryID == CurrentCountryID &&
            //                (e.SupervisorID == employeeID || (e.AlternativeSupervisorID == employeeID && todaysDate >= e.AltFromDate && todaysDate <= e.AltEndDate))
            //                select e).ToList();

            //}
            return PartialView(emplList);
        }


        public ActionResult HRFunctionsTerminate(Guid id)
        {
            ViewBag.id = id.ToString();
            return View();
        }



        public ActionResult HRFunctionUnterminate(Guid id, Guid uid)
        {
            dbHRSystemEntities fm = new dbHRSystemEntities();
            var ed = fm.Employees.Find(id);
            ed.IsTerminated = false;
            ed.Termination_Date = null;
            ed.Termination_Reason = "";
            ed.Comments = "";
            ed.LeaveBalacneAtTermination = null;

            if (_objEmployee.updateTerminationDetail(ed))
            {
                MembershipUser usr = Membership.GetUser(uid);
                usr.IsApproved = true;
                Membership.UpdateUser(usr);
                TempData["success"] = "Employee Un-Terminated Successfully!";
                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                TempData["error"] = "Error in Employee Un-Termination!";
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult HRFunctionsTerminatePV(Guid id, string TerinateType)
        {
            dbHRSystemEntities fm = new dbHRSystemEntities();
            var ed = fm.Employees.Find(id);
            ed.IsTerminated = true;
            if (TerinateType == "T")
            {
                ViewBag.TerinateType = "T";
            }
            else
                if (TerinateType == "UT")
                {
                    ViewBag.TerinateType = "UT";
                }

            ViewBag.id = id.ToString();
            return PartialView(ed);
        }

        [HttpPost]
        public ActionResult HRFunctionsTerminatePV(Employee emp)
        {
            dbHRSystemEntities fm = new dbHRSystemEntities();
            try
            {
                if (ModelState.IsValid)
                {
                    if (_objEmployee.updateTerminationDetail(emp))
                    {
                        MembershipUser usr = Membership.GetUser(emp.UserID);
                        usr.IsApproved = false;
                        Membership.UpdateUser(usr);
                        TempData["success"] = "Employee Terminated Successfully!";
                        return Json(new { success = true }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        TempData["error"] = "Error in Employee Termination!";
                        //RedirectToAction("HRFunctions");
                        return Json(new { success = true, id = emp.EmployeeID }, JsonRequestBehavior.AllowGet);
                    }

                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Error: " + e.Message);
            }

            return Json(new { success = false }, JsonRequestBehavior.AllowGet);

        }

        public decimal getTermationBalance(string date, Guid id)
        {
            decimal balance = 0;
            try
            {
                balance = Math.Round(_objEmployee.getTermationBalance(Convert.ToDateTime(date), id), 2);
            }
            catch (Exception ex)
            { }
            return balance;
        }


        [Authorize(Roles = "superadmin,hr")]
        public ActionResult CarryForwardProcess()
        {
            List<SelectListItem> EmployeeList = MVCSelectList.getAllEmployee(CurrentCountryID);
            string str = "";
            if (EmployeeList != null && EmployeeList.Count > 0)
            {

                foreach (var item in EmployeeList)
                {
                    str += item.Value + ",";
                }
            }
            ViewBag._EID = str;
            return View();
        }
        public ActionResult getAllEmployeeIDCommaSasprated()
        {
        
            List<SelectListItem> EmployeeList = MVCSelectList.getAllEmployee(CurrentCountryID);
            string str="";
            if(EmployeeList!=null && EmployeeList.Count>0)
            {
            
                foreach(var item in EmployeeList)
                {
                str+=item.Value+",";
                }
            }
            return Json(new {d=str},JsonRequestBehavior.AllowGet);
        }

        #endregion


        #region Leave Summary

        public ActionResult LeaveSummary(Guid employeeID, string returnUrl)
        {
            ViewBag.returnUrl = returnUrl;
            ViewBag.employeeID = employeeID;
            return View();
        }

        public ActionResult LeaveSummaryPV(Guid employeeID, string returnUrl)
        {
            Employee empoyeeObj = _objEmployee.getEmployeesbyId(employeeID);
            ViewBag.returnUrl = returnUrl;
            ViewBag.Employee = empoyeeObj;

            MVCUtility objMVCUtility = new MVCUtility();
            List<EmployeeLeaveModified> li = objMVCUtility.getLeaveSummary(employeeID);

            return PartialView(li);
        }

        public ActionResult LeaveDetails(Guid employeeID, string status, Guid leaveTypeId, bool isReport = false)
        {

            ViewBag.isReport = isReport;
            ViewBag.EmployeeId = employeeID;
            try
            {
                bool all = true;
                if (!string.IsNullOrEmpty(status))
                {
                    ViewBag.status = status;
                    all = false;
                }

                clsEmployeeLeaves clsemployeeLeave = new clsEmployeeLeaves();
                clsEmployee objEmployee = new clsEmployee();
                Employee employee = objEmployee.getEmployeesbyId(employeeID);

                List<EmployeeLeaveRequest> lstLeaveRequest = new List<EmployeeLeaveRequest>();
                int dt = DateTime.Now.Year;
                List<EmployeeLeaveRequest> RequestList = new List<EmployeeLeaveRequest>();

                RequestList = clsemployeeLeave.getLeaveRequestForSuperadmin(CurrentCountryID);

                //if (MVCUtility.IsSuperAdmin())
                //{
                //    RequestList = clsemployeeLeave.getLeaveRequestForSuperadmin(CurrentCountryID);
                //}
                //else
                //{

                //    List<EmployeeLeaveRequest> lstLeaverequestAsSV = clsemployeeLeave.getLeaveRequestBySupervisorID(employee.EmployeeID, CurrentCountryID);
                //    List<EmployeeLeaveRequest> lstLeaverequestAsAlternativeSV = clsemployeeLeave.getLeaveRequestByAltSupervisorID(employee.EmployeeID, CurrentCountryID);
                //    lstLeaverequestAsSV.AddRange(lstLeaverequestAsAlternativeSV);
                //    RequestList = lstLeaverequestAsSV.Distinct().ToList();
                //}
                //if (all == false)
                //{
                //    RequestList = RequestList.Where(a => a.Status.ToLower().Trim() == status).ToList();
                //}

                ViewBag.Name = string.Format("{0} {1}", employee.FirstNameEn, employee.LastNameEn);
                RequestList = RequestList.Where(a => a.EmployeeID == employee.EmployeeID && a.LeaveTypeID == leaveTypeId).ToList();
                return PartialView(RequestList);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Update Holidays

        public ActionResult UpdateHolidays(Guid employeeid, Guid holidayId, bool add)
        {
            try
            {
                EmployeeHoilday empHday = db.EmployeeHoildays.Where(a => a.EmpID == employeeid && a.HolidayID == holidayId).FirstOrDefault();
                if (add)
                {
                    //add if not exist
                    if (empHday == null)
                    {
                        EmployeeHoilday objHoliday = new EmployeeHoilday();
                        objHoliday.EmpID = employeeid;
                        objHoliday.HolidayID = holidayId;
                        objHoliday.EmployeeHoildayID = Guid.NewGuid();
                        db.EmployeeHoildays.Add(objHoliday);
                        db.SaveChanges();
                    }
                    return Json(new { success = true, msg = "Holiday assigned successfully" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    // delete if exist
                    if (empHday != null)
                    {
                        db.EmployeeHoildays.Remove(empHday);
                        db.SaveChanges();
                    }
                    return Json(new { success = true, msg = "Holiday removed successfully" }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ee)
            {
                return Json(new { success = false, msg = "Error :" + ee.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        #endregion

        #region Timesheet Recall

        public ActionResult RecallTimesheet(Guid timesheetMasterID)
        {
            dbHRSystemEntities db = new dbHRSystemEntities();
            TimeSheetMaster objTimesheet = db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == timesheetMasterID).FirstOrDefault();

            if (ApproveTimeSheet(timesheetMasterID, false, true))
            {
                string message = string.Format("Your timesheet of {0}-{1} has been recalled", objTimesheet.Month, objTimesheet.Year);
                addNotification(objTimesheet.EmpID.Value, message);

                TempData["Success"] = "Timesheet recalled successfully";
                return Json(new { success = true, msg = "Timesheet recalled successfully" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                TempData["Success"] = "Timesheet recalled failed. Some error occured.";
                return Json(new { success = false, msg = "Timesheet recalled failed" }, JsonRequestBehavior.AllowGet);
            }
        }
        #endregion

        public void addNotification(Guid employeeID, string message)
        {
            Notification obj = new Notification();
            obj.NotificationID = Guid.NewGuid();
            obj.EmployeeID = employeeID;
            obj.NotinficationTime = DateTime.Now;
            obj.IsRead = false;
            obj.Message = message;
            obj.Url = string.Format("~/Notification/Detail/{0}", obj.NotificationID);
            bool result = _objNotification.addNotification(obj);
        }

        public bool addnewProjectToTimeSheet(Guid uid, Guid pID)
        {
            string year = System.DateTime.Now.Year.ToString();
            var tsid = db.TimeSheetMasters.Where(t => t.Year == year && t.MonthNumber == System.DateTime.Now.Month && t.EmpID == uid && t.Status == "disapproved").FirstOrDefault();
            Guid tsmid = tsid != null ? tsid.TimeSheetMasterID : new Guid();
            TimeSheet workingday = db.TimeSheets.Where(ts => ts.TimeSheetMasterID == tsmid && ts.isOff != 1 && ts.IsWeekend != true).FirstOrDefault();
            TimeSheet isExists = db.TimeSheets.Where(ts => ts.TimeSheetMasterID == tsmid && ts.ProjectID == pID).FirstOrDefault();

            if (isExists == null && workingday != null)
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

        #region Weekend WorkingDays
        public ActionResult SetWeekendWorkingDays(string staffID, string supervisorID)
        {
            try {
               
                 ViewBag._staffID = staffID!=null?staffID:"";
                 ViewBag._supervisorID = supervisorID != null ? supervisorID : "";
                return View();
            }
            catch (Exception ee)
            {
                throw ee;
                
            }
        }


        public ActionResult _SetWeekendWorkingDays(string staffid,string supervisorID)
        {
            try
            {
                List<Employee> li = MVCUtility.getAllStaffOfSupervisor();
                li=li!=null && li.Count>0?li.Where(a=>a.EmployeeID==MVCUtility.ConverStingToGuid(staffid)).ToList():li;
                ViewBag._PreviousData = new List<WeekendWorkingDay>();
                if (supervisorID != null && supervisorID != "")
                {

                    ViewBag._PreviousData = objclsWeekend.getAllEmployeeWeekendworkingDay(MVCUtility.ConverStingToGuid(supervisorID));
                }
                return PartialView(li);
            }
            catch (Exception ee)
            {
                throw ee;
                // return new EmptyResult();
            }
        }

        [HttpPost]
        public ActionResult _SetWeekendWorkingDays(FormCollection coll)
        {
            try
            {
                int days=coll["supervisor-1"]!=null &&coll["supervisor-1"].ToString()!=""?Convert.ToInt32(coll["month-days"].ToString()) :0;
                Guid supervisorID = coll["supervisor-1"] != null && coll["supervisor-1"].ToString() != "" ? new Guid(coll["supervisor-1"].ToString()) : new Guid();
                Guid EmployeeID = coll["EmployeeID"] != null && coll["EmployeeID"].ToString() != "" ? new Guid(coll["EmployeeID"].ToString()) : new Guid();

                List<WeekendWorkingDay> li = new List<WeekendWorkingDay>();
                for (int i = 1; i <= days; i++)
                {
                    Boolean isChecked = coll["chk-" + i] != null && coll["chk-" + i].Contains("true") ? true : false;
                    DateTime weekendDate = coll["hdn-date-" + i] != null && coll["hdn-date-" + i].ToString() != "" ? Convert.ToDateTime(coll["hdn-date-" + i].ToString()) : new DateTime();
                    if (isChecked)
                    {

                        WeekendWorkingDay item = new WeekendWorkingDay();
                        item.WeekendWorkingDayID = Guid.NewGuid();
                        item.SupervisorID = supervisorID;
                        item.EmployeeID = EmployeeID;
                        item.WeekendDate = weekendDate;
                        item.IsWorkingDay = true;
                        li.Add(item);
                    }
                }
                    if (li != null && li.Count > 0)
                    {
                        if(objclsWeekend.AddEmployeeWeekendworkingDay(li,supervisorID,EmployeeID))
                        {
                              TempData["success"] = "Weekend working days updated";
                               return Json(new { success=true}, JsonRequestBehavior.AllowGet);
                        }
                    }

                

                    TempData["error"] = "Weekend working days not updated.Please Try Again!";
                return Json(new { success=false}, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                TempData["error"] = "Exception : "+ex.Message;
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
        }

       
        #endregion

        #region Assign Postponed Leave
        public ActionResult AssignPostponedLeave(Guid id, string returnUrl)
        {

            ViewBag.returnUrl = returnUrl;
            MVCUtility _MVCUtility = new MVCUtility();   
            Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
            ViewBag.Employee = empoyeeObj;
            //int currentYear = DateTime.Now.Year + 1;
            int currentYear = DateTime.Now.Month >= 10 ? (DateTime.Now.Year + 1) : (DateTime.Now.Month <= 9 ? DateTime.Now.Year : DateTime.Now.Year);
            var iscarryForward = _MVCUtility.getLeaveSummary(id, currentYear);
            if (iscarryForward == null || iscarryForward.Count <= 0)
            {
                currentYear = DateTime.Now.Year;
            }
                  
            ViewBag.currentYear = currentYear;

            clsLeaveType objLeaveType = new clsLeaveType();
            List<LeaveType> leaveTypeList = objLeaveType.getLeaveType();
            ViewBag.leaveTypeList = leaveTypeList;
            ViewBag.edit = false;
            List<EmployeeLeaf> currentYearsSenctionedLeaves = _objEmployeeLeaves.getCurrentYearsSenctionedLeaves(id, currentYear);
            return View(currentYearsSenctionedLeaves);
           

        }

        [HttpPost]
        public ActionResult AssignPostponedLeave(FormCollection coll)
        {
            Guid id = new Guid();
           
            try
            {
               
                int year = Convert.ToInt32(coll["hfyear"].ToString());
                id = new Guid(coll["hfemployeeID"].ToString());
                int count = Convert.ToInt32(coll["hfCount"].ToString());
                int i = 0;
                if (count > 0)
                {
                    for (i = 0; i < count; i++)
                    {
                        PostponedLeave item = new PostponedLeave();
                        Guid leaveTypeID = new Guid(coll["hfLeaveTypeID_" + i].ToString());
                        Guid EmpLeaveID = new Guid(coll["EmpLeaveID_" + i].ToString());
                        decimal leaves = Convert.ToDecimal(coll["leaves_" + i].ToString());
                        decimal pervLeave = Convert.ToDecimal(coll["prevleaves_" + i].ToString());
                        item.EmpId = id;
                        item.EmployeeLeaveID = EmpLeaveID;
                        item.LeaveTypeID = leaveTypeID;
                        item.PostponedLeaveValue = leaves;
                        item.PreviousLeaveValue = pervLeave;
                        _objEmployeeLeaves.AssignPostponedLeave(item);
                        TempData["success"] = "Postponed Leave assigned successfully.";
                       
                    }
                    return View("HRFunctions");
                }
               
                    return View("HRFunctions");
               
            }
            catch (Exception ex)
            {
                #region if Failed
                MVCUtility _MVCUtility = new MVCUtility();
                Employee empoyeeObj = _objEmployee.getEmployeesbyId(id);
                ViewBag.Employee = empoyeeObj;
                //int currentYear = DateTime.Now.Year + 1;
                int currentYear = DateTime.Now.Month >= 10 ? (DateTime.Now.Year + 1) : (DateTime.Now.Month <= 9 ? DateTime.Now.Year : DateTime.Now.Year);
                var iscarryForward = _MVCUtility.getLeaveSummary(id, currentYear);
                if (iscarryForward == null || iscarryForward.Count <= 0)
                {
                    currentYear = DateTime.Now.Year;
                }

                ViewBag.currentYear = currentYear;

                clsLeaveType objLeaveType = new clsLeaveType();
                List<LeaveType> leaveTypeList = objLeaveType.getLeaveType();
                ViewBag.leaveTypeList = leaveTypeList;

                List<EmployeeLeaf> currentYearsSenctionedLeaves = _objEmployeeLeaves.getCurrentYearsSenctionedLeaves(id, currentYear);

                return View(currentYearsSenctionedLeaves);

                #endregion

            }
        }

        #endregion

    }
}
