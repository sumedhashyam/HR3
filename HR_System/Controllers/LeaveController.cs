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

namespace HR_System.Controllers
{
    [Authorize]
    public class LeaveController : Controller
    {
        //
        // GET: /Leave/
        clsNotification _objNotification = new clsNotification();
        clsLeaveType objclsLeaveType = new clsLeaveType();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult approveDisapproveLeave(Guid? req_id)
        {
            try
            {
                clsEmployeeLeaves clsemployeeLeave = new clsEmployeeLeaves();
                bool assign = false;
                string result = "DisApprove";


                assign = clsemployeeLeave.releaveAssign(req_id, result);
                if (assign == true)
                {
                    TempData["success"] = "Leave disapprove successfully.";
                }
                else
                {
                    TempData["error"] = "Leave disapproved not succeccd.";
                }


                return RedirectToAction("DetailForLeave", new { req_ID = req_id });
            }
            catch (Exception ex)
            {
                TempData["error"] = "some error occoure during approve or disapprove leave.";
                return View();
            }
        }

        public ActionResult DeleteLeaveRequest(Guid req_ID)
        {
            try
            {
                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                EmployeeLeaveRequest leave = clsEmployeeLeave.getDetailForEmployeeLeave(req_ID);

                bool res= clsEmployeeLeave.DeleteEmployeeLeaveRequest(req_ID);

                if (res == true)
                {
                    return Json(new { success = true }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { success = false }, JsonRequestBehavior.AllowGet);
                }
               
            }
            catch (Exception ex)
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
        }



        public ActionResult DetailForLeave(Guid? req_ID)
        {
            try
            {
                bool isApprover = false;
                bool isOwner = false;
                clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                EmployeeLeaveRequest leave = clsEmployeeLeave.getDetailForEmployeeLeave(req_ID);

                clsEmployee objEmployee = new clsEmployee();
                Employee employee = leave.Employee;

                //Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                Guid? employeeID = employee.EmployeeID;
                ViewBag.employeeID = employeeID;


                List<SelectListItem> selectlist = new List<SelectListItem>();

                //clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
                List<LeaveType> listLeave = new List<LeaveType>();
                List<LeaveType> lst = new List<LeaveType>();
                List<EmployeeLeaf> listemployeeLeave = clsEmployeeLeave.getEmployeesbyId(employee.EmployeeID);
                foreach (EmployeeLeaf emp in listemployeeLeave)
                {
                    LeaveType l = MVCSelectList.getAllLeaveTypeID(emp.LeaveTypeID);
                    lst.Add(l);
                }
                selectlist = MVCSelectList.getAllLeaveTypeData(lst);
                ViewData["listLeave"] = selectlist;


                ViewData["req_ID"] = req_ID;

                EmployeeLeaveRequest empLeaveRequest = clsEmployeeLeave.getDetailForEmployeeLeave(req_ID);
                ViewData["empID"] = empLeaveRequest.Employee.SupervisorID;
                ViewData["empIDByLeave"] = employee.EmployeeID;

                ViewBag.isEndDate = empLeaveRequest.ToDate.HasValue;

                #region To Approve and Unapprove
                bool canApproveDisapprove = false;
                if (MVCUtility.IsSuperAdmin())
                {
                    isApprover = true;
                    canApproveDisapprove = true;
                    // message = "You Are Viewing This Timesheet As Super Admin";
                }
                else
                {
                    Guid? currentEmployeeID = MVCUtility.getCurrentEmployeeID();
                    if (currentEmployeeID == employee.EmployeeID)
                    {
                        isOwner = true;
                        // message = "You Are Viewing This Timesheet As Owner";
                    }
                    else if (currentEmployeeID == employee.SupervisorID)
                    {
                        // message = "You Are Viewing This Timesheet As Supervisor";
                        isApprover = true;
                        canApproveDisapprove = true;
                    }
                    else if (currentEmployeeID == employee.AlternativeSupervisorID)
                    {
                        //if (employee.AltFromDate <= DateTime.Now.Date && DateTime.Now.Date <= employee.AltEndDate)
                        {
                            // message = "You Are Viewing This Timesheet As Alternative Supervisor";
                            isApprover = true;
                            canApproveDisapprove = true;
                        }
                    }
                }
                ViewBag.isApprover = isApprover;
                ViewBag.isOwner = isOwner;
                ViewBag.canApproveDisapprove = canApproveDisapprove;
                if (isApprover == false && isOwner == false)
                {
                    return View("AccessDenied");
                }
                #endregion

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
                TempData["error"] = "Error :" + ex.Message;
                return View("Error");
            }
        }

