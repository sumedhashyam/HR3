using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
   public class clsOfficeLocation
    {

        dbHRSystemEntities db = new dbHRSystemEntities();


        /// <summary>
        /// Returs a list of city
        /// </summary>
        /// <returns></returns>
        public List<EmployeeLocation> getOfficeLocationById(Guid id)
        {
            try
            {
                return db.EmployeeLocations.Where(a => a.LocationID == id).OrderBy(a => a.CityID).ToList();

            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public EmployeeLocation OfficeLocationById(Guid id)
        {
            try
            {
                return db.EmployeeLocations.Where(a => a.LocationID == id).FirstOrDefault();

            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public List<EmployeeLocation> getofficeLocationByCountryId(Guid Id)
        {
            try
            {
                return db.EmployeeLocations.Where(a => a.CountryID == Id).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool addOfficeLocation(EmployeeLocation objempLoaction)
        {
            try
            {



                db.EmployeeLocations.Add(objempLoaction);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool updateOfficeLocation(EmployeeLocation objupdate)
        {
            try
            {
                EmployeeLocation em = db.EmployeeLocations.Where(c1 => c1.LocationID == objupdate.LocationID).FirstOrDefault();
                em.LocationName = objupdate.LocationName;
                em.CityID = objupdate.CityID;
                em.CountryID = objupdate.CountryID;
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public bool delOfficeLocation(Guid id)
        {
            EmployeeLocation emplocation = db.EmployeeLocations.Where(c => c.LocationID == id).FirstOrDefault();
            db.EmployeeLocations.Remove(emplocation);
            db.SaveChanges();
            return true;
        }

        /// <summary>
        /// returns a list of office locations
        /// </summary>
        /// <returns></returns>
        public List<EmployeeLocation> getOfficesLocations()
        {
            try
            {
                return db.EmployeeLocations.ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public string GetLocationNameByEmployeeID(Guid LocationID)
        {
            EmployeeLocation emplocation =  db.EmployeeLocations.Where(a => a.LocationID == LocationID).FirstOrDefault();
            if (emplocation != null)
            {
                return emplocation.LocationName;
            }
            else
            {
                return  "";
            }
        }
    }
}
