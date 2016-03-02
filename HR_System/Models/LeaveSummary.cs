using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DAL;
using DAO;

namespace HR_System.Models
{
    public class LeaveSummary
    {
        public List<LeaveSummaryVM> getLeaveSummary(Employee empoyeeObj, Guid TimesheetMasterId, TimeSheetMaster Model)
        {
            try
            {
                dbHRSystemEntities db = new dbHRSystemEntities();

                // Select distinct projects
                //TimeSheetMaster timeseet = db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == TimesheetMasterId).FirstOrDefault();
                //List<Project> projectsUsedInTimeseet = (from item in timeseet.TimeSheets
                //                                        select item.ProjectID).Distinct();

                int workingHours = 8;
                int yr=int.Parse(Model.Year);
                Utils.Try(() => workingHours = Convert.ToInt32(WebConfigurationManager.AppSettings["WorkingHours"].ToString()));
                List<LeaveSummaryVM> li = new List<LeaveSummaryVM>();

                List<Guid?> empProJLi = db.EmployeeProjects.Where(empliP => empliP.EmployeeID == Model.EmpID && (empliP.FromDate.Value.Month <= Model.MonthNumber && empliP.FromDate.Value.Year <= yr)|| (empliP.ToDate.Value.Month >= Model.MonthNumber  && empliP.ToDate.Value.Year >= yr)).Select(l => l.ProjectID).Distinct().ToList();

                #region Calculate Timesheet Summary from Timesheets
                var result = (from item in Model.TimeSheets
                              group item by item.ProjectID into gItem
                              join pro in db.Projects on gItem.Key equals pro.ProjectId
                              join er in empProJLi on pro.ProjectId equals er.Value
                             
                              select new
                              {
                                  projectID=pro.ProjectId,
                                  ProjectNumber = pro.ProjectNumber,
                                  ProjectName = pro.ProjectName,
                                  Hours = gItem.Sum(a => a.Hours),
                                  isLeave = false
                              });
           
                #endregion

                #region Calculate Timesheet Summary from  Vacations
                clsLeaveType _objLeaveTypes = new clsLeaveType();
                List<LeaveType> leaveTypesList = _objLeaveTypes.getLeaveType();

                List<EmployeeLeaveRequest> leaveRequestList = empoyeeObj.EmployeeLeaveRequests.Where(a => a.Status.Trim().ToLower() == "approved" && a.Cancel != true).ToList();
                // this query filters leave requests and keep only those leaves which occurs in current timesheet month
                leaveRequestList = (from _leave in leaveRequestList
                                    where (_leave.FromDate.HasValue && _leave.FromDate.Value.Month == Model.MonthNumber && _leave.FromDate.Value.Year.ToString() == Model.Year)
                                    && (_leave.ToDate.HasValue && _leave.ToDate.Value.Month == Model.MonthNumber && _leave.ToDate.Value.Year.ToString() == Model.Year)
                                    select _leave).ToList();


                var LeavesResult = from item in leaveRequestList
                                   join leaveType in leaveTypesList
                                   on item.LeaveTypeID equals leaveType.LeaveTypeID
                                   select new
                                   {
                                       LeaveTypeID = item.LeaveTypeID,
                                       leaveType = leaveType.LeaveTypeName,
                                       HalfDay = item.HalfDay,
                                       isLeave = true,
                                       assignedDays = item.AssignedDate
                                   };

                IEnumerable<Guid?> distinctLeaves = LeavesResult.GroupBy(cust => cust.LeaveTypeID).Select(a => a.Key);
                #endregion

                // Add Project Hours
                if (result.Count() > 0)
                {
                    foreach (var item in result)
                    {
                        LeaveSummaryVM obj = new LeaveSummaryVM();
                        obj.hour = item.Hours ?? 0;
                        obj.percentage = null;
                        obj.projectName = item.ProjectName;
                        obj.projectNumber = item.ProjectNumber;
                        obj.isLeave = false;
                        li.Add(obj);
                    }
                }

                // Looping through different leave types
                foreach (var LeaveTypeID in distinctLeaves)
                {

                    int LeaveHour = 0;
                    // make sum of hours of leaves
                    foreach (var item in LeavesResult.Where(a => a.LeaveTypeID == LeaveTypeID))
                    {
                        int assignedDays = item.assignedDays ?? 0;

                        if (item.HalfDay == true)
                        {
                            LeaveHour += (workingHours / 2);
                        }
                        else
                        {

                            LeaveHour += (workingHours * assignedDays);
                        }

                    }
                    if (LeavesResult.Where(a => a.LeaveTypeID == LeaveTypeID).Count() > 0)
                    {
                        LeaveSummaryVM obj = new LeaveSummaryVM();
                        obj.hour = LeaveHour;
                        obj.percentage = null;
                        obj.projectName = LeavesResult.Where(a => a.LeaveTypeID == LeaveTypeID).First().leaveType;
                        obj.projectNumber = "";
                        obj.isLeave = true;
                        li.Add(obj);
                    }
                }

                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }

        }
    }

    public class LeaveSummaryVM
    {
        public string projectName { get; set; }
        public string projectNumber { get; set; }
        public decimal hour { get; set; }
        public decimal? percentage { get; set; }
        public bool isLeave { get; set; }
        public Guid ProjectID { get; set; }
    }

}