        //[HttpPost]
        //[ValidateInput(true)]
        //public ActionResult DetailForLeaveOld(EmployeeLeaveRequest leaveRequest, string end_date, string ddlDay, FormCollection coll)
        //{
        //    try
        //    {

        //        Guid requestID = new Guid(coll["requestID"].ToString());
        //        ViewData["req_ID"] = requestID;

        //        #region Temp Code
        //        bool approve = Convert.ToBoolean(coll["hfapprove"].ToString());
        //        if (approveDisapproveLeave(requestID, approve))
        //        {
        //            if (approve)
        //                TempData["success"] = "Leave Request approved successfully";
        //            else
        //                TempData["success"] = "Leave Request disapproved successfully";
        //            return RedirectToAction("detailedLeaveForSupervisor", "Employee");
        //        }
        //        else
        //        {
        //            TempData["error"] = "Some error occured while processing your request";
        //            return RedirectToAction("detailedLeaveForSupervisor", "Employee");
        //        }
        //        #endregion
        //        Guid? currentEmployeeID = MVCUtility.getCurrentEmployeeID();
        //        #region For Drodown
        //        List<SelectListItem> selectlist = new List<SelectListItem>();
        //        List<LeaveType> lst = new List<LeaveType>();
        //        clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
        //        List<EmployeeLeaf> listemployeeLeave = clsEmployeeLeave.getEmployeesbyId(currentEmployeeID);
        //        foreach (EmployeeLeaf emp in listemployeeLeave)
        //        {
        //            LeaveType l = MVCSelectList.getAllLeaveTypeID(emp.LeaveTypeID);
        //            lst.Add(l);

        //        }
        //        selectlist = MVCSelectList.getAllLeaveTypeData(lst);
        //        LeaveType leaveType = new LeaveType();
        //        lst.Add(leaveType);
        //        ViewData["listLeave"] = selectlist;
        //        #endregion

        //        bool isEndDate = isEndDate = coll["isEndDate"].Contains("true");
        //        ViewBag.isEndDate = isEndDate;
        //        if (!ModelState.IsValid)
        //        {
        //            return View(leaveRequest);
        //        }
        //        else
        //        {
        //            if (isEndDate && leaveRequest.ToDate.HasValue == false)
        //            {
        //                ModelState.AddModelError("", "ToDate is required");
        //                return View(leaveRequest);
        //            }

        //        }
        //        if (leaveRequest.FromDate <= DateTime.Now.Date)
        //        {
        //            ModelState.AddModelError("FromDate", "From date must be a future date.");
        //            return View(leaveRequest);
        //        }
        //        DateTime? ToDate = isEndDate ? leaveRequest.ToDate : null;
        //        DateTime FromDate = leaveRequest.FromDate.Value;

        //        //string news_date = leaveRequest.FromDate.ToString();


        //        clsEmployee objEmployee = new clsEmployee();
        //        Guid UserID = MVCUtility.getCurrentUserID();
        //        Employee employee = objEmployee.getEmployeesbyIdForReq(UserID);

        //        List<LeaveType> listLeave = new List<LeaveType>();


        //        List<Holiday> holidayList = new List<Holiday>();
        //        Holiday holiday = new Holiday();

