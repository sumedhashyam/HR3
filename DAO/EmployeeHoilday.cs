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
    
    public partial class EmployeeHoilday
    {
        public System.Guid EmployeeHoildayID { get; set; }
        public Nullable<System.Guid> EmpID { get; set; }
        public Nullable<System.Guid> HolidayID { get; set; }
    
        public virtual Holiday Holiday { get; set; }
        public virtual Employee Employee { get; set; }
    }
}
