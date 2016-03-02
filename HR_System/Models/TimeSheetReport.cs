using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HR_System.Models;
using DAO;



namespace HR_System.Models
{
    public class TimeSheetReport
    {
        public Guid EmployeeID { get; set; }
        public Guid? ProjectID { get; set; }
        public string FirstNameEn { get; set; }
        public string LastNameEn { get; set; }
        public string ProjectName { get; set; }
        public decimal TotHours { get; set; }
        public decimal ProjPercentage { get; set; }
        public string ProjectStatus { get; set; }

    }

    public class ReportTimeSheet
    {
        public Guid TimeSheetMasterID { get; set; }
        public Guid EmployeeID { get; set; }
        public string ProjectNumber { get; set; }
        public string Month { get; set; }
        public int Year { get; set; }
        public string EmployeeName { get; set; }
        public string ProjectName { get; set; }
        public decimal TotalHours { get; set; }
        public bool? IsSubmit { get; set; }
        public string Status { get; set; }
        public Guid? DepartmentID { get; set; }
        public Guid? OfficeLocationID { get; set; }
        public Guid? supervisorID { get; set; }
        public Guid? alternativeSupervisorID { get; set; }
        public DateTime? altFromDate { get; set; }
        public DateTime? altEndDate { get; set; }
        public Guid? CountryID { get; set; }
        public int MonthInt { get; set; }
    }

    public class TimeSheetReportList
    {
        dbHRSystemEntities db = new dbHRSystemEntities();

        public List<TimeSheetReport> getTimeSheetReport(string month, string year)
        {
            List<TimeSheetReport> TimeSheetRepTbl = (from empl in db.Employees
                                                     join tsm in db.TimeSheetMasters on empl.EmployeeID equals tsm.EmpID
                                                     join ts in db.TimeSheets on
                                                         tsm.TimeSheetMasterID equals ts.TimeSheetMasterID
                                                     join proj in db.Projects on ts.ProjectID equals proj.ProjectId

                                                     where tsm.Month == month && tsm.Year == year
                                                     select new { empl.EmployeeID, empl.FirstNameEn, empl.LastNameEn, ts.ProjectID, proj.ProjectName, ts.Hours, tsm.Status } into x
                                                     group x by new { x.EmployeeID, x.ProjectID, x.FirstNameEn, x.LastNameEn, x.ProjectName, x.Status } into g

                                                     select new TimeSheetReport { EmployeeID = g.Key.EmployeeID, FirstNameEn = g.Key.FirstNameEn, LastNameEn = g.Key.LastNameEn, ProjectID = g.Key.ProjectID, ProjectName = g.Key.ProjectName, ProjectStatus = g.Key.Status, TotHours = (decimal)(g.Sum(i => i.Hours)) }).OrderBy(o => o.EmployeeID).ToList();

            return TimeSheetRepTbl;

        }

    }
}
