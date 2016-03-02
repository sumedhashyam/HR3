using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HR_System.Models;
using DAO;

namespace HR_System.Models
{
    public class EmpProjDetails
    {
        public Guid EmployeeID { get; set; }
        public Guid? ProjectID { get; set; }
        public string FirstNameEn { get; set; }
        public string LastNameEn { get; set; }
        public string ProjectName { get; set; }

        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public string CountryName { get; set; }             
        public Boolean IsProjActive { get; set; }
    }

    public class EmpProjDetailsList
    {
        dbHRSystemEntities db = new dbHRSystemEntities();

        public List<EmpProjDetails> getEmpProjDetailsList(Guid id )
        {
            List<EmpProjDetails> EmpProjDetailsTbl=(from e in db.Employees 
                                                    
                                                    join ep in db.EmployeeProjects 
                                                    
                                                    on e.EmployeeID equals ep.EmployeeID 
                                                    
                                                    join p in db.Projects 
                                                    
                                                    on ep.ProjectID equals p.ProjectId
                                                    where e.EmployeeID == id

                                                    select new EmpProjDetails 
                                                    {
                                                        EmployeeID=e.EmployeeID,
                                                        ProjectID=p.ProjectId, 
                                                        FirstNameEn=e.FirstNameEn,
                                                        ProjectName=p.ProjectName,
                                                        LastNameEn=e.LastNameEn,
                                                        FromDate=(DateTime)ep.FromDate,
                                                        ToDate=(DateTime) ep.ToDate,IsProjActive=(Boolean) ep.IsActive }) .ToList();
            return EmpProjDetailsTbl;                                                      
        }

       

//SELECT        EmployeeProjects.EmpProjectsID, EmployeeProjects.EmployeeID, Project.ProjectName AS Expr4, EmployeeProjects.FromDate, EmployeeProjects.ToDate, 
//                         Employee.FirstNameEn, Employee.SecondNameEn, EmployeeProjects.IsActive
//FROM            EmployeeProjects INNER JOIN
//                         Employee ON EmployeeProjects.EmployeeID = Employee.EmployeeID INNER JOIN
//                         Project ON EmployeeProjects.ProjectID = Project.ProjectId



    }
}