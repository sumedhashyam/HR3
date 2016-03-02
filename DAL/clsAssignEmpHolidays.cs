using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsAssignEmpHolidays
    {
        dbHRSystemEntities db = new dbHRSystemEntities();

        clsHoliday ObjClsHoliday = new clsHoliday();
        
        public List<Holiday> getHolidayByCountryYear(Guid CountryID, int Year)
        {
            try
            {
                return db.Holidays.Where(a => a.HolidayDate.Year == Year && a.CountryID==CountryID).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public List<Employee> getEmployeeByCountryId(Guid CountryID)
        {
            try
            {                
                return db.Employees.Where(a => a.CountryID == CountryID).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }



        public bool addEmpHoliday(EmployeeHoilday obj)
        {
            try
            {
                int i = db.EmployeeHoildays.Where(a => a.EmpID == obj.EmpID && a.HolidayID == obj.HolidayID).Count();
                if (i <= 0)
                {
                    db.EmployeeHoildays.Add(obj);
                    db.SaveChanges();
                    return true;
                }
                else
                {
                    throw new Exception("Holiday for Employee already exist");
                }
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public bool DelEmpHolidayRecS(List<Guid> lstEmpHoliday)
        {

            foreach (Guid obj in lstEmpHoliday)
            {
              EmployeeHoilday emp=  db.EmployeeHoildays.FirstOrDefault(a => a.EmployeeHoildayID == obj);
              db.EmployeeHoildays.Remove(emp);
              db.SaveChanges();
            }
            return true;
        }



        



        
    // CLASS DEFINED WHICH ARE MISSING FROM clsHoliday.cs//
        
        
        public bool delEmpHoliday(Guid id)
        {

            try
            {
                EmployeeHoilday DelEmpHoliday = db.EmployeeHoildays.Where(a => a.EmployeeHoildayID == id).FirstOrDefault();


                db.EmployeeHoildays.Remove(DelEmpHoliday);

                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {

                return false;
            }

        }


    }
}