        //        // get Holiday List For this employee
        //        List<string> lstString = new List<string>();
        //        List<EmployeeHoilday> lstEmpHoliday = clsEmployeeLeave.getEmployeeHolidayList(employee.EmployeeID);
        //        foreach (EmployeeHoilday Empholiday in lstEmpHoliday)
        //        {
        //            holiday = clsEmployeeLeave.GetHolidayListByID(Empholiday.HolidayID);
        //            holidayList.Add(holiday);
        //        }

        //        Employee employeeforAltSuperviser = new Employee();
        //        MembershipUser superviser = null;
        //        bool exist = false;


        //        #region Get superviseID OR alternative suvervisor ID
        //        string supervisorEmail = "";
        //        Guid? SupervisorUserID = null;
        //        if (employee.AlternativeSupervisorID.HasValue)
        //        {
        //            employeeforAltSuperviser = objEmployee.getEmployeesbyId(employee.AlternativeSupervisorID.Value);
        //            if (employeeforAltSuperviser != null)
        //            {
        //                DateTime dateNow = DateTime.Now;
        //                if (employee.AltFromDate.HasValue && employee.AltEndDate.HasValue)
        //                {
        //                    DateTime altFromDate = Convert.ToDateTime(employee.AltFromDate);
        //                    DateTime altToDate = Convert.ToDateTime(employee.AltEndDate);
        //                    if (dateNow <= altToDate && dateNow >= altFromDate)
        //                    {
        //                        exist = true;
        //                        SupervisorUserID = employeeforAltSuperviser.UserID;
        //                    }
        //                }
        //            }
        //        }
        //        else
        //        {
        //            Employee employeeforSuper = objEmployee.getEmployeesbyId(employee.SupervisorID.Value);
        //            if (employeeforSuper != null)
        //            {
        //                exist = true;
        //                SupervisorUserID = employeeforSuper.UserID;
        //            }
        //        }
        //        if (exist)
        //        {
        //            MembershipUser u = Membership.GetUser(SupervisorUserID);
        //            supervisorEmail = u.Email;
        //            superviser = u;
        //        }
        //        #endregion

        //        // get all leave request to check if already exist
        //        List<EmployeeLeaveRequest> getAllLeaveRequest = clsEmployeeLeave.getAllLeaveRequesByEmployeeID(employee.EmployeeID);


        //        TimeSpan time = new TimeSpan();
        //        int year = FromDate.Year;
        //        // check how many leave  avalaible in this year
        //        EmployeeLeaf employeeL = clsEmployeeLeave.getEmployeeLeveByLeaveID(employee.EmployeeID, leaveRequest.LeaveTypeID, year);

        //        if (isEndDate)
        //        {

        //            #region Leave for a period
        //            TimeSpan dateDiffrence = ToDate.Value - FromDate;
        //            if (dateDiffrence.Days == 0)
        //            {
        //                ModelState.AddModelError("", "From Date and To Date can not be equal");
        //                return View(leaveRequest);
        //            }
        //            else if (dateDiffrence.Days < 0)
        //            {
        //                ModelState.AddModelError("", "From Date must be lesser than To Date");
        //                return View(leaveRequest);
        //            }

        //            List<DateTime> listDate = new List<DateTime>();
        //            int totalLeaves = 0;
        //            bool result = false;

        //            string Reason = "";
        //            bool chckSunday = false;
        //            string error = "";
        //            List<DateTime> lstLeave = new List<DateTime>();
        //            List<string> lstReason = new List<string>();
        //            for (int i = 0; i <= time.Days; i++)
        //            {
        //                DateTime dt = FromDate.AddDays(i);
        //                DateTime dtTo = ToDate.Value.AddDays(i);
        //                if (dt.DayOfWeek == DayOfWeek.Sunday || dt.DayOfWeek == DayOfWeek.Saturday)
        //                {
        //                    lstLeave.Add(dt);
        //                    string dty = dt.ToString("dd-MMM-yyyy");

