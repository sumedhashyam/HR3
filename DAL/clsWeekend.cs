using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
namespace DAL
{
    /// <summary>
    /// Created By Tailor
    /// 12/9/2013
    /// Softech
    /// </summary>
    public class clsWeekend
    {
        #region Varibles
        dbHRSystemEntities db = new dbHRSystemEntities();
        #endregion

        #region Weekend
        public List<Weekend> GetWeekendByEmployeeID(Guid EmpID)
        {
            return db.Weekends.Where(a => a.EmployeeID == EmpID).ToList();
        }

        public bool DeleteAllWeekendEmployee(Guid EmpID)
        {
            List<Weekend> ObjWeekend = db.Weekends.Where(a => a.EmployeeID == EmpID).ToList();
            foreach (Weekend Objw in ObjWeekend)
            {
                db.Weekends.Remove(Objw);
            }
            db.SaveChanges();
            return true;
        }

        public bool AddNewWeekend(Weekend ObjWeekend)
        {
            ObjWeekend.WeekendID = Guid.NewGuid();
            db.Weekends.Add(ObjWeekend);
            db.SaveChanges();
            return true;
        }
        #endregion

        #region Weekend Working Days
        public List<WeekendWorkingDay> getAllEmployeeWeekendworkingDay(Guid supervisorID)
        {
            try{

                return db.WeekendWorkingDays.Where(a => a.SupervisorID == supervisorID).ToList();
            }catch(Exception ex)
            {
                throw ex;
            }
        }

        public List<WeekendWorkingDay> getAllEmployeeWeekendworkingDayBYEMPID(Guid EMPID)
        {
            try
            {

                return db.WeekendWorkingDays.Where(a => a.SupervisorID == EMPID).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Boolean AddEmployeeWeekendworkingDay(List<WeekendWorkingDay> li, Guid supervisorID ,Guid EmployeeID)
        {
            try
            {
                if (li!= null && li.Count > 0)
                {
                    #region Delete Previous
                    List<WeekendWorkingDay> previousEntry = getAllEmployeeWeekendworkingDay(supervisorID);
                    previousEntry = previousEntry.Where(a => a.EmployeeID == EmployeeID).ToList();
                    if (previousEntry != null && previousEntry.Count > 0)
                    {
                        #region Delete Previous Entry
                            foreach(var prev in previousEntry)
                            {
                            db.WeekendWorkingDays.Remove(prev);
                            }
                        #endregion
                    }
                    #endregion
                    #region Add new Previous Entry
                    foreach (var item in li)
                    {
                        db.WeekendWorkingDays.Add(item);
                    }
                    #endregion
                    db.SaveChanges();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}
