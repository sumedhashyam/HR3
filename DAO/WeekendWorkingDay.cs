//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAO
{
    using System;
    using System.Collections.Generic;
    
    public partial class WeekendWorkingDay
    {
        public System.Guid WeekendWorkingDayID { get; set; }
        public Nullable<System.Guid> EmployeeID { get; set; }
        public Nullable<System.DateTime> WeekendDate { get; set; }
        public bool IsWorkingDay { get; set; }
        public Nullable<System.Guid> SupervisorID { get; set; }
    }
}
