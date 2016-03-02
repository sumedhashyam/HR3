using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
namespace DAL
{
  public class clsProject
    {

        dbHRSystemEntities db = new dbHRSystemEntities();
        public List<Project> getProjects()
        {
            try
            {
                return db.Projects.ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public bool addProject(Project obj)
        {
            try
            {
                db.Projects.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        public Project getProjectbyId(Guid id)
        {
            try
            {
                return db.Projects.Where(a => a.ProjectId == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public bool updateProjectDetail(Project objEdit)
        {
            try
            {
                Project Projectobj = db.Projects.Where(a => a.ProjectId == objEdit.ProjectId).FirstOrDefault();
                Projectobj.ProjectName = objEdit.ProjectName;
                Projectobj.CountryID = objEdit.CountryID;
                Projectobj.ProjectNumber = objEdit.ProjectNumber;
                Projectobj.ProjectNameAr = objEdit.ProjectNameAr;
                Projectobj.FromDate = objEdit.FromDate;
                Projectobj.EndDate = objEdit.EndDate;
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }

        }
        public bool deleteProject(Guid id)
        {


            try
            {
                Project deleteDetail = db.Projects.Where(a => a.ProjectId == id).FirstOrDefault();

                db.Projects.Remove(deleteDetail);

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
