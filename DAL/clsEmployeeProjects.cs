using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
   public class clsEmployeeProjects
    {
        dbHRSystemEntities db = new dbHRSystemEntities();
        
       public List<EmployeeProject> getEmployeesProjects(Guid employeeID)
        {
            try
            {
                return db.EmployeeProjects.Where(a => a.EmployeeID == employeeID).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
       public List<EmployeeProject> getEmployeesProjects(Guid employeeID,int year)
       {
           try
           {
               List<EmployeeProject> li = db.EmployeeProjects.Where(a => a.EmployeeID == employeeID && a.FromDate.Value.Year == year).ToList();
               return li;
           }
           catch (Exception ee)
           {
               throw ee;
           }
       }

       public bool deleteAllProjectsOfAnEmployee(Guid employeeID)
       {
           try
           {
               List<EmployeeProject> li = db.EmployeeProjects.Where(a => a.EmployeeID == employeeID).ToList();
               foreach (EmployeeProject item in li)
               {
                   db.EmployeeProjects.Remove(item);
                   db.SaveChanges();
               }
               return true;
           }
           catch (Exception ee)
           {
               return false;
           }
       }
    }
}
