using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using DAL;
using DAO;
using EntityFramework.Extensions;
using EntityFramework.Batch;
using System.ComponentModel.DataAnnotations;
using System.Globalization;

namespace HR_System.Models
{
    public class MVCUtility
    {
        dbHRSystemEntities db = new dbHRSystemEntities();


        public static int getMonthNumber(string _month)
        {
            int monthNumber = 0;
            string month = _month.ToLower();
            switch (month)
            {
                case "jan":
                    monthNumber = 1;
                    break;
                case "feb":
                    monthNumber = 2;
                    break;
                case "mar":
                    monthNumber = 3;
                    break;
                case "apr":
                    monthNumber = 4;
                    break;
                case "may":
                    monthNumber = 5;
                    break;
                case "jun":
                    monthNumber = 6;
                    break;
                case "jul":
                    monthNumber = 7;
                    break;
                case "aug":
                    monthNumber = 8;
                    break;
                case "sep":
                    monthNumber = 9;
                    break;
                case "oct":
                    monthNumber = 10;
                    break;
                case "nov":
                    monthNumber = 11;
                    break;
                case "dec":
                    monthNumber = 12;
                    break;
                default:
                    monthNumber = 1;
                    break;

            }
            return monthNumber;
        }

        public static Guid getCurrentUserID()
        {
            return new Guid(Membership.GetUser().ProviderUserKey.ToString());
        }

