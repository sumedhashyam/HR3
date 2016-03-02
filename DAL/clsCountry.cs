using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsCountry
    {
        dbHRSystemEntities db = new dbHRSystemEntities();
        public bool addCountry(CountryOffice c)
        {
            //CountryOffice cntry = new CountryOffice();
            //cntry.CountryOfficeID = Guid.NewGuid();
            //cntry.CountryName = c.CountryName;
            //cntry.LicenseKey = c.LicenseKey;
            db.CountryOffices.Add(c);
            db.SaveChanges();
            return true;
        }


        public List<CountryOffice> getCountryies()
        {
            try
            {
                return db.CountryOffices.OrderBy(a => a.CountryName).ToList();

            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public bool editCountry(CountryOffice c)
        {
            try
            {
                CountryOffice co = db.CountryOffices.Where(a => a.CountryOfficeID == c.CountryOfficeID).FirstOrDefault();
                co.CountryName = c.CountryName;
                co.LicenseKey = c.LicenseKey;
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool delCountry(Guid id)
        {
            try
            {
                CountryOffice co = db.CountryOffices.Where(a => a.CountryOfficeID == id).FirstOrDefault();
                db.CountryOffices.Remove(co);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public string GetCountryById(Guid Id)
        {
            string str= Convert.ToString(db.CountryOffices.Where(a => a.CountryOfficeID == Id).Select(a=>a.CountryName).FirstOrDefault());
            return str;
        }
    }
}
