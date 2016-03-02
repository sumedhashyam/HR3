using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsHoliday
    {
        #region Declaration: Object & Variables 
        dbHRSystemEntities db = new dbHRSystemEntities();
        #endregion

        #region Function For :Get all Holidays
        public List<Holiday> getHoliday()
        {
            try
            {
                return db.Holidays.Where(a => a.HolidayDate.Year == System.DateTime.Now.Year).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Get all Holidays For A Specific Country
        public List<Holiday> getHolidayByCountryId(Guid id)
        {
            try
            {
                Guid cid = new Guid();

                return db.Holidays.Where(a => a.CountryID == id && a.HolidayDate.Year == System.DateTime.Now.Year).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Get all Holidays For a Specific Employee
        public List<EmployeeHoilday> getHolidayByEmployeeID(Guid employeeID, bool currentYear)
        {
            try
            {
                List<EmployeeHoilday> li = db.EmployeeHoildays.Where(a => a.EmpID == employeeID).OrderBy(a => a.Holiday.HolidayDate).ToList();
                if (currentYear)
                {
                    li = li.Where(a => a.Holiday != null && (a.Holiday.HolidayDate.Year == DateTime.Now.Year)).ToList();
                }
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Get all Holidays For a Specific Employee For A specific Year
        public List<EmployeeHoilday> getHolidayByEmpID_Year(Guid employeeID, int year)
        {
            try
            {
                List<EmployeeHoilday> li = db.EmployeeHoildays.Where(a => a.EmpID == employeeID).OrderBy(a => a.Holiday.HolidayDate).ToList();
                //if (currentYear)
                {
                    li = li.Where(a => a.Holiday != null && (a.Holiday.HolidayDate.Year == year)).ToList();
                }
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Add New Holiday
        public bool addHoliday(Holiday obj)
        {
            try
            {
                //changes made here on 25-Jan-2014
                //I change here countryID to Location ID
               List <Holiday> j = db.Holidays.Where(a => a.HolidayDate == obj.HolidayDate).ToList();
               int i = j.Where(a => a.LocationID == obj.LocationID).Count();
                if (i <= 0)
                {
                    db.Holidays.Add(obj);
                    db.SaveChanges();
                    return true;
                }
                else
                {
                    throw new Exception("Holiday already exist");
                }
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Get a specific Holiday Detail 
        public Holiday getHolidaybyId(Guid id)
        {
            try
            {
                return db.Holidays.Where(a => a.HolidayID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Update Holiday Detail
        public bool updateHolidayDetail(Holiday objEdit)
        {
            try
            {
                Holiday alreadyExist = db.Holidays.Where(a => a.HolidayDate == objEdit.HolidayDate && a.LocationID == objEdit.LocationID).FirstOrDefault();
                if (alreadyExist != null && alreadyExist.HolidayID != objEdit.HolidayID)
                {
                    throw new Exception("Holiday on this date already exist");
                }
                else
                {
                    Holiday HolidayObj = db.Holidays.Where(a => a.HolidayID == objEdit.HolidayID).FirstOrDefault();
                    HolidayObj.HolidayName = objEdit.HolidayName;
                    HolidayObj.HolidayDate = objEdit.HolidayDate;
                    HolidayObj.CountryID = objEdit.CountryID;
                    HolidayObj.LocationID = objEdit.LocationID;
                    HolidayObj.ApplyToStaff = objEdit.ApplyToStaff;
                    //HolidayObj.IsCountInLeave = objEdit.IsCountInLeave;
                    db.SaveChanges();
                    return true;
                }
            }
            catch (Exception ee)
            {
                throw ee;
            }

        }
        #endregion

        #region Function For :Delete Holiday
        public bool deleteHoliday(Guid id)
        {


            try
            {
                Holiday deleteDetail = db.Holidays.Where(a => a.HolidayID == id).FirstOrDefault();

                db.Holidays.Remove(deleteDetail);

                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {

                return false;
            }

        }
        #endregion

        #region Function For :Assign Holiday to a Specific Employee
        public bool AssignEmployeeHoliday(EmployeeHoilday obj, int i)
        {
            try
            {
                //List<EmployeeHoilday> emplv = db.EmployeeHoildays.Where(a => a.EmpID == obj.EmpID).ToList();
                //if (1 == i)
                //{
                //    foreach (var item in emplv)
                //    {
                //        db.EmployeeHoildays.Remove(item);

                //        db.SaveChanges();

                //    }
                //    db.EmployeeHoildays.Add(obj);
                //    db.SaveChanges();
                //    return true;

                //}
                db.EmployeeHoildays.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        #endregion

        #region Function For :Delete Holidays of a Specific Employee
        public bool deleteAllHolidays(Guid employeeID)
        {
            try
            {
                List<EmployeeHoilday> li = db.EmployeeHoildays.Where(a => a.EmpID == employeeID).ToList();
                foreach (var item in li)
                {
                    db.EmployeeHoildays.Remove(item);
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        #endregion
    }
}