        public static bool IsSuperAdmin()
        {
            MembershipUser u = Membership.GetUser();
            if (Roles.IsUserInRole(u.UserName, SiteRoles.SuperAdmin))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool IsAdmin()
        {
            MembershipUser u = Membership.GetUser();
            if (Roles.IsUserInRole(u.UserName, SiteRoles.Admin))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool IsHR()
        {
            MembershipUser u = Membership.GetUser();
            if (Roles.IsUserInRole(u.UserName, SiteRoles.HR))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool IsSuperAdmin(string userName)
        {
            MembershipUser u = Membership.GetUser(userName);
            if (Roles.IsUserInRole(u.UserName, SiteRoles.SuperAdmin))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static Guid? getCurrentEmployeeID()
        {
            try
            {
                Guid userid = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                clsEmployee emp = new clsEmployee();
                Employee obj = emp.getEmployeesbyUserId(userid);
                if (obj != null)
                    return new Guid(obj.EmployeeID.ToString());
                else
                    return new Guid();
            }
            catch (Exception ee)
            {
                return null;
            }
        }

        public static bool hasCookie(string cookieName)
        {
            try
            {
                if (HttpContext.Current.Request.Cookies[cookieName] != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        public static string getCookieValue(string cookieName)
        {
            try
            {
                if (HttpContext.Current.Request.Cookies[cookieName] != null)
                {
                    return HttpContext.Current.Request.Cookies[cookieName].Value;
                }
                else
                {

                    throw new Exception("Cookie not found");
                }
            }
            catch (Exception ee)
            {
                return Guid.NewGuid().ToString();
            }
        }

        public static string getCurrentCountryName()
        {
            string countryName = "";
            try
            {
                if (HttpContext.Current.Session["countryName"] != null)
                {
                    countryName = HttpContext.Current.Session["countryName"].ToString();
                }
                else
                {
                    if (hasCookie("country"))
                    {
                        Guid countryID = new Guid(getCookieValue("country").ToString());
                        clsCountry OBJ = new clsCountry();
                        countryName = OBJ.getCountryies().Where(a => a.CountryOfficeID == countryID).First().CountryName;
                    }
                }
            }
            catch (Exception ee) { }
            return countryName;
        }
        public static Guid getCurrentCountryID()
        {
            return new Guid(getCookieValue("country"));
        }

        public static Guid getSupervisorIDByEmployeeID(string EmployeeID)
        {
            try
            {

                clsEmployee emp = new clsEmployee();
                Employee obj = emp.getEmployeesbyId(MVCUtility.ConverStingToGuid(EmployeeID));
                DateTime todayDate = DateTime.Now.Date;
                Guid supervisorID = new Guid();

                if (obj != null)
                {
                    supervisorID = (obj.SupervisorID.HasValue && obj.SupervisorID.Value != Guid.Empty) ? new Guid(obj.SupervisorID.ToString()) : ((todayDate >= obj.AltFromDate && todayDate <= obj.AltEndDate) ? (new Guid(obj.AlternativeSupervisorID.ToString())) : new Guid());
                    return supervisorID;
                }
                else
                {
                    return supervisorID;
                }
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static Guid ConverStingToGuid(string id)
        {
            Guid UID = id != null && id.ToString() != "" ? new Guid(id.ToString()) : new Guid();
            return UID;
        }

        /// <summary>
        /// Check for weekend and holidays for leaves of more than one days
        /// </summary>
        /// <param name="employeeID"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <param name="ApprovalMode"></param>
        /// <param name="requestID"></param>
        /// <returns></returns>
        public List<string> checkForWeekendOrHolidays(Guid employeeID, DateTime startDate, DateTime endDate, bool ApprovalMode, Guid? requestID)
        {
            List<string> errorList = new List<string>();
            int holidays = 0;
            int weekends = 0;

            try
            {
                List<DateTime> leavesList = new List<DateTime>();




                if (ApprovalMode)
                {
                    #region Approval Mode
                    List<string> _alreadyExistList = checkIfLeaveAlreadyRequested(employeeID, startDate, endDate, ApprovalMode, requestID);
                    if (_alreadyExistList.Count() > 0)
                    {
                        errorList.AddRange(_alreadyExistList);
                        return errorList;
                    }
                    #endregion
                }
                else
                {
                    #region Normal Mode
                    List<string> alreadyExistList = checkIfLeaveAlreadyRequested(employeeID, startDate, endDate, ApprovalMode, requestID);
                    if (alreadyExistList.Count() > 0)
                    {
                        errorList.AddRange(alreadyExistList);
                        return errorList;
                    }

                    #endregion
                }

                TimeSpan span = endDate - startDate;
                int totalDays = span.Days + 1;
                if (totalDays > 0)
                {
                    // Create a Leaves List
                    for (int i = 0; i < totalDays; i++)
                    {
                        DateTime currentDate = startDate.AddDays(i);
                        leavesList.Add(currentDate);
                    }


                    // Remove Weekends
                    clsWeekend objWeekend = new clsWeekend();
                    List<string> weekendList = objWeekend.GetWeekendByEmployeeID(employeeID).Select(a => a.WeekEndName.ToLower().Trim()).ToList();
                    for (int i = 0; i < totalDays; i++)
                    {
                        DateTime currentDate = startDate.AddDays(i);
                        if (weekendList.Contains(currentDate.DayOfWeek.ToString().ToLower()))
                        {
                            weekends++;
                            leavesList.Remove(currentDate);
                            errorList.Add("Weekend found on " + currentDate.ToShortDateString());
                        }
                    }

                    // Remove holidays
                    clsHoliday objHoliday = new clsHoliday();
                    List<EmployeeHoilday> employeeHolidayList = objHoliday.getHolidayByEmployeeID(employeeID, false);


                    List<DateTime> holidaysFound = (from myLeaves in leavesList
                                                    join holiday in employeeHolidayList.Where(a => a.Holiday != null)
                                                    on myLeaves equals holiday.Holiday.HolidayDate
                                                    select myLeaves).ToList();

                    // Remove holidays from LeavesList
                    List<DateTime> listForHoliday = new List<DateTime>();
                    listForHoliday.AddRange(leavesList);
                    foreach (var item in listForHoliday)
                    {
                        if (holidaysFound.Contains(item))
                        {
                            holidays++;
                            errorList.Add("Holiday found on " + item.ToShortDateString());
                            leavesList.Remove(item);
                        }
                    }
                    // Now check if leaves list still has more than one leaves
                    if (leavesList.Count() > 0)
                    {

                        return new List<string>();
                    }
                }
                else
                {
                    errorList.Add("0 Leaves Found");
                }
            }
            catch (Exception ee)
            {
                errorList.Add("Error: " + ee.Message);
            }
            return errorList;
        }

        /// <summary>
        /// This method is used to get number of Leave days
        /// </summary>
        /// <param name="employeeID"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <param name="ApprovalMode"></param>
        /// <param name="requestID"></param>
        /// <returns></returns>
        public HolidayWeekendCount checkForWeekendOrHolidaysCount(Guid employeeID, DateTime startDate, DateTime endDate, bool ApprovalMode, Guid? requestID)
        {
            List<string> errorList = new List<string>();
            int holidays = 0;
            int weekends = 0;
            int WeekendHolidaysCount = 0;
            TimeSpan span = endDate - startDate;
            int totalDays = span.Days + 1;

            try
            {
                List<DateTime> leavesList = new List<DateTime>();


                List<string> alreadyExistList = checkIfLeaveAlreadyRequested(employeeID, startDate, endDate, ApprovalMode, requestID);
                if (alreadyExistList.Count() > 0)
                {
                    errorList.AddRange(alreadyExistList);
                    //return errorList;

                    return new HolidayWeekendCount(holidays, weekends, totalDays);
                }



                if (totalDays > 0)
                {
                    // Create a Leaves List
                    for (int i = 0; i < totalDays; i++)
                    {
                        DateTime currentDate = startDate.AddDays(i);
                        leavesList.Add(currentDate);
                    }


                    // Remove Weekends
                    clsWeekend objWeekend = new clsWeekend();
                    List<string> weekendList = objWeekend.GetWeekendByEmployeeID(employeeID).Select(a => a.WeekEndName.ToLower().Trim()).ToList();
                    for (int i = 0; i < totalDays; i++)
                    {
                        DateTime currentDate = startDate.AddDays(i);
                        if (weekendList.Contains(currentDate.DayOfWeek.ToString().ToLower()))
                        {
                            weekends++;
                            leavesList.Remove(currentDate);
                            errorList.Add("Weekend found on " + currentDate.ToShortDateString());
                        }
                    }

                    // Remove holidays
                    clsHoliday objHoliday = new clsHoliday();
                    List<EmployeeHoilday> employeeHolidayList = objHoliday.getHolidayByEmployeeID(employeeID, false);


                    List<DateTime> holidaysFound = (from myLeaves in leavesList
                                                    join holiday in employeeHolidayList.Where(a => a.Holiday != null)
                                                    on myLeaves equals holiday.Holiday.HolidayDate
                                                    select myLeaves).ToList();

                    // Remove holidays from LeavesList
                    List<DateTime> listForHoliday = new List<DateTime>();
                    listForHoliday.AddRange(leavesList);
                    foreach (var item in listForHoliday)
                    {
                        if (holidaysFound.Contains(item))
                        {
                            holidays++;
                            errorList.Add("Holiday found on " + item.ToShortDateString());
                            leavesList.Remove(item);
                        }
                    }
                    // Now check if leaves list still has more than one leaves
                    if (leavesList.Count() > 0)
                    {
                        WeekendHolidaysCount = holidays + weekends;
                        //return new List<string>();
                        //return errorList;
                        return new HolidayWeekendCount(holidays, weekends, totalDays);
                    }
                }
                else
                {
                    errorList.Add("0 Leaves Found");
                }
            }
            catch (Exception ee)
            {
                errorList.Add("Error: " + ee.Message);
            }
            WeekendHolidaysCount = holidays + weekends;
            return new HolidayWeekendCount(holidays, weekends, totalDays);
        }

        /// <summary>
        /// This method is used by two other methods to know if leave request exist already
        /// </summary>
        /// <param name="employeeID"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <param name="ApprovalMode"></param>
        /// <param name="requestID"></param>
        /// <returns></returns>
        public static List<string> checkIfLeaveAlreadyRequested(Guid employeeID, DateTime startDate, DateTime endDate, bool ApprovalMode, Guid? requestID)
        {
            List<string> errorList = new List<string>();
            try
            {
                clsEmployeeLeaves objEmployeeLeaves = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> li = objEmployeeLeaves.getAllLeaveRequesByEmployeeID(employeeID).Where(a => a.Cancel != true).ToList();

                // If mode is approval then filter list to only approved leaves list 
                //if (ApprovalMode)
                //{
                //    li = li.Where(a => a.Status.ToLower() == "approved").ToList();
                //}

                #region New logic
                // new logic
                //(StartDate1 <= EndDate2) and (StartDate2 <= EndDate1)
                // StartDate1=startDate
                // EndDate1 =endDate
                List<EmployeeLeaveRequest> overlapList = new List<EmployeeLeaveRequest>();
                overlapList = li.Where(a => (a.FromDate >= startDate) && (startDate <= a.ToDate) && (a.FromDate <= endDate)).ToList();
                foreach (EmployeeLeaveRequest item in overlapList)
                {
                    if (startDate <= item.FromDate && endDate >= item.FromDate)
                    {
                        errorList.Add(string.Format("A leave for date {0} already exist", item.FromDate.Value.ToString("dd-MMM-yyyy")));
                    }
                }
                #endregion

                #region Approval Mode

                if (ApprovalMode)
                {
                    if (overlapList.Count() == 0)
                    {
                        errorList.Clear();
                    }
                    if (overlapList.Count() > 1)
                    {
                        errorList.Add("A leave already for selected date range.");
                    }
                    if (overlapList.Count() == 1)
                    {
                        EmployeeLeaveRequest empLeave = overlapList.First();
                        if (empLeave.EmployeeLeaveRequestID == requestID)
                        {
                            errorList.Clear();
                            // alright
                        }
                        else
                        {
                            errorList.Add("A leave already for selected date range.");
                            //errorList.Add("The leave which you are approving is not found in db. Something went wrong");
                        }
                    }

                    return errorList;
                }
                #endregion

            }
            catch (Exception ee)
            {
            }
            return errorList;
        }

        /// <summary>
        /// Check for weekend and holidays for leaves of single day
        /// </summary>
        /// <param name="employeeID"></param>
        /// <param name="startDate"></param>
        /// <param name="ApprovalMode"></param>
        /// <param name="requestID"></param>
        /// <returns></returns>
        public List<string> checkForWeekendOrHolidays(Guid employeeID, DateTime startDate, bool ApprovalMode, Guid? requestID)
        {

            List<string> errorList = new List<string>();
            try
            {

                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> getAllLeaveRequest = clsEmployeeLeave.getAllLeaveRequesByEmployeeID(employeeID).Where(a => a.Cancel != true).ToList();
                List<EmployeeLeaveRequest> resultRequests = (from item in getAllLeaveRequest
                                                             where ((item.ToDate.HasValue && startDate >= item.FromDate && startDate <= item.ToDate)
                                                             || (!item.ToDate.HasValue && item.FromDate == startDate))
                                                             select item).ToList();



                if (ApprovalMode)
                {
                    #region Approval Mode
                    if (resultRequests.Count() == 0)
                    {
                        errorList.Clear();
                    }
                    else if (resultRequests.Count() > 1)
                    {
                        errorList.Add("A leave already exist for the same day");
                    }
                    else if (resultRequests.Count() == 1)
                    {
                        EmployeeLeaveRequest empLeave = resultRequests.First();
                        if (empLeave.EmployeeLeaveRequestID == requestID)
                        {
                            errorList.Clear();
                            // alright
                        }
                        else
                        {
                            errorList.Add("A leave already exist for the same day");
                            //errorList.Add("The leave which you are approving is not found in db. Something went wrong");
                        }
                    }


                    if (errorList.Count() > 0)
                        return errorList;

                    #endregion
                }
                else
                {
                    #region Normal Mode
                    if (resultRequests.Count() > 0)
                    {
                        errorList.Add("Request for " + startDate.Date.ToShortDateString() + " is already exist");
                    }
                    if (errorList.Count() > 0)
                        return errorList;
                    #endregion
                }

                // Check Holiday
                List<string> holidaysList = getHolidays(employeeID, startDate);
                errorList.AddRange(holidaysList);

                if (errorList.Count() > 0)
                    return errorList;


                // Check Weekends
                List<string> weekendList = getWeekends(employeeID, startDate);
                errorList.AddRange(weekendList);
                if (errorList.Count() > 0)
                    return errorList;

            }
            catch (Exception ee)
            {
                errorList.Add("Error: " + ee.Message);
            }

            return errorList;
        }

        public List<string> getHolidays(Guid employeeID, DateTime startDate)
        {
            List<string> errorList = new List<string>();
            clsHoliday objHoliday = new clsHoliday();
            List<EmployeeHoilday> employeeHolidayList = objHoliday.getHolidayByEmployeeID(employeeID, false);
            int holidaysFound = employeeHolidayList.Where(a => a.Holiday != null && a.Holiday.HolidayDate == startDate).Count();
            if (holidaysFound > 0)
            {
                errorList.Add(startDate.ToShortDateString() + " is your holiday");
            }
            return errorList;
        }
        public List<string> getWeekends(Guid employeeID, DateTime startDate)
        {
            List<string> errorList = new List<string>();
            clsWeekend objWeekend = new clsWeekend();
            List<string> weekendList = objWeekend.GetWeekendByEmployeeID(employeeID).Select(a => a.WeekEndName.ToLower().Trim()).ToList();

            if (weekendList.Contains(startDate.DayOfWeek.ToString().ToLower()))
            {
                errorList.Add("Weekend found on " + startDate.ToShortDateString());
            }
            return errorList;
        }

        public static string getEmployeeName(Guid? id)
        {
            string name = "";
            try
            {
                dbHRSystemEntities db = new dbHRSystemEntities();
                Employee emp = db.Employees.Where(a => a.EmployeeID == id).FirstOrDefault();
                if (emp != null)
                {
                    name = string.Format("{0} {1} {2} {3}", emp.FirstNameEn, emp.SecondNameEn, emp.ThirdNameEn, emp.LastNameEn);
                }
            }
            catch (Exception ee)
            {
            }
            return name;
        }

        #region Function ForL: Get All Employee of Supervisor
        public static List<Employee> getAllStaffOfSupervisor()
        {
            try
            {
                dbHRSystemEntities db = new dbHRSystemEntities();
                Guid CurrentCountryID = MVCUtility.getCurrentCountryID();
                clsEmployee _objEmployee = new clsEmployee();
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
                return li;
            }
            catch
            {
                return null;
            }
        }
        #endregion

        /// <summary>
        /// This method check weather current logged in user have the ability to approve timesheet
        /// </summary>
        /// <param name="employee"></param>
        /// <returns></returns>
        public static ApprovalDisapprovalAbility checkApprovalDisapprovalAbility(Employee employee)
        {
            bool canApproveDisapprove = false;
            string message = "";
            ApprovalDisapprovalAbility obj = new ApprovalDisapprovalAbility();

            if (IsSuperAdmin())
            {
                canApproveDisapprove = true;
                message = "You Are Viewing This Timesheet As Super Admin";
            }
            else
            {
                Guid? currentEmployeeID = getCurrentEmployeeID();
                if (currentEmployeeID == employee.EmployeeID)
                {
                    message = "You Are Viewing This Timesheet As Owner";
                }
                else if (currentEmployeeID == employee.SupervisorID)
                {
                    message = "You Are Viewing This Timesheet As Supervisor";
                    canApproveDisapprove = true;
                }
                else if (currentEmployeeID == employee.AlternativeSupervisorID)
                {
                    if (employee.AltFromDate >= DateTime.Now && DateTime.Now <= employee.AltEndDate)
                    {
                        message = "You Are Viewing This Timesheet As Alternative Supervisor";
                        canApproveDisapprove = true;
                    }
                }
            }
            obj.message = message;
            obj.canApproveDisapprove = canApproveDisapprove;
            return obj;
        }

        #region Function For :Delete Old Weekend And Holidays
        public static bool deleteOldWeekendAndHolidays(Guid employeeID, Guid timesheetMasterId)
        {
            try
            {

                dbHRSystemEntities db = new dbHRSystemEntities();
                clsEmployeeTimeSheet timesheet = new clsEmployeeTimeSheet();

                TimeSheetMaster mainTimesheet = db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == timesheetMasterId).FirstOrDefault();

                if (mainTimesheet != null)
                {
                    int year = Convert.ToInt32(mainTimesheet.Year);
                    int month = DateTime.ParseExact(mainTimesheet.Month, "MMM", System.Globalization.CultureInfo.CurrentCulture).Month;

                    List<TimeSheet> employeeTimsheetList = timesheet.getDetailByTime_M_ID(timesheetMasterId);

                    #region Delete weekend
                    List<Weekend> WeekendList = db.Weekends.Where(a => a.EmployeeID == employeeID).ToList();
                    List<TimeSheet> weekendTimesheet = employeeTimsheetList.Where(a => a.isOff == 1).ToList();
                    //List<TimeSheet> weekendTimesheet = (from w in WeekendList
                    //                                    join t in employeeTimsheetList
                    //                                    on w.WeekEndName.Trim().ToLower() equals t.Date.Value.DayOfWeek.ToString().ToLower()
                    //                                    select t).ToList();
                    foreach (TimeSheet item in weekendTimesheet)
                    {

                        TimeSheet tObj = db.TimeSheets.Where(a => a.TimeSheetID == item.TimeSheetID).FirstOrDefault();
                        if (tObj != null)
                        {
                            db.TimeSheets.Remove(tObj);
                            db.SaveChanges();
                        }
                    }
                    #endregion

                    #region Delete Holidays
                    List<Holiday> holidaysList = db.EmployeeHoildays.Where(a => a.EmpID == employeeID).Select(a => a.Holiday).ToList();
                    List<TimeSheet> holidaysTimesheet = employeeTimsheetList.Where(a => a.isOff == 2).ToList();
                    //List<TimeSheet> holidaysTimesheet = (from h in holidaysList
                    //                                 join t in employeeTimsheetList
                    //                                 on h.HolidayDate equals t.Date
                    //                                 select t).ToList();

                    foreach (TimeSheet item in holidaysTimesheet)
                    {

                        TimeSheet tObj = db.TimeSheets.Where(a => a.TimeSheetID == item.TimeSheetID).FirstOrDefault();
                        if (tObj != null)
                        {
                            db.TimeSheets.Remove(tObj);
                            db.SaveChanges();
                        }
                    }
                    #endregion

                    #region  Getting Weekend Off Days
                    clsWeekend _objclsWeekend = new clsWeekend();
                    Guid supervisorID = new Guid();
                    supervisorID = MVCUtility.getSupervisorIDByEmployeeID(employeeID.ToString());
                    List<WeekendWorkingDay> weekWorkDayli = _objclsWeekend.getAllEmployeeWeekendworkingDay(supervisorID);
                    List<WeekendWorkingDay> employeeweekWorkDayli = new List<WeekendWorkingDay>();
                    if (weekWorkDayli != null && weekWorkDayli.Count > 0)
                    {
                        employeeweekWorkDayli = weekWorkDayli.Where(a => a.EmployeeID == employeeID).ToList();
                    }

                    #endregion

                    #region Insert All Weekends
                    List<DateTime> allWeekendsInMonth = GetWeekendDates(year, month, WeekendList);
                    foreach (DateTime item in allWeekendsInMonth)
                    {
                        if (employeeweekWorkDayli != null && employeeweekWorkDayli.Count > 0)
                        {
                            WeekendWorkingDay isExists = employeeweekWorkDayli.Where(a => a.WeekendDate == item && a.EmployeeID == employeeID && a.SupervisorID == supervisorID).FirstOrDefault();
                            if (isExists == null)
                            {
                                TimeSheet holidayTS = new TimeSheet();
                                holidayTS.TimeSheetMasterID = timesheetMasterId;
                                holidayTS.TimeSheetID = Guid.NewGuid();
                                holidayTS.ProjectID = null;
                                holidayTS.Date = item;
                                holidayTS.isOff = 1;
                                holidayTS.Hours = 0;
                                holidayTS.CreatedDate = DateTime.Now;
                                holidayTS.IsWeekend = false;
                                db.TimeSheets.Add(holidayTS);
                                db.SaveChanges();
                            }
                        }
                    }
                    #endregion

                    #region Insert All Holidays
                    TimeSheetMaster mainTimesheetNew = db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == timesheetMasterId).FirstOrDefault();
                    List<DateTime> allHolidaysInMonth = GetHolidaysDates(year, month, holidaysList);
                    foreach (DateTime item in allHolidaysInMonth)
                    {
                        int i = mainTimesheetNew.TimeSheets.Where(a => a.Date == item.Date && a.isOff != null).Count();
                        if (i <= 0)
                        {
                            TimeSheet holidayTS = new TimeSheet();
                            holidayTS.TimeSheetMasterID = timesheetMasterId;
                            holidayTS.TimeSheetID = Guid.NewGuid();
                            holidayTS.ProjectID = null;
                            holidayTS.Date = item;
                            holidayTS.isOff = 2;
                            holidayTS.Hours = 0;
                            holidayTS.CreatedDate = DateTime.Now;
                            holidayTS.IsWeekend = false;
                            db.TimeSheets.Add(holidayTS);
                            db.SaveChanges();
                        }
                    }

                    #endregion

                    return true;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        #endregion

        #region Function For :Get Weekend Dates
        public static List<DateTime> GetWeekendDates(int year, int month, List<Weekend> WeekendList)
        {
            List<DateTime> allDays = Enumerable.Range(1, DateTime.DaysInMonth(year, month))  // Days: 1, 2 ... 31 etc.
                             .Select(day => new DateTime(year, month, day)) // Map each day to a date
                             .ToList();// Load dates into a list

            var result = (from item in allDays
                          join w in WeekendList
                          on item.DayOfWeek.ToString() equals w.WeekEndName
                          select item).ToList();
            return result;
        }
        #endregion

        #region Function For :Get Holidays Dates
        public static List<DateTime> GetHolidaysDates(int year, int month, List<Holiday> holidaysList)
        {
            List<DateTime> allDays = Enumerable.Range(1, DateTime.DaysInMonth(year, month))  // Days: 1, 2 ... 31 etc.
                             .Select(day => new DateTime(year, month, day)) // Map each day to a date
                             .ToList();// Load dates into a list

            var result = (from item in allDays
                          join w in holidaysList
                          on item.Date equals w.HolidayDate
                          select item).ToList();
            return result;
        }
        #endregion

        #region Function For :Delete Unused Timesheet ID
        public bool deleteUnusedTimesheetID(Guid timesheetMasterID, Guid employeeID)
        {
            try
            {
                // get employee projects which are not in working
                Employee emp = db.Employees.Where(a => a.EmployeeID == employeeID).FirstOrDefault();
                if (emp != null)
                {
                    List<Project> projectList = emp.EmployeeProjects.Where(a => a.EmployeeID == employeeID && a.Working != true).Select(a => a.Project).ToList();
                    TimeSheetMaster timesheetMaster = emp.TimeSheetMasters.Where(a => a.TimeSheetMasterID == timesheetMasterID).FirstOrDefault();
                    if (timesheetMaster != null)
                    {
                        List<TimeSheet> entriesNotUsed = (from item in projectList
                                                          join timesheet in timesheetMaster.TimeSheets
                                                          on item.ProjectId equals timesheet.ProjectID
                                                          select timesheet).ToList();

                        foreach (TimeSheet t in entriesNotUsed)
                        {
                            TimeSheet tFound = db.TimeSheets.Where(a => a.TimeSheetID == t.TimeSheetID).FirstOrDefault();
                            if (tFound != null)
                            {
                                db.TimeSheets.Remove(tFound);
                                db.SaveChanges();
                            }

                        }
                    }
                }

                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        #endregion

        #region Leave Summary Functions
        /// <summary>
        /// This method delete entries of timesheet of a user
        /// if an entry of timesheet exist of holiday or weekend
        /// called when timesheet page loads or timesheet summary loads // it deletes extra entries
        /// </summary>
        /// <returns></returns>
        public bool deleteAnyTSEntryIfWeekendHolidayOccurs(Guid timesheetMasterID)
        {
            try
            {
                TimeSheetMaster ts = db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == timesheetMasterID).FirstOrDefault();
                DateTime startDate = new DateTime(Convert.ToInt32(ts.Year), ts.MonthNumber.Value, 1);
                int daysInMOnth = DateTime.DaysInMonth(Convert.ToInt32(ts.Year), ts.MonthNumber.Value);
                DateTime endDate = new DateTime(Convert.ToInt32(ts.Year), ts.MonthNumber.Value, daysInMOnth);

                if (ts != null && ts.MonthNumber.HasValue && ts.TimeSheets != null)
                {
                    for (int i = 1; i <= daysInMOnth; i++)
                    {
                        DateTime _date = new DateTime(Convert.ToInt32(ts.Year), ts.MonthNumber.Value, 1);
                        // Get entries for this date
                        List<TimeSheet> li = db.TimeSheets.Where(a => a.TimeSheetMasterID == timesheetMasterID && a.Date == _date).ToList();
                        // if holiday or weekend found on this day
                        if (li.Where(a => a.isOff != null).Count() > 0)
                        {
                            // then remove hours entries from list
                            foreach (var item in li.Where(a => a.isOff == null))
                            {
                                TimeSheet tsForDelete = db.TimeSheets.Where(a => a.TimeSheetID == item.TimeSheetID).FirstOrDefault();
                                db.TimeSheets.Remove(tsForDelete);
                                db.SaveChanges();
                            }
                        }
                    }
                }
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        public List<EmployeeLeaveModified> getLeaveSummary(Guid employeeID, int year)
        {
            clsEmployeeLeaves _objEmployeeLeaves = new clsEmployeeLeaves();
            clsEmployee objEmployee = new clsEmployee();
            Employee empoyeeObj = objEmployee.getEmployeesbyId(employeeID);

            List<EmployeeLeaveRequest> currentYearsLeaves = _objEmployeeLeaves.getCurrentYearsLeavesRequests(employeeID, year).Where(a => a.Status.ToLower().Trim() == "approved" && a.Cancel != true).ToList();
            List<EmployeeLeaf> currentYearsSenctionedLeaves = _objEmployeeLeaves.getCurrentYearsSenctionedLeaves(employeeID, year);

            List<EmployeeLeaveModified> li = new List<EmployeeLeaveModified>();
            foreach (EmployeeLeaf item in currentYearsSenctionedLeaves)
            {
                decimal balanceLeaves = 0;
                decimal postpondLeaves = item.PostponedLeave ?? 0;
                decimal prevLeaves = item.BalanceLeaves ?? 0;
                decimal IssueLeaves = item.IssuedLeaves ?? 0;
                decimal temp = 0;
                int leavesTaken = currentYearsLeaves.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay != true).Sum(a => a.AssignedDate) ?? 0;
                decimal halfDay_leavesTaken = (currentYearsLeaves.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay == true).Sum(a => a.AssignedDate) ?? 0);
                halfDay_leavesTaken = halfDay_leavesTaken / 2;
                if (item.TotalLeaves.HasValue)
                {
                    balanceLeaves = item.TotalLeaves.Value - (leavesTaken + halfDay_leavesTaken);
                    #region Checking Is Service bonus Incremented then deduct from Issued leave
                    Boolean isIncremented = false;
                    int serviceBonus = 0;
                    if (item.LeaveType.LeaveTypeName == "Annual Leave")
                    {

                        if (MVCUtility.willAnnual_Increase() && MVCUtility.IsServiceBonusIncrementedForThisYesar(employeeID, year.ToString()))
                        {
                            
                            serviceBonus = MVCUtility.getServiceBonus();
                            IssueLeaves = IssueLeaves - serviceBonus;
                            isIncremented = true;
                        }
                    }

                    #endregion

                    #region Calculating Balance Leave
                    if (item.LeaveType.LeaveTypeName == "Annual Leave")
                    {
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
                        balanceLeaves = LeaveInmonths + serviceBonus;
                        #region Calculating leaves taken by user till date
                        var lvs_requset = currentYearsLeaves.Where(a => (a.FromDate.Value.Month >= 10 && a.FromDate.Value.Year == (year - 1)) || (a.ToDate.Value.Month <= currentMonth && a.ToDate.HasValue && a.ToDate.Value.Year == year)).ToList();

                        int allleavesTaken = lvs_requset.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay != true).Sum(a => a.AssignedDate) ?? 0;
                        decimal aahalfDay_leavesTaken = (lvs_requset.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay == true).Sum(a => a.AssignedDate) ?? 0);
                        balanceLeaves = balanceLeaves - (allleavesTaken + aahalfDay_leavesTaken);
                        #endregion
                    }
                    #endregion

                    #region Checking Is Service bonus Incremented then adding in Issued leave
                    if (isIncremented)
                    {

                       
                            int serviceBonusVal = 0;
                            serviceBonusVal = MVCUtility.getServiceBonus();
                            IssueLeaves = IssueLeaves + serviceBonusVal;

                       
                    }
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

                    #region Deduct Leaves From Issue Leaves
                    if (IssueLeaves > 0)
                    {
                        if (IssueLeaves >= totalLeaveTaken)
                        {
                            temp = IssueLeaves - totalLeaveTaken;
                            totalLeaveTaken = 0;
                            IssueLeaves = temp;
                        }
                        else
                        {
                            temp = totalLeaveTaken - IssueLeaves;
                            totalLeaveTaken = totalLeaveTaken - IssueLeaves;
                            IssueLeaves = 0;
                        }
                    }
                    #endregion
                    //item.BalanceLeaves = item.TotalLeaves.Value - leavesTaken;
                    item.TotalLeaves = postpondLeaves + prevLeaves + IssueLeaves;
                }

                #region Initializing values to class
                EmployeeLeaveModified objELM = new EmployeeLeaveModified();
                objELM.PrevLeaves = prevLeaves;
                objELM.BalanceLeaves = balanceLeaves;
                objELM.CreatedDate = item.CreatedDate;
                objELM.EmpId = item.EmpId;
                objELM.LeaveTypeID = item.LeaveTypeID;
                objELM.Year = item.Year;
                objELM.TotalLeaves = item.TotalLeaves ?? 0;
                objELM.IssuedLeaves = IssueLeaves;
                //This Field add on 25-Nov-2014
                objELM.PostponedLeave = postpondLeaves;
                objELM.LeaveTypeName = item.LeaveType != null ? item.LeaveType.LeaveTypeName : "";
                #endregion
                li.Add(objELM);
            }
            return li;
        }

        public List<EmployeeLeaveModified> getLeaveSummary(Guid employeeID)
        {
            clsEmployeeLeaves _objEmployeeLeaves = new clsEmployeeLeaves();
            clsEmployee objEmployee = new clsEmployee();
            Employee empoyeeObj = objEmployee.getEmployeesbyId(employeeID);

            List<EmployeeLeaveRequest> currentYearsLeaves = _objEmployeeLeaves.getCurrentYearsLeavesRequests(employeeID).Where(a => a.Status.ToLower().Trim() == "approved" && a.Cancel != true).ToList();
            List<EmployeeLeaf> currentYearsSenctionedLeaves = _objEmployeeLeaves.getCurrentYearsSenctionedLeaves(employeeID);

            List<EmployeeLeaveModified> li = new List<EmployeeLeaveModified>();
            foreach (EmployeeLeaf item in currentYearsSenctionedLeaves)
            {
                decimal balanceLeaves = 0;
                decimal postpondLeaves = item.PostponedLeave ?? 0;
                decimal prevLeaves = item.BalanceLeaves ?? 0;
                decimal IssueLeaves = item.IssuedLeaves ?? 0;
                decimal temp = 0;
                int leavesTaken = currentYearsLeaves.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay != true).Sum(a => a.AssignedDate) ?? 0;
                decimal halfDay_leavesTaken = (currentYearsLeaves.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay == true).Sum(a => a.AssignedDate) ?? 0);
                halfDay_leavesTaken = halfDay_leavesTaken / 2;
                if (item.TotalLeaves.HasValue)
                {
                    balanceLeaves = item.TotalLeaves.Value - (leavesTaken + halfDay_leavesTaken);
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

                    #region Deduct Leaves From Issue Leaves
                    if (IssueLeaves > 0)
                    {
                        if (IssueLeaves >= totalLeaveTaken)
                        {
                            temp = IssueLeaves - totalLeaveTaken;
                            totalLeaveTaken = 0;
                            IssueLeaves = temp;
                        }
                        else
                        {
                            temp = totalLeaveTaken - IssueLeaves;
                            totalLeaveTaken = totalLeaveTaken - IssueLeaves;
                            IssueLeaves = 0;
                        }
                    }
                    #endregion
                    //item.BalanceLeaves = item.TotalLeaves.Value - leavesTaken;
                    item.TotalLeaves = postpondLeaves + prevLeaves + IssueLeaves;
                }
                EmployeeLeaveModified objELM = new EmployeeLeaveModified();
                objELM.PrevLeaves = prevLeaves;
                objELM.BalanceLeaves = balanceLeaves;
                objELM.CreatedDate = item.CreatedDate;
                objELM.EmpId = item.EmpId;
                objELM.LeaveTypeID = item.LeaveTypeID;
                objELM.Year = item.Year;
                objELM.TotalLeaves = item.TotalLeaves ?? 0;
                objELM.IssuedLeaves = IssueLeaves;
                objELM.LeaveTypeName = item.LeaveType != null ? item.LeaveType.LeaveTypeName : "";
                //This Field add on 25-Nov-2014
                objELM.PostponedLeave = postpondLeaves;
                li.Add(objELM);
            }
            return li;
        }

        public List<EmployeeLeaveModified> getLeaveSummary()
        {
            //changes made on this function at 25-Jan-2014
            clsEmployeeLeaves _objEmployeeLeaves = new clsEmployeeLeaves();
            clsEmployee objEmployee = new clsEmployee();

            List<EmployeeLeaveRequest> currentYearsLeaves = _objEmployeeLeaves.getCurrentYearsLeavesRequests().Where(a => a.Status.ToLower().Trim() == "approved" && a.Cancel != true).ToList();
            List<EmployeeLeaf> currentYearsSenctionedLeaves = _objEmployeeLeaves.getCurrentYearsSenctionedLeaves();
            List<Employee> employee = objEmployee.getEmployees();
            List<EmployeeLeaveModified> li = new List<EmployeeLeaveModified>();
            foreach (EmployeeLeaf item in currentYearsSenctionedLeaves)
            {

                decimal balanceLeaves = 0;
                decimal postpondLeaves = item.PostponedLeave ?? 0;
                decimal prevLeaves = item.BalanceLeaves ?? 0;
                decimal IssueLeaves = item.IssuedLeaves ?? 0;
                decimal temp = 0;


                //changes made on below of both line 
                //i have add only 'a.EmployeeID == item.EmpId' in where condition
                int leavesTaken = currentYearsLeaves.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay != true && a.EmployeeID == item.EmpId).Sum(a => a.AssignedDate) ?? 0;
                decimal halfDay_leavesTaken = (currentYearsLeaves.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay == true && a.EmployeeID == item.EmpId).Sum(a => a.AssignedDate) ?? 0);
                Employee objEmp = employee.Where(a => a.EmployeeID == item.EmpId).FirstOrDefault();
                string EmpName = (objEmp.FirstNameEn + " " + objEmp.LastNameEn);
                halfDay_leavesTaken = halfDay_leavesTaken / 2;


                if (item.TotalLeaves.HasValue)
                {
                    balanceLeaves = item.TotalLeaves.Value - (leavesTaken + halfDay_leavesTaken);

                    //item.BalanceLeaves = item.TotalLeaves.Value - leavesTaken;
                }
                EmployeeLeaveModified objELM = new EmployeeLeaveModified();
                objELM.EmployeeName = objEmp;
                objELM.EmpName = EmpName;
                objELM.PrevLeaves = prevLeaves;
                objELM.BalanceLeaves = balanceLeaves;
                objELM.CreatedDate = item.CreatedDate;
                objELM.EmpId = item.EmpId;
                objELM.LeaveTypeID = item.LeaveTypeID;
                objELM.Year = item.Year;
                objELM.TotalLeaves = item.TotalLeaves ?? 0;
                objELM.IssuedLeaves = IssueLeaves;
                objELM.LeaveTypeName = item.LeaveType != null ? item.LeaveType.LeaveTypeName : "";
                //This Field add on 25-Nov-2014
                objELM.PostponedLeave = postpondLeaves;
                li.Add(objELM);
            }
            return li;
        }

        public List<EmployeeLeaveModified> getLeaveSummarybyYear(int year)
        {
            //changes made on this function at 25-Jan-2014

            clsEmployeeLeaves _objEmployeeLeaves = new clsEmployeeLeaves();
            clsEmployee objEmployee = new clsEmployee();

            List<EmployeeLeaveRequest> currentYearsLeaves = _objEmployeeLeaves.getCurrentYearsLeavesRequests(year).Where(a => a.Status.ToLower().Trim() == "approved" && a.Cancel != true).ToList();
            List<EmployeeLeaf> currentYearsSenctionedLeaves = _objEmployeeLeaves.getCurrentYearsSenctionedLeavesbyYear(year);
            List<Employee> employee = objEmployee.getEmployees();

            List<EmployeeLeaveModified> li = new List<EmployeeLeaveModified>();
            foreach (EmployeeLeaf item in currentYearsSenctionedLeaves)
            {
                decimal balanceLeaves = 0;
                //changes made on below of both line 
                //i have add only 'a.EmployeeID == item.EmpId' in where condition
                int leavesTaken = currentYearsLeaves.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay != true && a.EmployeeID == item.EmpId).Sum(a => a.AssignedDate) ?? 0;
                decimal halfDay_leavesTaken = (currentYearsLeaves.Where(a => a.LeaveTypeID == item.LeaveTypeID && a.HalfDay == true && a.EmployeeID == item.EmpId).Sum(a => a.AssignedDate) ?? 0);
                Employee objEmp = employee.Where(a => a.EmployeeID == item.EmpId).FirstOrDefault();
                string EmpName = (objEmp.FirstNameEn + " " + objEmp.LastNameEn);
                halfDay_leavesTaken = halfDay_leavesTaken / 2;
                if (item.TotalLeaves.HasValue)
                {
                    balanceLeaves = item.TotalLeaves.Value - (leavesTaken + halfDay_leavesTaken);
                    //item.BalanceLeaves = item.TotalLeaves.Value - leavesTaken;
                }
                EmployeeLeaveModified objELM = new EmployeeLeaveModified();
                objELM.EmpName = EmpName;
                objELM.EmployeeName = objEmp;
                objELM.PrevLeaves = item.BalanceLeaves ?? 0;
                objELM.BalanceLeaves = balanceLeaves;
                objELM.CreatedDate = item.CreatedDate;
                objELM.EmpId = item.EmpId;
                objELM.LeaveTypeID = item.LeaveTypeID;
                objELM.Year = item.Year;
                objELM.TotalLeaves = item.TotalLeaves ?? 0;
                objELM.IssuedLeaves = item.IssuedLeaves ?? 0;
                //This Field add on 25-Nov-2014
                objELM.PostponedLeave = item.PostponedLeave ?? 0;
                objELM.LeaveTypeName = item.LeaveType != null ? item.LeaveType.LeaveTypeName : "";
                li.Add(objELM);
            }

            return li;
        }
        #endregion



        #region Get Time-sheet Submitted & Approved Date

        #region Get TimeSheet Approve Date
        public static string getTimesheetApproveDate(Guid timesheetId)
        {
            dbHRSystemEntities dbLog = new dbHRSystemEntities();
            LogTable getDetail = dbLog.LogTables.Where(a => a.ItemID == timesheetId && a.Operation == "approve").OrderByDescending(b => b.RecordDate).FirstOrDefault();
            return getDetail != null ? getDetail.RecordDate.ToString() : "";
        }
        #endregion

        #region Get TimeSheet Submitted Date
        public static string getTimesheetSubmittedDate(Guid timesheetId)
        {
            dbHRSystemEntities dbLog = new dbHRSystemEntities();
            LogTable getDetail = dbLog.LogTables.Where(a => a.ItemID == timesheetId && a.Operation == "submit").OrderByDescending(b => b.RecordDate).FirstOrDefault();
            return getDetail != null ? getDetail.RecordDate.ToString() : "";
        }
        #endregion
        #endregion

        #region Delete Time-sheet Entries Of Given Date Range
        /// <summary>
        /// This method deletes entries from timesheet table 
        /// because employee's leave for those days has been approved
        /// (Called after leave is approved)
        /// </summary>
        /// <param name="employeeID"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <returns></returns>
        public bool deleteTimesheetEntriesOfGivenDateRange(Guid employeeID, DateTime startDate, DateTime endDate)
        {
            try
            {
                //isOff = 1 // Weekend
                //isOff = 2 // Holidays

                // Get all timesheets of a user
                List<TimeSheetMaster> li = db.TimeSheetMasters.Where(a => a.EmpID == employeeID).ToList();
                List<TimeSheet> timesheetsEntries = (from master in li
                                                     join ts in db.TimeSheets.ToList()
                                                     on master.TimeSheetMasterID equals ts.TimeSheetMasterID
                                                     where ts.Date <= endDate && ts.Date >= startDate
                                                     select ts).ToList();
                int span = 0;

                if (endDate >= startDate)
                {
                    span = (endDate - startDate).Days + 1;
                    for (int i = 0; i < span; i++)
                    {
                        DateTime _date = startDate.AddDays(i);

                        // filter result by current date and  weekend entries
                        List<TimeSheet> _li = timesheetsEntries.Where(a => a.Date == _date).ToList();

                        // Delete all timesheet entries of current date
                        foreach (TimeSheet t in _li)
                        {
                            TimeSheet tobj = db.TimeSheets.Where(a => a.TimeSheetID == t.TimeSheetID).FirstOrDefault();
                            if (tobj != null)
                            {
                                db.TimeSheets.Remove(tobj);
                                db.SaveChanges();
                            }
                        }
                        // add an entryfor holiday

                        //TimeSheetMaster master = li.Where(a => a.MonthNumber == _date.Month && a.Year == _date.Year.ToString()).FirstOrDefault();
                        //List<Weekend> weekendList = master.Employee.Weekends.ToList();

                        //if (master != null)
                        //{
                        //    // add if not weekend
                        //    if (weekendList.Where(a => a.WeekEndName.ToLower() != _date.DayOfWeek.ToString().ToLower()).Count() > 0)
                        //    {
                        //        TimeSheet newTS = new TimeSheet();
                        //        newTS.Hours = 0;
                        //        newTS.IsWeekend = false;
                        //        newTS.isOff = 2;
                        //        newTS.TimeSheetID = Guid.NewGuid();
                        //        newTS.ProjectID = null;
                        //        newTS.TimeSheetMasterID = master.TimeSheetMasterID;
                        //        newTS.Date = _date;
                        //        newTS.CreatedDate = DateTime.Now;
                        //        db.TimeSheets.Add(newTS);
                        //        db.SaveChanges();
                        //    }
                        //}
                    }
                }
            }
            catch (Exception ee)
            {
                return false;
            }
            return true;
        }
        #endregion

        #region  Function For :Get Months Between
        public static IEnumerable<Tuple<string, int>> MonthsBetween(DateTime startDate, DateTime endDate)
        {
            DateTime iterator;
            DateTime limit;

            if (endDate > startDate)
            {
                iterator = new DateTime(startDate.Year, startDate.Month, 1);
                limit = endDate;
            }
            else
            {
                iterator = new DateTime(endDate.Year, endDate.Month, 1);
                limit = startDate;
            }

            var dateTimeFormat = CultureInfo.CurrentCulture.DateTimeFormat;
            while (iterator <= limit)
            {
                yield return Tuple.Create(
                    dateTimeFormat.GetMonthName(iterator.Month),
                    iterator.Year);
                iterator = iterator.AddMonths(1);
            }
        }
        #endregion

        #region Service Bonus Functions :IsServiceBonusIncrementedForThisYesar,IncrementServiceBonusForThisYesar,IsCompletedOneYear,willAnnual_Increase,getServiceBonus

        #region  Function For :Check Is Service Bonus Incremented or Not For Current User
        public static Boolean IsServiceBonusIncrementedForThisYesar(Guid EmpID, string thisYear)
        {
            try
            {
                clsServiceBonus objclsServiceBonus = new clsServiceBonus();
                if (objclsServiceBonus.IsServiceBonusIncremented(EmpID, thisYear))
                {
                    return true;
                }
                return false;

            }
            catch (Exception ex)
            {
                return false;
            }
        }

        #endregion

        #region  Function For :Increment Service Bonus For This Year
        public static Boolean IncrementServiceBonusForThisYesar(Guid EmpID, DateTime? hireDate)
        {
            try
            {
                clsServiceBonus objclsServiceBonus = new clsServiceBonus();
                ServiceBonu detail = new ServiceBonu();
                // string year=System.DateTime.Now.Year.ToString();
                detail.ServiceBonusID = Guid.NewGuid();
                detail.IsIncremented = true;
                detail.EmployeeID = EmpID;
                detail.IncrementedYear = MVCUtility.IncrementServiceBonusForYear(hireDate);

                if (objclsServiceBonus.AddIncrementedServiceBonus(detail, MVCUtility.getServiceBonus()))
                {
                    return true;
                }
                return false;

            }
            catch (Exception ex)
            {
                return false;
            }
        }

        #endregion

        #region  Function For :Check Is Completed One Year
        public static Boolean IsCompletedOneYear(DateTime? hireDate)
        {
            try
            {

                if (hireDate.HasValue)
                {
                    TimeSpan IsOneyear = System.DateTime.Now.Date - hireDate.Value.Date;
                    double year = IsOneyear.TotalDays;
                    if (year >= 365)
                    {
                        return true;
                    }
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        #endregion

        #region  Function For :Will Annual Increase
        public static Boolean willAnnual_Increase()
        {
            try
            {
                Boolean isTrue = Convert.ToBoolean(System.Web.Configuration.WebConfigurationManager.AppSettings["Use_Annual_Increase"].ToString());
                if (isTrue)
                {
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        #endregion

        #region  Function For :Get Service Bonus
        public static int getServiceBonus()
        {
            try
            {
                string temp = System.Web.Configuration.WebConfigurationManager.AppSettings["Annual_Increase"];
                int annualIncrement = temp != null && temp != "" ? Convert.ToInt32(temp.ToString()) : 1;
                return annualIncrement;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region  Function For :Increment Service Bonus For This Year
        public static string IncrementServiceBonusForYear(DateTime? hireDate)
        {
            try
            {
                string incrementYear = System.DateTime.Now.Date.Year.ToString(); ;
                if (hireDate.HasValue)
                {

                    if (hireDate.Value.Date.Month >= 10)
                    {
                        return incrementYear = (System.DateTime.Now.Date.Year + 1).ToString();
                    }
                }
                return incrementYear;
            }
            catch
            {
                return null;
            }
        }

        #endregion
        #endregion



    }

    #region Classes : EmployeeLeaveModified,ApprovalDisapprovalAbility,HolidayWeekendCount,timesheetStatus,VoidDelegate,changePassword,Utils
    public class EmployeeLeaveModified
    {
        public string LeaveTypeName { get; set; }
        public decimal PrevLeaves { get; set; }
        public decimal BalanceLeaves { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid EmpId { get; set; }
        public Guid EmployeeLeaveID { get; set; }
        public decimal IssuedLeaves { get; set; }
        public Guid LeaveTypeID { get; set; }
        public decimal TotalLeaves { get; set; }
        public Nullable<decimal> PostponedLeave { get; set; }
        public int? Year { get; set; }
        public Employee EmployeeName { get; set; }
        public string EmpName { get; set; }
    }
    public class ApprovalDisapprovalAbility
    {
        public bool canApproveDisapprove { get; set; }
        public string message { get; set; }
    }

    public class HolidayWeekendCount
    {
        public HolidayWeekendCount()
        {
        }
        public HolidayWeekendCount(int holiday, int weekend, int totalLeaves)
        {
            this.holiday = holiday;
            this.weekend = weekend;
            this.totalLeaves = totalLeaves;
        }
        public int holiday { get; set; }
        public int weekend { get; set; }
        public int totalLeaves { get; set; }
    }
    public class timesheetStatus
    {
        private static string _approved = "approved";
        private static string _disapproved = "disapproved";
        public static string approved
        {
            get
            {
                return _approved;
            }
        }
        public static string disapproved
        {
            get
            {
                return _disapproved;
            }
        }
    }
    public delegate void VoidDelegate();

    public class changePassword
    {
        public Guid userID { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [System.Web.Mvc.Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public static class Utils
    {
        public static void Try(VoidDelegate v)
        {
            try
            {
                v();
            }
            catch { }
        }
    }
    #endregion
}