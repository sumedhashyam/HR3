using DAL;
using DAO;
using HR_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.ComponentModel.DataAnnotations;

namespace HR_System.Controllers
{

    //[Authorize(Roles = "hr")]
    [Authorize]
    public class SettingsController : Controller
    {
        public class CustomAuthorizeAttribute : AuthorizeAttribute
        {

            public override void OnAuthorization(AuthorizationContext filterContext)
            {
                base.OnAuthorization(filterContext);
               
                if (filterContext.Result is HttpUnauthorizedResult)
                {
                    filterContext.Result = new RedirectResult("~/Account/AccessDenied");
                    return;
                }
            }
        }

        Guid CurrentCountryID = MVCUtility.getCurrentCountryID();

        //
        // GET: /Settings/

        #region Varibles
        dbHRSystemEntities db = new dbHRSystemEntities();
        clsLeaveType lvt = new clsLeaveType();
        clsJobType jt = new clsJobType();
        clsDepartment dept = new clsDepartment();
        clsHoliday hday = new clsHoliday();
        clsOfficeLocation ol = new clsOfficeLocation();
        clsProject pl = new clsProject();
        #endregion

        #region Index
        public ActionResult Index()
        {
            return View();
        }
        #endregion

        #region city Funtions

        [CustomAuthorize(Roles = "superadmin,setup")]
        public ActionResult city()
        {
            //clsCity ct = new clsCity();
            //List<City> li = ct.getCities();


            return View();
        }

        public ActionResult cityPartialView()
        {
            string CId =Request.Cookies["country"].Value;
            Guid CountryID = ConvertStringToGuid(CId);

            clsCity ct = new clsCity();
           // List<City> li = ct.getCities();
            List<City> li=ct.getCitiesByCountryId(CountryID);


            return PartialView(li);
        }

        public ActionResult addCity()
        {
            ViewData["countryList"] = MVCSelectList.getCountryDropdown();



            ViewBag._CountryId = CurrentCountryID;
            //getCountry
            clsCountry objClsCountry = new clsCountry();
            string CountryName = objClsCountry.GetCountryById(CurrentCountryID);
            ViewBag._CountryName = CountryName;
            

            return View();
        }

