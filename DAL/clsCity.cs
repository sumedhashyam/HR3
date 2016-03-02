using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsCity
    {
        dbHRSystemEntities db = new dbHRSystemEntities();


        /// <summary>
        /// Returs a list of city
        /// </summary>
        /// <returns></returns>
        public List<City> getCities()
        {
            try
            {
                return db.Cities.OrderBy(a => a.City1).ToList();

            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

     

        public List<City> getCities(Guid id)
        {
            try
            {
                return db.Cities.Where(a => a.CityID == id).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public List<City> getCitiesByCountryId(Guid id)
        {
            try
            {
                return db.Cities.Where(a => a.CountryOfficeID == id).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
       

        public List<CountryOffice> getCountry()
        {
            try
            {
                return db.CountryOffices.OrderBy(c => c.CountryName).ToList();
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public bool addCities(Guid id, string name)
        {
            try
            {
                City c = new City();
                c.CityID = Guid.NewGuid();
                c.City1 = name;
                c.CountryOfficeID = id;
                db.Cities.Add(c);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool editCity(City c)
        {
            try
            {
                City ct = db.Cities.Where(c1 => c1.CityID == c.CityID).FirstOrDefault();
                ct.City1 = c.City1;
                ct.CountryOfficeID = c.CountryOfficeID;
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public bool delCity(Guid id)
        {
            City ct = db.Cities.Where(c => c.CityID == id).FirstOrDefault();
            db.Cities.Remove(ct);
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
                return db.EmployeeLocations.OrderBy(l => l.LocationName).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }


    }

}