        //                    Reason += dty + " " + "is not include because:" + dt.DayOfWeek + ",";
        //                    chckSunday = true;
        //                }
        //                else
        //                {
        //                    chckSunday = false;
        //                }
        //                // manage leave according to holiday

        //                foreach (Holiday hDay in holidayList)
        //                {
        //                    if (dt.Date == hDay.HolidayDate)
        //                    {
        //                        string dty = dt.ToString("dd-MMM-yyyy");
        //                        Reason += dty + " " + "is not include because this day is holiday.";
        //                        lstString.Add("Holiday");
        //                    }
        //                }
        //                bool isOkay = true;
        //                foreach (EmployeeLeaveRequest empLeaveR in getAllLeaveRequest)
        //                {
        //                    if (empLeaveR.ToDate != null)
        //                    {
        //                        TimeSpan? timeS = empLeaveR.ToDate - empLeaveR.FromDate;

        //                        for (int j = 0; j <= timeS.Value.Days; j++)
        //                        {
        //                            DateTime chkFDate = empLeaveR.FromDate.Value.AddDays(j);
        //                            if (dt.Date == chkFDate.Date)
        //                            {

        //                                error += " request for " + chkFDate.Date.ToShortDateString() + " is already exist,";

        //                            }
        //                        }
        //                    }
        //                }
        //            }

        //            if (!string.IsNullOrEmpty(error))
        //            {
        //                ModelState.AddModelError("", error);
        //                return View(leaveRequest);
        //            }

        //            totalLeaves += 1;
        //            leaveRequest.EmployeeID = employee.EmployeeID;
        //            leaveRequest.EmployeeLeaveRequestID = Guid.NewGuid();
        //            leaveRequest.FromDate = FromDate.Date;
        //            leaveRequest.ToDate = ToDate.Value.Date;
        //            leaveRequest.ActualDate = time.Days + 1;
        //            leaveRequest.CreateDate = DateTime.Now;
        //            int rema = time.Days + 1 - lstLeave.Count();
        //            string e = Reason;
        //            if (lstString.Count > 0)
        //            {
        //                rema = rema - lstString.Count();
        //            }
        //            leaveRequest.AssignedDate = rema;
        //            leaveRequest.LeaveDetectionReason = e;
        //            clsEmployeeLeave.addEmployeeLeaveRquest(leaveRequest);

        //            if (approveDisapproveLeave(requestID, true))
        //            {
        //                TempData["success"] = "Leave Request approved successfully";
        //                return RedirectToAction("DetailForLeave", new { req_ID = requestID });
        //            }
        //            else
        //            {
        //                TempData["error"] = "Some error occured while approving your request";
        //                return RedirectToAction("DetailForLeave", new { req_ID = requestID });
        //            }
        //            //mailSend(superviser.Email, leaveRequest.EmployeeLeaveRequestID, superviser.UserName);

        //            //string total = (time.Days + 1 - lstLeave.Count()).ToString();
        //            //int shL = Convert.ToInt32(employeeL.TotalLeaves) - rema;

        //            //TempData["success"] = "Leave Request send successfully. Your request is for '" + rema + "' Leaves and you have'" + shL + "' remaining leave for this year.";
        //            //return RedirectToAction("leaveData");

        //            #endregion
        //        }
        //        else
        //        {
        //            #region Single Day Leave
        //            int assigned_Date = 1;
        //            DateTime dt = FromDate;
        //            string error = "";
        //            string reason = "";
        //            foreach (Holiday hDay in holidayList)
        //            {
        //                if (dt.Date == hDay.HolidayDate)
        //                {
        //                    string dty = dt.ToString("dd-MMM-yyyy");
        //                    reason += dty + " " + "is not include because this day is holiday.";

        //                    lstString.Add("Holiday");
        //                }
        //            }

        //            int resultCount = (from item in getAllLeaveRequest
        //                               where ((item.ToDate.HasValue && FromDate >= item.FromDate && FromDate <= item.ToDate)
        //                               || (!item.ToDate.HasValue && item.FromDate == FromDate))
        //                               select item).Count();

