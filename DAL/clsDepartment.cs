using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsDepartment
    {
        dbHRSystemEntities db = new dbHRSystemEntities();
        public List<Department> getDepartment()
        {
            try
            {
                return db.Departments.ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public bool addDepartment(Department obj)
        {
            try
            {
                db.Departments.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        /// <summary>
        /// Edit employee
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Department getDepartmentbyId(Guid id)
        {
            try
            {
                return db.Departments.Where(a => a.DepartmentID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public bool updateDepartmentDetail(Department objEdit)
        {
            try
            {
                Department DepartmentObj = db.Departments.Where(a => a.DepartmentID == objEdit.DepartmentID).FirstOrDefault();
                DepartmentObj.DepartmentCode = objEdit.DepartmentCode;
                DepartmentObj.DepartmentNameAr = objEdit.DepartmentNameAr;
                DepartmentObj.DepartmentNameEn = objEdit.DepartmentNameEn;
                DepartmentObj.ISActive = objEdit.ISActive;
                DepartmentObj.ActiveFromDate = objEdit.ActiveFromDate;
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }

        }
        public bool deleteDepartment(Guid id)
        {


            try
            {
                Department deleteDetail = db.Departments.Where(a => a.DepartmentID == id).FirstOrDefault();

                db.Departments.Remove(deleteDetail);

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
