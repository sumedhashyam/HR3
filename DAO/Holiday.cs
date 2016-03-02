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
    
    public partial class Holiday
    {
        public Holiday()
        {
            this.EmployeeHoildays = new HashSet<EmployeeHoilday>();
        }
    
        public System.Guid HolidayID { get; set; }
        public string HolidayName { get; set; }
        public System.DateTime HolidayDate { get; set; }
        public Nullable<System.Guid> CountryID { get; set; }
        public Nullable<System.Guid> LocationID { get; set; }
        public Nullable<bool> ApplyToStaff { get; set; }
        public Nullable<bool> IsCountInLeave { get; set; }
    
        public virtual CountryOffice CountryOffice { get; set; }
        public virtual EmployeeLocation EmployeeLocation { get; set; }
        public virtual ICollection<EmployeeHoilday> EmployeeHoildays { get; set; }
    }
}