        //            if (resultCount > 0)
        //            {
        //                ModelState.AddModelError("", "Request for " + FromDate.Date.ToShortDateString() + " is already exist");
        //                return View(leaveRequest);
        //            }

        //            if (dt.DayOfWeek != DayOfWeek.Sunday && dt.DayOfWeek != DayOfWeek.Saturday)
        //            {
        //                bool halfDay = false;
        //                if (ddlDay.ToLower() == "halfday")
        //                {
        //                    halfDay = true;
        //                }
        //                leaveRequest.EmployeeID = employee.EmployeeID;
        //                leaveRequest.EmployeeLeaveRequestID = Guid.NewGuid();
        //                //leaveRequest.LeaveDate = dt;
        //                leaveRequest.FromDate = FromDate;
        //                leaveRequest.ToDate = null;
        //                leaveRequest.ActualDate = 1;
        //                leaveRequest.HalfDay = halfDay;
        //                if (lstString.Count > 0)
        //                {
        //                    assigned_Date = 0;
        //                    leaveRequest.LeaveDetectionReason = reason;
        //                }
        //                leaveRequest.AssignedDate = assigned_Date;
        //                leaveRequest.CreateDate = DateTime.Now;
        //                if (approveDisapproveLeave(requestID, true))
        //                {
        //                    TempData["success"] = "Leave Request approved successfully";
        //                    return RedirectToAction("DetailForLeave", new { req_ID = requestID });
        //                }
        //                else
        //                {
        //                    TempData["error"] = "Some error occured while approving your request";
        //                    return RedirectToAction("DetailForLeave", new { req_ID = requestID });
        //                }
        //            }
        //            else
        //            {
        //                ModelState.AddModelError("", "The day is  saturday or saunday.");
        //                return View(leaveRequest);
        //            }

        //            #endregion
        //        }


        //    }
        //    catch (Exception ex)
        //    {
        //        TempData["error"] = "Error: " + ex.Message;
        //        return View();
        //    }

        //}

