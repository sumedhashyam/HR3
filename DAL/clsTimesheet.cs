using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsTimesheet
    {
        dbHRSystemEntities db = new dbHRSystemEntities();
        public List<TimeSheetMaster> getEmployeesTimesheet(Guid EmployeeID)
        {
            try
            {
                return db.TimeSheetMasters.Where(a => a.EmpID == EmployeeID).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public List<TimeSheetMaster> getEmployeesTimesheet(Guid EmployeeID,int year)
        {
            try
            {
                List<TimeSheetMaster> li = db.TimeSheetMasters.Where(a => a.EmpID == EmployeeID ).ToList();
                li = li.Where(a => a.Year != null&&( a.Year==Convert.ToString(year))).ToList();
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public TimeSheetMaster getTimesheetByID(Guid TimesheetMasterID)
        {
            try
            {
                return db.TimeSheetMasters.Where(a => a.TimeSheetMasterID == TimesheetMasterID).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
      
    }
}
