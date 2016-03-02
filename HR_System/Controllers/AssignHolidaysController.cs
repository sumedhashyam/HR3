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
using System.Threading;
using System.Globalization;

namespace HR_System.Controllers
{
    public class AssignHolidaysController : Controller
    {
        dbHRSystemEntities db = new dbHRSystemEntities();
        AssignHoliday objAssignHolidayMODEL = new AssignHoliday();
        Guid CurrentCountryID = MVCUtility.getCurrentCountryID();


        public ActionResult Index()
        {
            return View();
        }


        public ActionResult AssignEmpHolidays()
        {
            try
            {
                ViewData["Employee"] = MVCSelectList.getAllEmployee();
                ViewData["Year"] = AssignHoliday.getYearForAssignHolidays();
                return View();
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        //BULK INSERTION FOR A COUNTRY & YEAR
   //     public ActionResult AddEmpHolidayRecS(Guid CountryID = "09a9c46f-19a9-4207-a2e3-75ded54bcd40", int Year);

             public ActionResult AddEmpHolidayRecS(int Year,Guid ? EmpID)
        {
            string str ="sucess";
            if (EmpID.HasValue==false)
            {

                objAssignHolidayMODEL.DelRecIfExistInEmpHolidays(CurrentCountryID, Year);
                objAssignHolidayMODEL.InsEmpHolidays(CurrentCountryID, Year);
            }
            else
            {               
                objAssignHolidayMODEL.DelRecIfExistInEmpHolidays4AnEmp(CurrentCountryID, Year,EmpID.Value);
                objAssignHolidayMODEL.InsEmpHolidays4AnEmp(CurrentCountryID, Year,EmpID.Value);
            }

            
                 
                 return  Json(str,JsonRequestBehavior.AllowGet);

        }




    }
}