        [HttpPost]
        public ActionResult addCity(City c)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string name = c.City1;
                    Guid id = (Guid)c.CountryOfficeID;
                    clsCity ct = new clsCity();
                    if (ct.addCities(id, name))
                    {
                        TempData["success"] = "City added successfully";
                        return RedirectToAction("city");
                    }
                    else
                    {
                        TempData["error"] = "You can't add this city";
                        return RedirectToAction("city");
                    }
                }
                else
                {
                    ViewData["countryList"] = MVCSelectList.getCountryDropdown();
                    return View(c);
                }
                // return Redirect("city");
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't add this city";
                return RedirectToAction("city");
            }
        }


        public ActionResult editCity(Guid id)
        {
            try
            {
                dbHRSystemEntities fm = new dbHRSystemEntities();
                var ed = fm.Cities.Find(id);
                
                //getCountry
                clsCountry objClsCountry = new clsCountry();
                string CountryName=  objClsCountry.GetCountryById(CurrentCountryID);
                ViewBag._CountryName = CountryName;

                ViewData["countryList"] = MVCSelectList.getCountryDropdown();
                return View(ed);
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't Modify this city";
                return RedirectToAction("city");
            }
        }

        [HttpPost]
        public ActionResult editCity(City c)
        {
            try
            {
                clsCity ct = new clsCity();

                if (ct.editCity(c))
                {
                    TempData["success"] = "City Modified Successfully";
                    return RedirectToAction("city");
                }
                else
                {
                    TempData["error"] = "You can't modify this city";
                    return RedirectToAction("city");
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't modify this city";
                return RedirectToAction("city");
            }

        }


        public ActionResult delCity(Guid id)
        {
            try
            {



                clsCity ct = new clsCity();
                if (ct.delCity(id))
                {
                    TempData["success"] = "City deleted Successfully";
                    return RedirectToAction("city");

                }
                else
                {
                    TempData["error"] = "You can't delete this city";
                    return RedirectToAction("city");
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't delete this city";
                return RedirectToAction("city");
            }
        }

        #endregion

        #region Country Functions

      
        public ActionResult addCountry()
        {
            return View();
        }

        [HttpPost]
        
        public ActionResult addCountry(CountryOffice c)
        {
            try
            {
                c.CountryOfficeID = Guid.NewGuid();

                if (ModelState.IsValid)
                {
                    clsCountry cntry = new clsCountry();
                    if (cntry.addCountry(c))
                    {
                        TempData["success"] = "Country Added Successfully";
                        return RedirectToAction("Country");
                    }
                    else
                    {
                        TempData["error"] = "You Can't add this Country";
                        return RedirectToAction("addCountry");
                    }
                }
                else
                {
                    TempData["error"] = "Please Enter Country Name ";
                    return RedirectToAction("addCountry");
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error" + "You can't add this country";
                return RedirectToAction("addCountry");
            }
        }

        [CustomAuthorize(Roles = "superadmin")]
        public ActionResult Country()
        {

            return View();
        }


        public ActionResult CountryPartialView()
        {
            clsCountry c = new clsCountry();
            List<CountryOffice> li = c.getCountryies();
            return PartialView(li);
        }

        public ActionResult EditCountry(Guid id)
        {
            var ed = db.CountryOffices.Find(id);
            return View(ed);
        }

        [HttpPost]
        public ActionResult EditCountry(CountryOffice c)
        {
            try
            {

                clsCountry cntry = new clsCountry();
                if (ModelState.IsValid)
                {
                    if (cntry.editCountry(c))
                    {
                        TempData["success"] = "Country Modified successfully";
                        return RedirectToAction("Country");
                    }
                    else
                    {
                        TempData["error"] = "you can't Modify this country";
                        return RedirectToAction("Country");
                    }
                }
                else
                {
                    TempData["error"] = "Please Enter Country Name";
                    return View(c);
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't modify this Country";
                return RedirectToAction("Country");
            }
        }

        public ActionResult delCountry(Guid id)
        {
            try
            {
                var cnt = db.CountryOffices.Where(cn => cn.CountryOfficeID == id).FirstOrDefault();


                clsCountry cntry = new clsCountry();
                if (cntry.delCountry(id))
                {
                    TempData["success"] = "Country Deleted Successfully";
                    return RedirectToAction("Country");
                }
                else
                {
                    TempData["error"] = "You can't delete this Country";
                    return RedirectToAction("Country");
                }

            }
            catch (Exception e)
            {
                TempData["error"] = "Error: You can't delete this Country";
                return RedirectToAction("Country");
            }
        }

        #endregion

        #region OfficeLocation Funtions
         [CustomAuthorize(Roles = "superadmin,setup")]
        public ActionResult OfficeLocation()
        { return View(); }

        public ActionResult OfficeLocationPartialView()
        {
            string CId = Request.Cookies["country"].Value;
            Guid CountryID = ConvertStringToGuid(CId);
           // List<EmployeeLocation> li = ol.getOfficesLocations();
            List<EmployeeLocation> li = ol.getofficeLocationByCountryId(CountryID);

            return PartialView(li);


        }

        public ActionResult addOfficeLocation()
        {
            ViewData["citylist"] = MVCSelectList.getCityDropDown();
            ViewData["countryList"] = MVCSelectList.getCountryDropdown();

           


            ViewBag._CountryId = CurrentCountryID;
            //getCountry
            clsCountry objClsCountry = new clsCountry();
            string CountryName = objClsCountry.GetCountryById(CurrentCountryID);
            ViewBag._CountryName = CountryName;


            return View();
        }
        [HttpPost]
        public ActionResult addOfficeLocation(EmployeeLocation empLocation)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //string name = c.City1;

                    empLocation.LocationID = Guid.NewGuid();
                    if (ol.addOfficeLocation(empLocation))
                    {
                        TempData["success"] = "Office Location added successfully";
                        return RedirectToAction("OfficeLocation");
                    }
                    else
                    {
                        TempData["error"] = "You can't add this Office Location";
                        return RedirectToAction("OfficeLocation");
                    }
                }
                else
                {
                    ViewData["citylist"] = MVCSelectList.getCityDropDown();
                    ViewData["countryList"] = MVCSelectList.getCountryDropdown();
                    return View();
                }
                // return Redirect("city");
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't add this Office Location";
                return RedirectToAction("OfficeLocation");
            }
        }

        public ActionResult editOfficeLocation(Guid id)
        {
            try
            {
                ViewData["citylist"] = MVCSelectList.getCityDropDown();
                ViewData["countryList"] = MVCSelectList.getCountryDropdown();
                dbHRSystemEntities fm = new dbHRSystemEntities();
                var ed = fm.EmployeeLocations.Find(id);

                //getCountry
                clsCountry objClsCountry = new clsCountry();
                string CountryName = objClsCountry.GetCountryById(CurrentCountryID);
                ViewBag._CountryName = CountryName;


                return View(ed);
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't Modify this city";
                return RedirectToAction("editOfficeLocation");
            }
        }

        [HttpPost]
        public ActionResult editOfficeLocation(EmployeeLocation objemploc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (ol.updateOfficeLocation(objemploc))
                    {
                        TempData["success"] = "Office Location Modified Successfully";
                        return RedirectToAction("OfficeLocation");
                    }
                    else
                    {
                        TempData["error"] = "You can't modify this Office Location";
                        return RedirectToAction("OfficeLocation");
                    }
                }
                else
                {
                    ViewData["citylist"] = MVCSelectList.getCityDropDown();
                    ViewData["countryList"] = MVCSelectList.getCountryDropdown();
                    return View(objemploc);
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't modify this Office Location";
                return RedirectToAction("OfficeLocation");
            }

        }


        public ActionResult delOfficeLocation(Guid id)
        {
            try
            {


                if (ol.delOfficeLocation(id))
                {
                    TempData["success"] = "Office Location deleted Successfully";
                    return RedirectToAction("OfficeLocation");

                }
                else
                {
                    TempData["error"] = "You can't delete this city";
                    return RedirectToAction("OfficeLocation");
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't delete this Office Location";
                return RedirectToAction("OfficeLocation");
            }
        }
        #endregion

        #region Leave Type

        [Authorize(Roles = "superadmin,hr")]
        public ActionResult LeaveType()
        {

            return View();
        }

        public ActionResult LeaveTypePartialView()
        {

            List<LeaveType> li = lvt.getLeaveType();
            return PartialView(li);
        }

        public ActionResult addLeaveType()
        {

            return View();
        }

        [HttpPost]
        public ActionResult addLeaveType(LeaveType lt)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    lt.LeaveTypeID = Guid.NewGuid();

                    if (lvt.addLeaveType(lt))
                    {
                        TempData["success"] = "Leave Type added successfully";
                        return RedirectToAction("LeaveType");
                    }
                    else
                    {
                        TempData["error"] = "You can't add this Leave Type";
                        return RedirectToAction("LeaveType");
                    }
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Error: " + e.Message);
            }
            return View(lt);
        }


        public ActionResult editLeaveType(Guid id)
        {

            dbHRSystemEntities fm = new dbHRSystemEntities();
            var ed = fm.LeaveTypes.Find(id);
            return View(ed);

        }

        [HttpPost]
        public ActionResult editLeaveType(LeaveType c)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    if (lvt.updateLeaveTypeDetail(c))
                    {
                        TempData["success"] = "Leave Type Modified Successfully";
                        return RedirectToAction("LeaveType");
                    }
                    else
                    {
                        TempData["error"] = "You can't modify this Leave Type";
                        return RedirectToAction("LeaveType");
                    }
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Error: " + e.Message);
            }
            return View(c);
        }


        public ActionResult delLeaveType(Guid id)
        {
            try
            {


                if (lvt.deleteLeaveType(id))
                {
                    TempData["success"] = "Leave Type deleted Successfully";
                    return RedirectToAction("LeaveType");

                }
                else
                {
                    TempData["error"] = "You can't delete this Leave Type";
                    return RedirectToAction("LeaveType");
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't delete this Leave Type";
                return RedirectToAction("LeaveType");
            }
        }

        #endregion

        #region Job Type

         [CustomAuthorize(Roles = "superadmin,setup")]
        public ActionResult JobType()
        {

            return View();
        }

        public ActionResult JobTypePartialView()
        {

            List<JobType> li = jt.getJobType();
            return PartialView(li);
        }

        public ActionResult addJobType()
        {

            return View();
        }

        [HttpPost]
        public ActionResult addJobType(JobType lt)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    lt.JobTypeID = Guid.NewGuid();

                    if (jt.addJobType(lt))
                    {
                        TempData["success"] = "Job Type added successfully";
                        return RedirectToAction("JobType");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Some error occured");
                    }
                }

            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Error :" + e.Message);

            }
            return View(lt);
        }


        public ActionResult editJobType(Guid id)
        {

            dbHRSystemEntities fm = new dbHRSystemEntities();
            var ed = fm.JobTypes.Find(id);
            return View(ed);

        }

        [HttpPost]
        public ActionResult editJobType(JobType c)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    if (jt.updateJobTypeDetail(c))
                    {
                        TempData["success"] = "Job Type Modified Successfully";
                        return RedirectToAction("JobType");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Some error occured");
                    }
                }

            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Error :" + e.Message);

            }
            return View(c);

        }


        public ActionResult delJobType(Guid id)
        {
            try
            {


                if (jt.deleteJobType(id))
                {
                    TempData["success"] = "Job Type deleted Successfully";
                    return RedirectToAction("JobType");

                }
                else
                {
                    TempData["error"] = "You can't delete this Job Type";
                    return RedirectToAction("JobType");
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't delete this Job Type";
                return RedirectToAction("JobType");
            }
        }

        #endregion

        #region Departments

         [CustomAuthorize(Roles = "superadmin,setup")]
        public ActionResult Department()
        {

            return View();
        }

        public ActionResult DepartmentPartialView()
        {

            List<Department> li = dept.getDepartment();
            return PartialView(li);
        }

        public ActionResult addDepartment()
        {

            return View();
        }

        [HttpPost]
        public ActionResult addDepartment(Department lt, string chkActive)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    lt.DepartmentID = Guid.NewGuid();
                    if (chkActive.ToLower() == "on")
                    {
                        lt.ISActive = true;
                    }
                    else
                    {
                        lt.ISActive = false;
                    }
                    lt.ActiveFromDate = DateTime.Now;
                    if (dept.addDepartment(lt))
                    {
                        TempData["success"] = "Department added successfully";
                        return RedirectToAction("Department");
                    }
                    else
                    {
                        TempData["error"] = "You can't add this Department";
                        return RedirectToAction("Department");
                    }
                }
                else
                {

                    return View(lt);
                }
                // return Redirect("city");
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't add this Job Type";
                return RedirectToAction("JobType");
            }
        }


        public ActionResult editDepartment(Guid id)
        {

            dbHRSystemEntities fm = new dbHRSystemEntities();
            var ed = fm.Departments.Find(id);
            return View(ed);

        }

        [HttpPost]
        public ActionResult editDepartment(Department c, string chkActive)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (chkActive.ToLower() == "on")
                    { c.ISActive = true; }
                    else { c.ISActive = false; }


                    if (dept.updateDepartmentDetail(c))
                    {
                        TempData["success"] = "Department Modified Successfully";
                        return RedirectToAction("Department");
                    }
                    else
                    {
                        TempData["error"] = "You can't modify this Department";
                        return RedirectToAction("Department");
                    }
                }
                else
                {
                    TempData["error"] = "Department Field can't empty.";
                    return View(c);
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't modify this Department";
                return RedirectToAction("editDepartment");
            }

        }


        public ActionResult delDepartment(Guid id)
        {
            try
            {


                if (dept.deleteDepartment(id))
                {
                    TempData["success"] = "Department deleted Successfully";
                    return RedirectToAction("Department");

                }
                else
                {
                    TempData["error"] = "You can't delete this Department";
                    return RedirectToAction("Department");
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't delete this Department";
                return RedirectToAction("Department");
            }
        }

        #endregion

        #region Holiday


        public ActionResult Holiday()
        {

            return View();
        }

        public ActionResult HolidayPartialView(Guid? countryID)
        {
            ViewBag.countryID = countryID.HasValue ? countryID.Value.ToString() : "";
            ViewData["countryList"] = MVCSelectList.getCountryDropdown();
            Guid cid = new Guid();
            if (countryID.HasValue)
            {
                cid = new Guid(countryID.ToString());
                List<Holiday> li = hday.getHolidayByCountryId(cid);
                return PartialView(li);
            }
            else
            {
                List<Holiday> li = new List<Holiday>();
                if (MVCUtility.hasCookie("country"))
                {
                    Guid _countryID = new Guid(MVCUtility.getCookieValue("country"));
                    li = hday.getHoliday().Where(a => a.CountryID == _countryID).ToList();
                }
                return PartialView(li);
            }
        }

        /// <summary>
        /// Called by jquery ajax
        /// </summary>
        /// <param name="countryID"></param>
        /// <returns></returns>
        public ActionResult getOfficeLocations(Guid countryID)
        {
            List<EmployeeLocation> li = db.EmployeeLocations.Where(a => a.CountryID == countryID).ToList();
            var result = (from item in li
                          select new
                          {
                              text = item.LocationName,
                              value = item.LocationID
                          }).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult addHoliday()
        {


            List<SelectListItem> li = MVCSelectList.getCountryDropdown();
            List<SelectListItem> lstLOC = MVCSelectList.getLocationForHoliday(CurrentCountryID);

            ViewBag._countryID = CurrentCountryID;
            if (MVCUtility.IsSuperAdmin())
                ViewData["countryList"] = li;
            ViewData["LocationForHoliday"] = lstLOC;
            return View();
        }

        [HttpPost]
        public ActionResult addHoliday(Holiday objAdd)
        {
            try
            {

                if (string.IsNullOrEmpty(objAdd.LocationID.ToString()))
                {
                    ModelState.AddModelError("LocationID", "Please Select Location");
                }

                if (ModelState.IsValid)
                {
                    objAdd.HolidayID = Guid.NewGuid();
                     hday.addHoliday(objAdd);
                    TempData["success"] = "Holiday Added successfully";
                    return RedirectToAction("Holidays");
                }
            }
            catch (Exception ee)
            {
                ModelState.AddModelError("", "Error:" + ee.Message);
            }
            List<SelectListItem> li = MVCSelectList.getCountryDropdown();
            List<SelectListItem> lstLOC = MVCSelectList.getLocationForHoliday(CurrentCountryID);

            ViewBag._countryID = CurrentCountryID;
            if (MVCUtility.IsSuperAdmin())
                ViewData["countryList"] = li;
            ViewData["LocationForHoliday"] = lstLOC;
            return View(objAdd);
        }



        public ActionResult editHoliday(Guid id)
        {
            List<SelectListItem> li = MVCSelectList.getCountryDropdown();
            List<SelectListItem> lstLOC = MVCSelectList.getLocationForHoliday(CurrentCountryID);


            ViewBag._countryID = CurrentCountryID;
            if (MVCUtility.IsSuperAdmin())
                ViewData["countryList"] = li;

            ViewData["LocationForHoliday"] = lstLOC;


            Holiday obj = hday.getHolidaybyId(id);
            return View(obj);

        }
        [HttpPost]
        public ActionResult editHoliday(Holiday objedit)
        {

            try
            {

                if (ModelState.IsValid)
                {
                    hday.updateHolidayDetail(objedit);
                    TempData["success"] = "Holiday Updated Successfully";
                    return RedirectToAction("Holidays");
                }

            }
            catch (Exception ee)
            {
                ModelState.AddModelError("", "Error:" + ee.Message);
            }
            List<SelectListItem> li = MVCSelectList.getCountryDropdown();
            List<SelectListItem> lstLOC = MVCSelectList.getLocationForHoliday(CurrentCountryID);
            ViewBag._countryID = CurrentCountryID;
            if (MVCUtility.IsSuperAdmin())
                ViewData["countryList"] = li;

            ViewData["LocationForHoliday"] = lstLOC;
            return View(objedit);

        }
        public ActionResult deleteHoliday(Guid id)
        {
            try
            {
                //dbHRSystemEntities db = new dbHRSystemEntities();
                //var del = db.Holidays.Where(a => a.HolidayDate == date).FirstOrDefault();
                //Guid id=new Guid();

                if (hday.deleteHoliday(id))
                {
                    clsEmployee objClsEmployees = new clsEmployee();
                    objClsEmployees.DeleteEmployeeHoliday(id);
                    TempData["success"] = "Holiday deleted Successfully";
                    return RedirectToAction("Holiday");


                }
                else
                {
                    TempData["error"] = "You can't delete this Holiday,May be used in another Source";
                    return RedirectToAction("Holiday");

                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't delete this Holiday,May be used in another Source";
                return RedirectToAction("Holiday");


            }

        }
        #region  actions for calander views

        //public ActionResult addHolidayPV(DateTime date)
        //{
        //    ViewBag._date = date;
        //    return PartialView();
        //}
        //public ActionResult addHolidayPV(Holiday lt, FormCollection fc)
        //{
        //    try
        //    {
        //        if (ModelState.IsValid)
        //        {

        //            lt.HolidayID = Guid.NewGuid();
        //            lt.HolidayDate = Convert.ToDateTime(fc["event_date"].ToString());
        //            if (hday.addHoliday(lt))
        //            {
        //                return Json(new { success = true, msg = "Holiday added successfully" }, JsonRequestBehavior.AllowGet);
        //            }
        //            else
        //            {

        //                return Json(new { success = false, msg = "Holiday already assign to this date" }, JsonRequestBehavior.AllowGet);
        //            }
        //        }
        //        else
        //        {

        //            return Json(new { success = false, msg = "Please correct error first and then submit form." }, JsonRequestBehavior.AllowGet);

        //        }
        //        // return Redirect("city");
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { success = false, msg = "Error: " + e.Message }, JsonRequestBehavior.AllowGet);

        //    }

        //}
        //public ActionResult editHolidayPV(DateTime date)
        //{
        //    ViewBag._date = date;
        //    dbHRSystemEntities fm = new dbHRSystemEntities();
        //    var ed = fm.Holidays.Where(a => a.HolidayDate == date).FirstOrDefault();
        //    return PartialView(ed);

        //}
        //[HttpPost]
        //public ActionResult editHolidayPV(Holiday c, FormCollection fc)
        //{
        //    try
        //    {
        //        Holiday obj = new Holiday();

        //        if (ModelState.IsValid)
        //        {
        //            c.HolidayID = new Guid(fc["id"].ToString());
        //            if (hday.updateHolidayDetail(c))
        //            {
        //                return Json(new { success = true, msg = "Holiday Modified Successfully" }, JsonRequestBehavior.AllowGet);

        //            }
        //            else
        //            {

        //                return Json(new { success = false, msg = "Holiday Not Modified. Error occured." }, JsonRequestBehavior.AllowGet);
        //            }
        //        }
        //        else
        //        {
        //            return Json(new { success = false, msg = "Please correct error first and then submit form." }, JsonRequestBehavior.AllowGet);

        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { success = false, msg = "Error: " + e.Message }, JsonRequestBehavior.AllowGet);
        //    }
        //}

        //public ActionResult delHoliday(Guid id)
        //{
        //    try
        //    {
        //        ////dbHRSystemEntities db = new dbHRSystemEntities();
        //        ////var del = db.Holidays.Where(a => a.HolidayDate == date).FirstOrDefault();
        //        ////Guid id=new Guid();
        //        //if (del != null)
        //        //{
        //        //    id = del.HolidayID;
        //        //}
        //        if (hday.deleteHoliday(id))
        //        {
        //            //TempData["success"] = "Holiday deleted Successfully";
        //            //return RedirectToAction("Holiday");
        //            return Json(new { success = true, msg = "Holiday deleted Successfully" }, JsonRequestBehavior.AllowGet);

        //        }
        //        else
        //        {
        //            //TempData["error"] = "You can't delete this Holiday,May be used in another Source";
        //            //return RedirectToAction("Holiday");
        //            return Json(new { success = false, msg = "You can't delete this Holiday,May be used in another Source" }, JsonRequestBehavior.AllowGet);
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        //TempData["error"] = "Error: " + "You can't delete this Holiday,May be used in another Source";
        //        //return RedirectToAction("Holiday");
        //        return Json(new { success = false, msg = "Error:" + e.Message }, JsonRequestBehavior.AllowGet);

        //    }
        //}

        #endregion

        #endregion

        //#region Weekend
        //public ActionResult weekend()
        //{
        //    try
        //    {
        //        return View();
        //    }
        //    catch (Exception ex)
        //    {
        //        TempData["error"] = "No weekend is available for this employee.";
        //        return View();
        //    }
        //}

        //public ActionResult weekendPV()
        //{
        //    try
        //    {


        //        return PartialView();
        //    }
        //    catch (Exception ex)
        //    {
        //        TempData["error"] = "No weekend is available for this employee.";
        //        return RedirectToAction("weekend");
        //    }
        //}


        //#endregion

        #region HoliDays
        [Authorize(Roles = "superadmin,hr")]
        public ActionResult Holidays()
        { return View(); }
        public ActionResult HolidaysPV()
        { return PartialView(); }

        [HttpPost]
        public ActionResult getHolidays()
        {
            List<Holiday> objHolidays = db.Holidays.OrderByDescending(a => a.HolidayDate).ToList();
            List<AssignHoliday> listAssignHoliday = new List<AssignHoliday>();
            if (objHolidays != null)
            {
                foreach (var item in objHolidays)
                {
                    AssignHoliday obj = new AssignHoliday();

                    obj.title = item.HolidayName;
                    obj.start = item.HolidayDate;
                    obj.end = item.HolidayDate;
                    listAssignHoliday.Add(obj);

                }

            }


            return Json(listAssignHoliday.Select(i => new
            {
                title = i.title,
                start = i.start.ToShortDateString(),
                allDay = true
            }));
        }
        public JsonResult AssignHolidays()
        {
            List<Holiday> objHolidays = db.Holidays.OrderByDescending(a => a.HolidayDate).ToList();
            List<AssignHoliday> listAssignHoliday = new List<AssignHoliday>();
            if (objHolidays != null)
            {
                foreach (var item in objHolidays)
                {
                    AssignHoliday obj = new AssignHoliday();
                    obj.title = item.HolidayName;
                    obj.start = item.HolidayDate;
                    obj.end = item.HolidayDate;
                    listAssignHoliday.Add(obj);

                }

            }
            return Json(listAssignHoliday, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region Drowdowns Json
        public ActionResult getCities(Guid countryid)
        {
            List<SelectListItem> li = MVCSelectList.getCityDropDownByCountry(countryid);
            return Json(li, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region Project

        [Authorize(Roles = "superadmin,hr")]
        public ActionResult Project()
        {

            return View();
        }

        public ActionResult ProjectPV()
        {
            List<Project> li = pl.getProjects();
            //if (!MVCUtility.IsSuperAdmin())
            //{
            //    li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
            //}
            if (MVCUtility.IsSuperAdmin())
            {
                li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
            }
            if (MVCUtility.IsHR())
            {
                li = li.Where(a => a.CountryID == CurrentCountryID).ToList();
            }
            return PartialView(li);
        }

        public ActionResult addProject()
        {
            bool isSuperadmin = MVCUtility.IsSuperAdmin();
            ViewBag.CurrentCountryID = CurrentCountryID;
            ViewBag.isSuperadmin = isSuperadmin;

            ViewData["Country"] = MVCSelectList.getCountryDropdown();
            return View();
        }

        [HttpPost]
        public ActionResult addProject(Project lt)
        {

            try
            {

                if (ModelState.IsValid)
                {

                    lt.ProjectId = Guid.NewGuid();


                    if (pl.addProject(lt))
                    {
                        TempData["success"] = "Project added successfully";
                        return RedirectToAction("Project");
                    }
                    else
                    {
                        TempData["error"] = "You can't add this Project";
                        return RedirectToAction("Project");
                    }
                }
                else
                {
                    bool isSuperadmin = MVCUtility.IsSuperAdmin();
                    ViewBag.CurrentCountryID = CurrentCountryID;
                    ViewBag.isSuperadmin = isSuperadmin;
                    return View(lt);
                }
                // return Redirect("city");
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't add this Job Type";
                return RedirectToAction("Project");
            }
        }


        public ActionResult editProject(Guid id)
        {
            bool isSuperadmin = MVCUtility.IsSuperAdmin();
            ViewBag.CurrentCountryID = CurrentCountryID;
            ViewBag.isSuperadmin = isSuperadmin;

            dbHRSystemEntities fm = new dbHRSystemEntities();
            ViewData["Country"] = MVCSelectList.getCountryDropdown();
            var ed = fm.Projects.Find(id);
            return View(ed);

        }

        [HttpPost]
        public ActionResult editProject(Project p)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    if (pl.updateProjectDetail(p))
                    {
                        TempData["success"] = "Project Modified Successfully";
                        return RedirectToAction("Project");
                    }
                    else
                    {
                        TempData["error"] = "You can't modify this Project";
                        return RedirectToAction("Project");
                    }
                }
                else
                {
                    TempData["error"] = "Project Field can't empty.";

                    bool isSuperadmin = MVCUtility.IsSuperAdmin();
                    ViewBag.CurrentCountryID = CurrentCountryID;
                    ViewBag.isSuperadmin = isSuperadmin;

                    return View(p);
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't modify this Project";
                return RedirectToAction("Project");
            }

        }




        //public ActionResult MyProjectsCurrentUser()
        //{

        //    try
        //    {

        //        return View();
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }


        //}

        //public ActionResult MyProjectsCurrentUserRep(string empID)
        //{
        //    var GuidID = new Guid(empID);

        //    EmpProjDetailsList ObjempProjList = new EmpProjDetailsList();
        //    List<EmpProjDetails> empProjList = ObjempProjList.getEmpProjDetailsList(GuidID);




        //    return PartialView(empProjList);
        //}




        public ActionResult delProject(Guid id)
        {
            try
            {


                if (pl.deleteProject(id))
                {
                    TempData["success"] = "Project deleted Successfully";
                    return RedirectToAction("Project");

                }
                else
                {
                    TempData["error"] = "You can't delete this Project";
                    return RedirectToAction("Project");
                }
            }
            catch (Exception e)
            {
                TempData["error"] = "Error: " + "You can't delete this Project";
                return RedirectToAction("Project");
            }
        }

        #endregion

        public Guid ConvertStringToGuid(string Id)
        {
            Guid ID = !String.IsNullOrEmpty(Id) ? new Guid(Id) : new Guid();
            return ID;
        }

       
    }
}
