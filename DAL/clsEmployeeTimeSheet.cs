using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAO;
namespace DAL
{
    public class clsEmployeeTimeSheet
    {

        dbHRSystemEntities db = new dbHRSystemEntities();

        public List<TimeSheetMaster> getAllTimeSheet(Guid? emp_id)
        {
            try
            {

                List<TimeSheetMaster> listTimeSheet = db.TimeSheetMasters.Where(a => a.EmpID == emp_id).ToList();
                return listTimeSheet;
            }
            catch (Exception ex)
            {
                throw new Exception("Data not found.");
            }
        }

        public bool addMasterTimeSheet(TimeSheetMaster timesheetMaster)
        {
            try
            {
                db.TimeSheetMasters.Add(timesheetMaster);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<EmployeeProject> listProjects(Guid? emp_ID)
        {
            try
            {
                List<EmployeeProject> lstProjects = db.EmployeeProjects.Where(a => a.EmployeeID == emp_ID).ToList();
                return lstProjects;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Project GetEmployeeProject(Guid? proj_ID)
        {
            try
            {
                Project project = db.Projects.Where(a => a.ProjectId == proj_ID).FirstOrDefault();
                return project;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<EmployeeLeaveRequest> getLeaveRequest(Guid? emp_ID)
        {
            try
            {
                List<EmployeeLeaveRequest> listEmployeeleave = db.EmployeeLeaveRequests.Where(a => a.EmployeeID == emp_ID).ToList();
                return listEmployeeleave;
            }
            catch (Exception ex)
            {

                return null;
            }
        }

        public TimeSheetMaster getTimeSheet(Guid? emp_ID, string month, string year)
        {
            try
            {
                TimeSheetMaster timeSheetMaster = db.TimeSheetMasters.Where(a => a.EmpID == emp_ID && a.Year == year && a.Month == month).FirstOrDefault();
                return timeSheetMaster;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public bool SubmitTimesheet(TimeSheetMaster timeSheet, int month, int year, Guid employeeID, ICollection<EmployeeProject> projectList)
        {
            try
            {
                TimeSheetMaster _timesheet = db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == timeSheet.TimeSheetMasterID).FirstOrDefault();
                if (_timesheet != null)
                {
                    if (makeWeekendsEntryInTimesheet(timeSheet.TimeSheetMasterID, month, year, employeeID, projectList))
                    {
                        _timesheet.IsSubmit = true;
                        db.SaveChanges();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return false;
        }


        public bool makeWeekendsEntryInTimesheet(Guid masterTimesheetID, int month, int year, Guid employeeID, ICollection<EmployeeProject> projectList)
        {
            try
            {
                clsWeekend objWeekend = new clsWeekend();
                List<Weekend> liWeekends = objWeekend.GetWeekendByEmployeeID(employeeID);
                DateTime startDate = new DateTime(year, month, 1);
                int totalDays = DateTime.DaysInMonth(year, month);
                DateTime endDate = new DateTime(year, month, totalDays);
                TimeSpan t = endDate - startDate;
                List<DateTime> li = new List<DateTime>();
                #region  Getting Weekend Off Days
                clsWeekend _objclsWeekend = new clsWeekend();
                List<WeekendWorkingDay> weekWorkDayli = _objclsWeekend.getAllEmployeeWeekendworkingDayBYEMPID(employeeID);
                List<WeekendWorkingDay> employeeweekWorkDayli = new List<WeekendWorkingDay>();
                if (weekWorkDayli != null && weekWorkDayli.Count > 0)
                {
                    employeeweekWorkDayli = weekWorkDayli.Where(a => a.EmployeeID == employeeID).ToList();
                }

                #endregion
                for (int i = 1; i <= totalDays; i++)
                {
                    DateTime dt = new DateTime(year, month, i);
                    if (liWeekends.Where(a => a.WeekEndName.ToLower() == dt.DayOfWeek.ToString().ToLower()).Count() > 0)
                    {
                        foreach (var project in projectList)
                        {
                            if (employeeweekWorkDayli != null && employeeweekWorkDayli.Count > 0)
                            {
                                WeekendWorkingDay isExists = employeeweekWorkDayli.Where(a => a.WeekendDate == dt && a.EmployeeID == employeeID).FirstOrDefault();
                                if (isExists == null)
                                {
                                    TimeSheet tobj = new TimeSheet();
                                    tobj.TimeSheetID = Guid.NewGuid();
                                    tobj.TimeSheetMasterID = masterTimesheetID;
                                    tobj.Date = dt;
                                    tobj.CreatedDate = DateTime.Now;
                                    tobj.Hours = 0;
                                    tobj.ProjectID = project.Project.ProjectId;
                                    tobj.IsWeekend = true;
                                    db.TimeSheets.Add(tobj);
                                    db.SaveChanges();
                                }
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
        public bool saveTimeSheet(TimeSheet timeSheet)
        {
            try
            {
                db.TimeSheets.Add(timeSheet);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public TimeSheetMaster getDetailByTimesheetID(Guid? time_ID)
        {
            try
            {
                return db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == time_ID).FirstOrDefault(); ;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<TimeSheet> getDetailByTime_M_ID(Guid? time_ID)
        {
            try
            {
                return db.TimeSheets.Where(a => a.TimeSheetMasterID == time_ID).ToList();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public TimeSheet getDetailofTimeSheetBYtime_ID(Guid time_ID)
        {
            try
            {
                return db.TimeSheets.Where(a => a.TimeSheetID == time_ID).FirstOrDefault();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool editTimeSheet(TimeSheet timeSheet)
        {
            try
            {
                TimeSheet item = db.TimeSheets.Where(a => a.TimeSheetID == timeSheet.TimeSheetID).FirstOrDefault();
                if (item != null)
                {
                    item.Hours = timeSheet.Hours;
                    db.SaveChanges();
                }  
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool deleteEntry(Guid timesheetMasterID,Guid projectID,DateTime date)
        {
            try
            {
                TimeSheet tSheet = db.TimeSheets.Where(a => a.TimeSheetMasterID == timesheetMasterID && a.ProjectID == projectID && a.Date == date).FirstOrDefault();
                if (tSheet != null)
                {
                    db.TimeSheets.Remove(tSheet);
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }

        }
        public List<TimeSheet> getAllTimeSheet(string month, string year)
        {
            try
            {
                List<TimeSheet> list = db.TimeSheets.Where(a => a.Date.Value.ToString("MMM") == month && a.Date.Value.Year.ToString("yyyy") == year).ToList();
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public TimeSheet getTimesheet(DateTime dateOfEntry, Guid projectID, Guid timesheetMasterID)
        {
            try
            {
                return db.TimeSheets.Where(a => a.TimeSheetMasterID == timesheetMasterID && a.ProjectID == projectID && a.Date == dateOfEntry).FirstOrDefault();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool editTimeSheetMaster(TimeSheetMaster timeSheet)
        {
            try
            {
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public List<TimeSheetMaster> getTimeSheetForSuperadmin(Guid CurrentCountryID)
        {
            
            try
            {
                List<TimeSheetMaster> listTimesheet = new List<TimeSheetMaster>();

                listTimesheet = (from e in db.TimeSheetMasters
                                 join empL in db.Employees on e.EmpID equals empL.EmployeeID
                                 where empL.CountryID == CurrentCountryID
                                 orderby e.CreatedDate
                                 select e).ToList();


                return listTimesheet;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<TimeSheetMaster> getTimeSheetBySupervisorID(Guid? emp_ID, Guid CurrentCountryID)
        {
            try
            {
                List<TimeSheetMaster> listTimesheet = new List<TimeSheetMaster>();

                listTimesheet = (from e in db.TimeSheetMasters
                                 join empL in db.Employees on e.EmpID equals empL.EmployeeID
                                 where empL.SupervisorID == emp_ID && empL.CountryID == CurrentCountryID
                                 orderby e.CreatedDate
                                 select e).ToList();

                return listTimesheet;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<TimeSheetMaster> getTimeSheetByAltSupervisorID(Guid? emp_ID, Guid CurrentCountryID)
        {
            try
            {
                List<TimeSheetMaster> listEmpTimesheet = new List<TimeSheetMaster>();
                DateTime currentDate = DateTime.Now;
                listEmpTimesheet = (from e in db.TimeSheetMasters
                                    join empL in db.Employees on e.EmpID equals empL.EmployeeID
                                    where (empL.AlternativeSupervisorID == emp_ID && empL.CountryID == CurrentCountryID
                                    && (empL.AltFromDate >= currentDate && currentDate <= empL.AltEndDate))
                                    orderby e.CreatedDate
                                    select e).ToList();

                return listEmpTimesheet;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<TimeSheetMaster> getAllForHR()
        {
            try
            {
                List<TimeSheetMaster> list = db.TimeSheetMasters.ToList();
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<TimeSheetMaster> getAllTimeSheetMasterByEmployeeId(Guid? emp_id, string status)
        {
            try
            {
                return db.TimeSheetMasters.Where(a => a.EmpID == emp_id && a.Status.ToLower() == status.ToLower()).OrderBy(a => a.CreatedDate).ToList();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public List<TimeSheetMaster> getTimeSheetMasterAllRequest(Guid? emp_id)
        {
            try
            {
                return db.TimeSheetMasters.Where(a => a.EmpID == emp_id).OrderBy(a => a.CreatedDate).ToList();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<TimeSheetMaster> getTimeSheetMasterAllRequests(Guid? emp_id)
        {
            try
            {
                return db.TimeSheetMasters.Where(a => a.EmpID == emp_id && a.Status==null).OrderBy(a => a.CreatedDate).ToList();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
