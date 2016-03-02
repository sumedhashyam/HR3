using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using DAO;
namespace HR_System.Models
{
    public class JobInformationModel
    {
        public Guid EmployeeID { get; set; }

        public Nullable<System.Guid> UserID { get; set; }
          [Required(ErrorMessage = "Please Select Department")]
        public Guid? DepartmentID { get; set; }

          [Required(ErrorMessage = "Please Select Status")]
        public bool? EmployeeStatus { get; set; }

          [Required(ErrorMessage = "Please Enter Hire Date")]
        public DateTime? HireDate { get; set; }

          [Required(ErrorMessage = "Please Select Job Type")]
        public Guid? JobID { get; set; }

          [Required(ErrorMessage = "Please Select Office Location")]
        public Guid? OfficeLocationID { get; set; }

          //public string JobTitle { get; set; }
          //public string E_ID { get; set; }

          //public string InsuranceNumber { get; set; }

          //public string SUNSystem { get; set; }
       
        public Guid? SupervisorID { get; set; }
        public Nullable<System.Guid> AlternativeSupervisorID { get; set; }
        public Nullable<System.DateTime> AltFromDate { get; set; }
        public Nullable<System.DateTime> AltEndDate { get; set; }


    }
}