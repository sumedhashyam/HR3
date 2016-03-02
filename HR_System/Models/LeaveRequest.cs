using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HR_System.Models
{
    public class LeaveRequest
    {
        public Guid EmployeeLeaveRequestID { get; set; }

        public Guid? EmployeeID { get; set; }

        [Required(ErrorMessage = "Please Select Department")]
        public Guid? LeaveTypeID { get; set; }

        [Required(ErrorMessage = "Please give reason for the leave")]
        public string LeaveReason { get; set; }

        [Required(ErrorMessage = "Please Select date")]
        public DateTime LeaveDate { get; set; }


    }
}