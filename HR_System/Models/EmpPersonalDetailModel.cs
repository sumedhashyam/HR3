using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;


namespace HR_System.Models
{
    public class EmpPersonalDetailModel
    {
        public Guid EmployeeID { get; set; }
        public Guid? UserID { get; set; }
        //[Required(ErrorMessage = "First Name Required")]
        public string FirstNameAr { get; set; }

        [Required(ErrorMessage = "Please Enter Email-Id")]
        [RegularExpression(@"^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$", ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
        
        [Required(ErrorMessage = "Please Enter Password")]
        [StringLength(255, ErrorMessage = "Must be between 5 and 255 characters", MinimumLength = 5)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirm Password is required")]
        [StringLength(255, ErrorMessage = "Must be between 5 and 255 characters", MinimumLength = 5)]
        [DataType(DataType.Password)]
        [System.Web.Mvc.CompareAttribute("Password",ErrorMessage="Password Not Matched")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Name Required")]
        public string FirstNameEn { get; set; }
        public string UserName { get; set; }
        public string SecondNameAr { get; set; }
        public string SecondNameEn { get; set; }

        public string ThirdNameAr { get; set; }
        public string ThirdNameEn { get; set; }

        //[Required(ErrorMessage = "Last Name Required")]
        public string LastNameAr { get; set; }

        [Required(ErrorMessage = "Name Required")]
        public string LastNameEn { get; set; }
        [Required(ErrorMessage = "Please Enter Date of Birth")]
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        [Required(ErrorMessage = "Please select Country")]
        public Guid country { get; set; }
        [Required(ErrorMessage = "Marital status Required")]
        public bool? MaritalStatus { get; set; }
        [Required(ErrorMessage = "Gender Required")]
        public string Gender { get; set; }

         
       
    }
}