        [HttpPost]
        public ActionResult DetailForLeave(EmployeeLeaveRequest leaveRequest, FormCollection coll)
        {
            string notes = coll["Notes"] != null ? coll["Notes"].ToString() : "";
            bool isApprover = false;
            bool isOwner = false;
            EmployeeController objEmployeeController = new EmployeeController();
            clsEmployeeLeaves clsEmployeeLeave = new clsEmployeeLeaves();
            Guid requestID = new Guid(coll["requestID"].ToString());
            EmployeeLeaveRequest empLeaveRequest = clsEmployeeLeave.getDetailForEmployeeLeave(requestID);

            //set only some property
            empLeaveRequest.FromDate = leaveRequest.FromDate;
            empLeaveRequest.ToDate = leaveRequest.ToDate;
            empLeaveRequest.LeaveTypeID = leaveRequest.LeaveTypeID;
            empLeaveRequest.HalfDay = leaveRequest.HalfDay;
            empLeaveRequest.LeaveReason = leaveRequest.LeaveReason;

            clsEmployee objEmployee = new clsEmployee();
            Employee employee = empLeaveRequest.Employee;

            ViewData["req_ID"] = requestID;
            Guid? currentEmployeeID = empLeaveRequest.EmployeeID;
            ViewBag.employeeID = currentEmployeeID;

            #region Code To Disapprove
            bool approve = Convert.ToBoolean(coll["hfapprove"].ToString());
            if (approve == false)
            {
                if (approveDisapproveLeave(requestID, approve))
                {
                    if (MVCUtility.IsSuperAdmin())
                    {
                        addLogTableEntry(requestID, null, "reject", notes);
                    }
                    else
                    {
                        Guid? employeeIdOfApprover = MVCUtility.getCurrentEmployeeID();
                        addLogTableEntry(requestID, employeeIdOfApprover, "reject", notes);
                    }

                    TempData["success"] = "Leave Request disapproved successfully";

                    string message = "Your leave request has been disapproved";
                    try
                    {
                        message = string.Format("Your request of leave from {0} to {1} has been disapproved", leaveRequest.FromDate.Value.ToShortDateString(), leaveRequest.ToDate.Value.ToShortDateString());
                    }
                    catch (Exception ee)
                    {
                    }
                    addNotification(employee.EmployeeID, message, leaveRequest.EmployeeLeaveRequestID);

                    return RedirectToAction("detailedLeaveForSupervisor", "Employee");
                }
                else
                {
                    TempData["error"] = "Some error occured while processing your request";
                    return RedirectToAction("detailedLeaveForSupervisor", "Employee");
                }
            }
            #endregion

            #region To Approve and Unapprove
            bool canApproveDisapprove = false;
            if (MVCUtility.IsSuperAdmin())
            {
                isApprover = true;
                canApproveDisapprove = true;
                // message = "You Are Viewing This Timesheet As Super Admin";
            }
            else
            {
                //Guid? currentEmployeeID = MVCUtility.getCurrentEmployeeID();
                if (currentEmployeeID == employee.EmployeeID)
                {
                    isOwner = true;
                    // message = "You Are Viewing This Timesheet As Owner";
                }
                else if (currentEmployeeID == employee.SupervisorID)
                {
                    // message = "You Are Viewing This Timesheet As Supervisor";
                    isApprover = true;
                    canApproveDisapprove = true;
                }
                else if (currentEmployeeID == employee.AlternativeSupervisorID)
                {
                   // if (employee.AltFromDate <= DateTime.Now.Date && DateTime.Now.Date <= employee.AltEndDate)
                    {
                        // message = "You Are Viewing This Timesheet As Alternative Supervisor";
                        isApprover = true;
                        canApproveDisapprove = true;
                    }
                }
            }
            ViewBag.isApprover = isApprover;
            ViewBag.isOwner = isOwner;
            ViewBag.canApproveDisapprove = canApproveDisapprove;
            if (isApprover == false && isOwner == false)
            {
                return View("AccessDenied");
            }
            #endregion

            string siteurl = WebConfigurationManager.AppSettings["WebUrl"].ToString();
            MVCUtility utilityObj = new MVCUtility();
            try
            {

                #region For Drodown
                List<SelectListItem> selectlist = new List<SelectListItem>();
                List<LeaveType> lst = new List<LeaveType>();
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
                //    ModelState.AddModelError("FromDate", "From Date can not be a past date.");
                //    return View(leaveRequest);
                //}
                DateTime? ToDate = isEndDate ? leaveRequest.ToDate : null;
                DateTime FromDate = leaveRequest.FromDate.Value;

                List<LeaveType> listLeave = new List<LeaveType>();

                Holiday holiday = new Holiday();

                string userEmailAddress = employee.Email;

                // get all leave request to check if already exist
                List<EmployeeLeaveRequest> getAllLeaveRequest = clsEmployeeLeave.getAllLeaveRequesByEmployeeID(employee.EmployeeID);


                TimeSpan time = new TimeSpan();
                int year = FromDate.Year;
                // check how many leave  avalaible in this year
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

                    #region Check If Leave is already requested or has weekedns and holidays

                    //List<string> weekendHolidayList = utilityObj.checkForWeekendOrHolidays(employee.EmployeeID, FromDate, ToDate.Value);
                    List<string> weekendHolidayList = objEmployeeController.checkForLeaves(leaveRequest.LeaveTypeID, employee.EmployeeID, FromDate, ToDate.Value, false, true, requestID) as List<string>;
                    if (weekendHolidayList.Count() > 0)
                    {
                        foreach (var item in weekendHolidayList)
                            ModelState.AddModelError("", item);
                        return View(leaveRequest);
                    }
                    #endregion

                    HolidayWeekendCount CountObj = utilityObj.checkForWeekendOrHolidaysCount(employee.EmployeeID, FromDate, ToDate.Value, true, requestID);
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
                    leaveRequest.EmployeeLeaveRequestID = requestID;
                    leaveRequest.CreateDate = DateTime.Now;
                    leaveRequest.FromDate = FromDate.Date;
                    leaveRequest.ToDate = ToDate.Value.Date;
                    leaveRequest.ActualDate = CountObj.totalLeaves;
                    leaveRequest.AssignedDate = CountObj.totalLeaves - (CountObj.holiday + CountObj.weekend);
                    leaveRequest.LeaveDetectionReason = "";

                    if (clsEmployeeLeave.updateEmployeeLeaveRquest(leaveRequest))
                    {
                        approveDisapproveLeave(requestID, true);
                        try
                        {
                            utilityObj.deleteTimesheetEntriesOfGivenDateRange(employee.EmployeeID, leaveRequest.FromDate.Value, leaveRequest.ToDate.Value);
                        }
                        catch (Exception ee) { }

                        if (MVCUtility.IsSuperAdmin())
                        {
                            addLogTableEntry(requestID, null, "approve", notes);
                        }
                        else
                        {
                            Guid? employeeIdOfApprover = MVCUtility.getCurrentEmployeeID();
                            addLogTableEntry(requestID, employeeIdOfApprover, "approve", notes);
                        }

                        string message = "Your leave request has been approved";
                        try
                        {
                            message = string.Format("Your request of leave from {0} to {1} has been approved", leaveRequest.FromDate.Value.ToShortDateString(), leaveRequest.ToDate.Value.ToShortDateString());
                        }
                        catch (Exception ee)
                        {
                        }
                        addNotification(employee.EmployeeID, message, requestID);

                        TempData["success"] = "Leave Request approved successfully.";
                    }
                    else
                    {
                        TempData["error"] = "Leave Request approval failed. Some unexpeated error occured";
                    }
                    return RedirectToAction("detailedLeaveForSupervisor", "Employee");

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
                    List<string> errorList = objEmployeeController.checkForLeaves(leaveRequest.LeaveTypeID, employee.EmployeeID, FromDate, null, false, true, requestID) as List<string>;
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
                    leaveRequest.EmployeeLeaveRequestID = requestID;
                    //leaveRequest.LeaveDate = dt;
                    leaveRequest.FromDate = FromDate;
                    leaveRequest.ToDate = FromDate;
                    leaveRequest.ActualDate = 1;
                    leaveRequest.HalfDay = halfDay;
                    leaveRequest.AssignedDate = assigned_Date;
                    leaveRequest.CreateDate = DateTime.Now;

                    if (clsEmployeeLeave.updateEmployeeLeaveRquest(leaveRequest))
                    {
                        approveDisapproveLeave(requestID, true);
                        try
                        {
                            utilityObj.deleteTimesheetEntriesOfGivenDateRange(employee.EmployeeID, leaveRequest.FromDate.Value, leaveRequest.ToDate.Value);
                        }
                        catch (Exception ee) { }

                        if (MVCUtility.IsSuperAdmin())
                        {
                            addLogTableEntry(requestID, null, "approve", notes);
                        }
                        else
                        {
                            Guid? employeeIdOfApprover = MVCUtility.getCurrentEmployeeID();
                            addLogTableEntry(requestID, employeeIdOfApprover, "approve", notes);
                        }


                        string message = "Your leave request has been approved";
                        try
                        {
                            message = string.Format("Your request of leave of {0} has been approved", leaveRequest.FromDate.Value.ToShortDateString());
                        }
                        catch (Exception ee)
                        {
                        }
                        addNotification(employee.EmployeeID, message, requestID);


                        TempData["success"] = "Leave Request approved successfully.";
                    }
                    else
                    {
                        TempData["error"] = "Leave Request approval failed. Some unexpeated error occured";
                    }
                    return RedirectToAction("detailedLeaveForSupervisor", "Employee");

                    #endregion
                }

            }
            catch (Exception ex)
            {
                TempData["error"] = "Error: " + ex.Message;
                return View();
            }
        }

