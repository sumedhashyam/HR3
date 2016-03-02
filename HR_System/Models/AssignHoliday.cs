using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using System.Data;
using DAL;
using DAO;


namespace HR_System.Models
{
    public class AssignHoliday
    {
       
        public string title { get; set; }
        public DateTime start { get; set; }
        public DateTime end { get; set; }

        dbHRSystemEntities db = new dbHRSystemEntities();
        clsAssignEmpHolidays objEmpHoliday = new clsAssignEmpHolidays();

        public static List<SelectListItem> getYearForAssignHolidays()
        {
            try
            {
                int year = DateTime.Now.Year;
                List<SelectListItem> li = new List<SelectListItem>();
                List<int> lst = new List<int>();
                for (int i = year; i <=year+10 ; i++)
                {

                    li.Add(new SelectListItem { Text = i.ToString(), Value = i.ToString() });
                }


                // Newly added
                List<SelectListItem> list = new List<SelectListItem>();
                foreach (SelectListItem item in li)
                {
                    list.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                list = li.OrderBy(a => a.Text).ToList();
                string dt = DateTime.Now.ToString("yyyy"); ;
                //list.Insert(0, new SelectListItem() { Text = year.ToString(), Value = year.ToString() });
                list.Insert(0, new SelectListItem() { Text = "Select Year", Value = "" });
                // end of select list
                return list;
            }

            catch (Exception ex)
            {
                return null;
            }
        }


          
       public void DelRecIfExistInEmpHolidays(Guid CountryID, int Year)
        {
           

            List<Guid> lst = (from eh in db.EmployeeHoildays
                              join h in db.Holidays on eh.HolidayID equals h.HolidayID
                              where (h.CountryID == CountryID && h.HolidayDate.Year == Year)
                              select eh.EmployeeHoildayID).ToList();
            if (lst.Count > 0)
            {
                objEmpHoliday.DelEmpHolidayRecS(lst);
            }
        }



       public void DelRecIfExistInEmpHolidays4AnEmp(Guid CountryID, int Year,Guid EmpID)
       {
           List<Guid> lst = (from eh in db.EmployeeHoildays
                             join h in db.Holidays on eh.HolidayID equals h.HolidayID
                             where (h.CountryID == CountryID && h.HolidayDate.Year == Year && eh.EmpID==EmpID)
                             select eh.EmployeeHoildayID).ToList();
           if (lst.Count > 0)
           {
               objEmpHoliday.DelEmpHolidayRecS(lst);
           }
       }

       //countryid='bf91ed15-02f2-4899-b7ea-b4f666271159' for INDIA


           // List<Guid> lst = new List<Guid>();
            

//            SELECT        EmployeeHoildays.EmployeeHoildayID AS Expr1
//FROM            EmployeeHoildays INNER JOIN
//                         EmployeeHoildays ON Holiday.HolidayID = EmployeeHoildays.HolidayID
//WHERE        (YEAR(Holiday.HolidayDate) = 2013) AND (Holiday.CountryID = 'bf91ed15-02f2-4899-b7ea-b4f666271159')


      public  void InsEmpHolidays(Guid CountryID, int year)
        {

            List<Employee> lstEmp = objEmpHoliday.getEmployeeByCountryId(CountryID);

            List<Holiday> lstHoliday = objEmpHoliday.getHolidayByCountryYear(CountryID, year);

            foreach (Employee ObjEmp in lstEmp)
            {
                foreach (Holiday ObjHoliday in lstHoliday)
                {
                    EmployeeHoilday tblEmpHoliday = new EmployeeHoilday();
                    tblEmpHoliday.EmployeeHoildayID = Guid.NewGuid();
                    tblEmpHoliday.EmpID = ObjEmp.EmployeeID;
                    tblEmpHoliday.HolidayID = ObjHoliday.HolidayID;
                    objEmpHoliday.addEmpHoliday(tblEmpHoliday);

                }

            }
        }




      public void InsEmpHolidays4AnEmp(Guid CountryID, int year, Guid EmpID)
      {
          List<Holiday> lstHoliday = objEmpHoliday.getHolidayByCountryYear(CountryID, year);
         
              foreach (Holiday ObjHoliday in lstHoliday)
              {
                  EmployeeHoilday tblEmpHoliday = new EmployeeHoilday();
                  tblEmpHoliday.EmployeeHoildayID = Guid.NewGuid();
                  tblEmpHoliday.EmpID = EmpID;
                  tblEmpHoliday.HolidayID = ObjHoliday.HolidayID;
                  objEmpHoliday.addEmpHoliday(tblEmpHoliday);

              }

         
      }

    



    
    }

    
  
    


}