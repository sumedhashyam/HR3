using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace DAO
{
    class Validations
    {
    }
    #region Validation For: LeaveType

    [MetadataType(typeof(LeaveTypeMetaData))]
    public partial class LeaveType
    {

    }

    public class LeaveTypeMetaData
    {

        public System.Guid LeaveTypeID { get; set; }
        [Required(ErrorMessage = "Leave Type Required")]
        public string LeaveTypeName { get; set; }
        [Required(ErrorMessage = "Leave Color Required")]
        public string LeaveTypeColor { get; set; }
        [Required(ErrorMessage = "Leave Code Required")]
        public string LeaveTypeCode { get; set; }
        [Required(ErrorMessage = "Default Leaves Required")]
        public Nullable<int> DefaultLeaves { get; set; }
        public Nullable<bool> WillHolidaysCount { get; set; }

    }
    #endregion

    #region Validation For: City
    [MetadataType(typeof(CityMetadata))]
    public partial class City
    {

    }
    public class CityMetadata
    {

        public Guid CityID { get; set; }
        [Required(ErrorMessage = "Please Enter a City")]
        public string City1 { get; set; }
        [Required(ErrorMessage = "Please Select a Country.")]
        public Nullable<System.Guid> CountryOfficeID { get; set; }

    }
    #endregion

    #region Validation For: Holiday
    [MetadataType(typeof(HolidayMetadata))]
    public partial class Holiday
    {

    }

    public partial class HolidayMetadata
    {
        public System.Guid HolidayID { get; set; }
        [Required(ErrorMessage = "Holiday Name Required")]
        public string HolidayName { get; set; }
        [Required(ErrorMessage = "Holiday Date Required")]
        public System.DateTime HolidayDate { get; set; }
        [Required(ErrorMessage = "Location Required")]
        public Nullable<System.Guid> LocationID { get; set; }
        [Required(ErrorMessage = "Country Required")]
        public Nullable<System.Guid> CountryID { get; set; }
        public Nullable<bool> IsCountInLeave { get; set; }

    }
    #endregion

    #region Validation For: CountryOffice
    [MetadataType(typeof(CountryOfficeMetadata))]
    public partial class CountryOffice
    {

    }
    public class CountryOfficeMetadata
    {
        public System.Guid CountryOfficeID { get; set; }
        [Required(ErrorMessage = "Please Enter Country Name")]
        public string CountryName { get; set; }

        public string LicenseKey { get; set; }
    }
    #endregion

    #region Employee Loaction
    [MetadataType(typeof(EmployeeLocationMetadata))]
    public partial class EmployeeLocation
    {

    }
    public class EmployeeLocationMetadata
    {



        public string City { get; set; }
        [Required(ErrorMessage = "Please Select a City")]
        public Guid? CityID { get; set; }
        public string Country { get; set; }
        [Required(ErrorMessage = "Please Select a Country")]
        public Guid? CountryID { get; set; }

        public Guid LocationID { get; set; }
        [Required(ErrorMessage = "Please Select a Location Name")]
        public string LocationName { get; set; }

    }
    #endregion

    #region Validation For: EmployeeLeaveRequest
    [MetadataType(typeof(EmployeeLeaveRequestMetadata))]
    public partial class EmployeeLeaveRequest
    {

    }
    public class EmployeeLeaveRequestMetadata
    {

        public System.Guid EmployeeLeaveRequestID { get; set; }
        public Nullable<System.Guid> EmployeeID { get; set; }
        [Required(ErrorMessage = "Please Select a Leave Type")]

        public Nullable<System.Guid> LeaveTypeID { get; set; }

        [Required(ErrorMessage = "Please enter leave reason")]
        public string LeaveReason { get; set; }
        [Required(ErrorMessage = "Please select from date.")]
        public Nullable<System.DateTime> FromDate { get; set; }
        public string Status { get; set; }
        [Required(ErrorMessage = "Please select to date.")]
        public Nullable<System.DateTime> ToDate { get; set; }
        public Nullable<int> ActualDate { get; set; }
        public Nullable<int> AssignedDate { get; set; }
        public string LeaveDetectionReason { get; set; }
        public Nullable<System.Guid> LeaveBetweenThisAndNextYearID { get; set; }
    }
    #endregion

    #region Validation For: TimeSheetMaster
    [MetadataType(typeof(TimeSheetMasterMetadata))]
    public partial class TimeSheetMaster
    {

    }
    public partial class TimeSheetMasterMetadata
    {
        public System.Guid TimeSheetMasterID { get; set; }
        public Nullable<System.Guid> EmpID { get; set; }
        [Required(ErrorMessage = "Please Select a Month")]
        public string Month { get; set; }
        [Required(ErrorMessage = "Year")]
        public string Year { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<bool> IsSubmit { get; set; }

        public virtual Employee Employee { get; set; }


        [MetadataType(typeof(JobTypeMetadata))]
        public partial class JobType
        {
        }
        public class JobTypeMetadata
        {
            public System.Guid JobTypeID { get; set; }
            [Required(ErrorMessage = "Please Select a Job Type")]
            public string JobTypeName { get; set; }
            public string JobTypeNameAr { get; set; }
            [Required(ErrorMessage = "Please Select a JobCode")]
            public string JobCode { get; set; }
            public Nullable<bool> IsActive { get; set; }
        }
    }
    #endregion

    public class PostponedLeave
    {
        public Guid? EmployeeLeaveID { get; set; }
        public Guid? LeaveTypeID { get; set; }
        public Guid? EmpId { get; set; }
        public decimal? PostponedLeaveValue { get; set; }
        public decimal? PreviousLeaveValue { get; set; }
    }

}