        public ActionResult cancelLeave(Guid req_ID, string notes)
        {
            try
            {

                clsEmployeeLeaveRequest objEmployeeLeaveRequest = new clsEmployeeLeaveRequest();

                bool res = objEmployeeLeaveRequest.cancelLeaveRequest(req_ID);
                if (res)
                {
                    //send mail to user
                    dbHRSystemEntities db = new dbHRSystemEntities();
                    EmployeeLeaveRequest requestObj = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == req_ID).FirstOrDefault();


                    if (MVCUtility.IsSuperAdmin())
                    {
                        addLogTableEntry(req_ID, null, "cancel", notes);
                    }
                    else
                    {
                        Guid? employeeID = MVCUtility.getCurrentEmployeeID();
                        addLogTableEntry(req_ID, employeeID, "cancel", notes);
                    }

                    if (requestObj != null && requestObj.EmployeeID.HasValue)
                    {
                        string message = "Your leave request has been cancelled";
                        try
                        {
                            message = string.Format("Your request of leave from {0} to {1} has been cancelled", requestObj.FromDate.Value.ToShortDateString(), requestObj.ToDate.Value.ToShortDateString());
                        }
                        catch (Exception ee)
                        {
                        }
                        addNotification(requestObj.EmployeeID.Value, message, requestObj.EmployeeLeaveRequestID);
                    }

                    //TempData["success"] = "Leave request cancelled successfully.";
                    return Json(new { success = true, msg = "Leave request cancelled successfully." }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    // TempData["error"] = "Some error occured while processing your request.";
                    return Json(new { success = false, msg = "Some error occured while processing your request." }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                // TempData["error"] = "Error: " + ex.Message;
                return Json(new { success = false, msg = "Error: " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
            // return RedirectToAction("detailedLeaveForSupervisor", "Employee");
        }


        public bool approveDisapproveLeave(Guid requestID, bool approve)
        {
            try
            {

                bool result = false;
                clsEmployeeLeaves clsemployeeLeave = new clsEmployeeLeaves();
                EmployeeLeaveRequest req = clsemployeeLeave.getDetailForEmployeeLeave(requestID);
                string email = req.Employee.Email;
                string name = email;
                try
                {
                    name = string.Format("{0} {1}", req.Employee.FirstNameEn, req.Employee.LastNameEn);
                }
                catch (Exception ee)
                {
                }
                if (approve)
                {
                    // because this method is called after apprvel to send mail
                    result = true;
                }
                else
                {
                    result = clsemployeeLeave.disapproveLeave(requestID);
                }
                // Send mail if result is true
                if (result)
                {
                    string SiteUrl = "";
                    string SiteLogUrl = WebConfigurationManager.AppSettings["SiteLogUrl"];
                    string WebsiteUrl = WebConfigurationManager.AppSettings["WebUrl"];
                    string link = WebsiteUrl + "Leave/DetailForLeave?req_ID=" + requestID;
                    sendMail send = new sendMail();
                    string EmailTitle = "Leave Request";
                    string subjects = "Leave Request - Approval/ Disapproval";
                    string Message = "";
                    if (approve)
                    {
                        Message = "<table>";
                        Message += "<tr><td>Your Leave Request Has Been Approved</td></tr>";
                        Message += "<tr><td><a href='" + link + "'>Click here to view detail</a></td></tr>";
                        Message += "</table>";
                    }
                    else
                    {

                        Message = "<table>";
                        Message += "<tr><td>Your Leave Request Has Been Disapproved</td></tr>";
                        Message += "<tr><td><a href='" + link + "'>Click here to view detail</a></td></tr>";
                        Message += "</table>";
                    }
                    string websitename = "HR System";
                    string html = sendMail.getMailHTML(websitename, EmailTitle, name, Message, SiteUrl, SiteLogUrl, WebsiteUrl).ToString();
                    bool mail = send.MailSender(email, html, subjects);
                }
                return result;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public void addNotification(Guid employeeID, string message, Guid requestID)
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
    }
}
