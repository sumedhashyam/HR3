using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HR_System.Models;
using DAL;
using DAO;
using System.Web.Security;

namespace HR_System.Models
{
    public class MVCSelectList
    {
        public static List<SelectListItem> getCountryDropdown()
        {
            try
            {
                clsCountry ct = new clsCountry();
                List<CountryOffice> li1 = ct.getCountryies();

                SelectList licountry = new SelectList(li1, "CountryOfficeID", "CountryName");
                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in licountry)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getCountryDropdownlist()
        {
            try
            {
                clsCountry ct = new clsCountry();
                List<CountryOffice> li1 = ct.getCountryies();

                SelectList licountry = new SelectList(li1, "CountryOfficeID", "CountryName");
                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in licountry)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                //li.Insert(0, new SelectListItem() { Text = "Select", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public static List<SelectListItem> getOfficeLocationDropDown()
        {
            try
            {
                clsOfficeLocation obj = new clsOfficeLocation();
                List<EmployeeLocation> liOfficeLocations = obj.getOfficesLocations();
                SelectList _liOfficeLocations = new SelectList(liOfficeLocations, "LocationID", "LocationName");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liOfficeLocations)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select Office Location", Value = "" });
                // end of select list
                return li;

            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getOfficeLocationDropDownByCountryID(Guid currentCountryID)
        {
            try
            {
                clsOfficeLocation obj = new clsOfficeLocation();
                List<EmployeeLocation> liOfficeLocations = obj.getOfficesLocations().Where(A => A.CountryID == currentCountryID).ToList();
                SelectList _liOfficeLocations = new SelectList(liOfficeLocations, "LocationID", "LocationName");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liOfficeLocations)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select", Value = "" });
                // end of select list
                return li;

            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getCityDropDown()
        {
            try
            {
                clsCity obj = new clsCity();
                List<City> liCity = obj.getCities();
                SelectList _liCity = new SelectList(liCity, "CityID", "City1");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liCity)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select City", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getCityDropDownByCountry(Guid countryID)
        {
            try
            {
                clsCity obj = new clsCity();
                List<City> liCity = obj.getCities().Where(A => A.CountryOfficeID == countryID).ToList();
                SelectList _liCity = new SelectList(liCity, "CityID", "City1");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liCity)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select City", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getAllDepartments()
        {
            try
            {
                clsDepartment obj = new clsDepartment();
                List<Department> liDepartment = obj.getDepartment().OrderBy(A => A.DepartmentID).ToList();
                SelectList _liDepartment = new SelectList(liDepartment, "DepartmentID", "DepartmentNameEn");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liDepartment)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select Department", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getAllJobTypes()
        {
            try
            {
                clsJobType obj = new clsJobType();
                List<JobType> liJobType = obj.getJobType().OrderBy(A => A.JobTypeName).ToList();
                SelectList _liJobType = new SelectList(liJobType, "JobTypeID", "JobTypeName");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liJobType)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select Job Type", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getEmployeeStatus()
        {
            List<SelectListItem> li = new List<SelectListItem>();
            li.Add(new SelectListItem() { Text = "Select", Value = "" });

            li.Add(new SelectListItem() { Text = "Inactive", Value = "false" });
            li.Add(new SelectListItem() { Text = "Active", Value = "true" });
            return li;
        }
        public static List<SelectListItem> getMaritalStatus()
        {
            List<SelectListItem> li = new List<SelectListItem>();
            li.Add(new SelectListItem() { Text = "Select", Value = "" });

            li.Add(new SelectListItem() { Text = "Married", Value = "true" });
            li.Add(new SelectListItem() { Text = "Unmarried", Value = "false" });
            return li;
        }
        public static List<SelectListItem> getGender()
        {
            List<SelectListItem> li = new List<SelectListItem>();
            li.Add(new SelectListItem() { Text = "Select", Value = "" });

            li.Add(new SelectListItem() { Text = "Male", Value = "Male" });
            li.Add(new SelectListItem() { Text = "Female", Value = "Female" });
            return li;
        }
        public static List<SelectListItem> getAllEmployee()
        {
            try
            {
                clsEmployee obj = new clsEmployee();
                List<Employee> liEmployee = obj.getEmployees().OrderBy(A => A.FirstNameEn).ToList();
                SelectList _liEmployee = new SelectList(liEmployee, "EmployeeID", "FirstNameEn");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liEmployee)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getAllEmployee(Guid currentCountryID)
        {
            try
            {
                clsEmployee obj = new clsEmployee();

                List<Employee> liEmployee = obj.getEmployees().Where(A => A.CountryID == currentCountryID && A.UserID != null).OrderBy(A => A.FirstNameEn).ToList();
                //SelectList _liEmployee = new SelectList(liEmployee, "EmployeeID", "FirstNameEn");
                List<aspnet_Users> liaspEmployee = obj.getaspEmployees().ToList();
                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                string employeeID = "";
                string employeeName = "";
                foreach (Employee item in liEmployee)
                {
                    foreach (aspnet_Users aspitem in liaspEmployee)
                    {
                        if (aspitem.UserId == item.UserID)
                        {
                            employeeID = item.EmployeeID.ToString();
                            employeeName = string.Format("{0} {1} {2} {3} {4}", item.FirstNameEn, item.SecondNameEn, item.ThirdNameEn, item.LastNameEn, " (" + aspitem.UserName + ")");

                            li.Add(new SelectListItem()
                            {
                                Text = employeeName,
                                Value = employeeID
                            });
                        }
                    }
                    //employeeID = item.EmployeeID.ToString();
                    //employeeName = string.Format("{0} {1} {2} {3}", item.FirstNameEn, item.SecondNameEn, item.ThirdNameEn, item.LastNameEn);

                    //li.Add(new SelectListItem()
                    //{
                    //    Text = employeeName,
                    //    Value = employeeID
                    //});
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static List<SelectListItem> getAllEmployeeExcludeGiven(Guid employeeID, Guid currentCountryID)
        {
            try
            {
                clsEmployee obj = new clsEmployee();
                List<Employee> liEmployee = obj.getEmployees().Where(a => a.CountryID == currentCountryID).OrderBy(A => A.FirstNameEn).ToList();
                Employee EMP = liEmployee.Where(A => A.EmployeeID == employeeID).FirstOrDefault();
                if (EMP != null)
                {
                    liEmployee.Remove(EMP);
                }
                SelectList _liEmployee = new SelectList(liEmployee, "EmployeeID", "FirstNameEn");
                List<aspnet_Users> liaspEmployee = obj.getaspEmployees().ToList();

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();

                string EmpID = "";
                string EmpName = "";
                foreach (Employee item in liEmployee)
                {
                    foreach (aspnet_Users aspitem in liaspEmployee)
                    {
                        if (aspitem.UserId == item.UserID)
                        {
                            EmpID = item.EmployeeID.ToString();
                           // EmpName = string.Format("{0} {1} {2} {3} {4}", item.FirstNameEn, item.SecondNameEn, item.ThirdNameEn, item.LastNameEn, " (" + aspitem.UserName + ")");
                            EmpName = string.Format("{0} {1} {2} {3}", item.FirstNameEn, item.SecondNameEn, item.ThirdNameEn, item.LastNameEn);
                            li.Add(new SelectListItem()
                            {
                                Text = EmpName,
                                Value = EmpID
                            });
                        }
                    }
                }

                //foreach (Employee item in liEmployee)
                //{
                //    li.Add(new SelectListItem()
                //    {

                //        Text = (item.FirstNameEn + item.SecondNameEn.ToString() != "" ? " " + item.SecondNameEn.ToString() : "" + item.ThirdNameEn.ToString() != "" ? " " + item.ThirdNameEn.ToString() : "").ToString() + "" + item.LastNameEn,
                //        Value = item.EmployeeID.ToString()
                //    });
                //}

                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select Supervisor", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public static List<SelectListItem> getAllLeaveType(Guid id)
        {
            try
            {
                clsLeaveType obj = new clsLeaveType();
                List<LeaveType> liJobType = obj.getLeaveType().Where(A => A.LeaveTypeID == id).OrderBy(A => A.LeaveTypeID).ToList();

                SelectList _liJobType = new SelectList(liJobType, "LeaveTypeID", "LeaveTypeName");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liJobType)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select Leave Type", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public static List<SelectListItem> getAllLeaveType()
        {
            try
            {
                clsLeaveType obj = new clsLeaveType();
                List<LeaveType> liJobType = obj.getLeaveType().ToList();

                SelectList _liJobType = new SelectList(liJobType, "LeaveTypeID", "LeaveTypeName");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liJobType)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select Leave Type", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public static List<SelectListItem> getAllLeaveTypeData(List<LeaveType> lst)
        {
            try
            {
                clsLeaveType obj = new clsLeaveType();
                //List<LeaveType> liJobType = obj.getLeaveType().Where(A => A.LeaveTypeID == id).OrderBy(A => A.LeaveTypeID).ToList();

                SelectList _liJobType = new SelectList(lst, "LeaveTypeID", "LeaveTypeName");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liJobType)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select Leave Type", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public static LeaveType getAllLeaveTypeID(Guid id)
        {
            try
            {
                clsLeaveType obj = new clsLeaveType();
                LeaveType listleave = obj.getLeaveType().Where(A => A.LeaveTypeID == id).FirstOrDefault();

                return listleave;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public static List<SelectListItem> getAllStatus()
        {
            try
            {
                clsEmployeeLeaves obj = new clsEmployeeLeaves();
                List<EmployeeLeaveRequest> liEmpLeave = obj.getAllLeaveRequest();
                SelectList _liJobType = new SelectList(liEmpLeave, "EmployeeLeaveRequestID", "Status");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liJobType)
                {
                    li.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                li = li.OrderBy(a => a.Text).ToList();
                li.Insert(0, new SelectListItem() { Text = "Select status", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public static List<SelectListItem> getDistinctStatus()
        {
            try
            {
                clsEmployeeLeaves obj = new clsEmployeeLeaves();

                List<EmployeeLeaveRequest> liEmpLeave = obj.getAllLeaveRequest();
                SelectList _liJobType = new SelectList(liEmpLeave, "Status", "Status");

                // Newly added
                List<SelectListItem> li = new List<SelectListItem>();
                foreach (SelectListItem item in _liJobType)
                {
                    SelectListItem newli = li.Where(a => a.Text.ToString() == item.Text).FirstOrDefault();
                    if (newli == null)
                    {
                        li.Add(new SelectListItem()
                        {
                            Text = item.Text,
                            Value = item.Value
                        });
                    }
                }
                li.Insert(0, new SelectListItem() { Text = "Select status", Value = "" });
                // end of select list
                return li;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public static List<SelectListItem> getYear(int year)
        {
            try
            {
                List<SelectListItem> li = new List<SelectListItem>();
                List<int> lst = new List<int>();
                for (int i = year; i <= 2045; i++)
                {

                    li.Add(new SelectListItem { Text = i.ToString(), Value = i.ToString() });
                }


                // Newly added
                List<SelectListItem> list = new List<SelectListItem>();
                foreach (SelectListItem item in li)
                {
                    list.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                list = li.OrderBy(a => a.Text).ToList();
                string dt = DateTime.Now.ToString("yyyy"); ;
                //list.Insert(0, new SelectListItem() { Text = year.ToString(), Value = year.ToString() });
                //list.Insert(0, new SelectListItem() { Text = "Select Year", Value = "" });
                // end of select list
                return list;
            }

            catch (Exception ex)
            {
                return null;
            }
        }

        public static List<SelectListItem> getMonth()
        {
            try
            {

                List<SelectListItem> items = new List<SelectListItem>();
                items.Add(new SelectListItem { Text = "January", Value = "Jan" });
                items.Add(new SelectListItem { Text = "February", Value = "Feb" });
                items.Add(new SelectListItem { Text = "March", Value = "Mar" });
                items.Add(new SelectListItem { Text = "April", Value = "Apr" });
                items.Add(new SelectListItem { Text = "May", Value = "May" });
                items.Add(new SelectListItem { Text = "June", Value = "Jun" });
                items.Add(new SelectListItem { Text = "July", Value = "Jul" });
                items.Add(new SelectListItem { Text = "August", Value = "Aug" });
                items.Add(new SelectListItem { Text = "September", Value = "Sep" });
                items.Add(new SelectListItem { Text = "October", Value = "Oct" });
                items.Add(new SelectListItem { Text = "November", Value = "Nov" });
                items.Add(new SelectListItem { Text = "December", Value = "Dec" });
                // items.Add(new SelectListItem { Text = "Select Month", Value = "", Selected = true });
                string dt = DateTime.Now.ToString("MMM");
                //SelectListItem selectedItem = items.Where(a => a.Value.ToLower() == dt.ToLower()).FirstOrDefault();
                //if (selectedItem != null)
                //{
                //    selectedItem.Selected = true;
                //}
                //  items.Insert(0, new SelectListItem() { Text = "Select Month", Value = "" });
                // items.Insert(0, new SelectListItem() { Text = dt, Value = dt });
                return items;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static List<SelectListItem> getMonthList()
        {
            try
            {

                List<SelectListItem> items = new List<SelectListItem>();
                items.Add(new SelectListItem { Text = "January", Value = "Jan" });
                items.Add(new SelectListItem { Text = "February", Value = "Feb" });
                items.Add(new SelectListItem { Text = "March", Value = "Mar" });
                items.Add(new SelectListItem { Text = "April", Value = "Apr" });
                items.Add(new SelectListItem { Text = "May", Value = "May" });
                items.Add(new SelectListItem { Text = "June", Value = "Jun" });
                items.Add(new SelectListItem { Text = "July", Value = "Jul" });
                items.Add(new SelectListItem { Text = "August", Value = "Aug" });
                items.Add(new SelectListItem { Text = "September", Value = "Sep" });
                items.Add(new SelectListItem { Text = "October", Value = "Oct" });
                items.Add(new SelectListItem { Text = "November", Value = "Nov" });
                items.Add(new SelectListItem { Text = "December", Value = "Dec" });
                // items.Add(new SelectListItem { Text = "Select Month", Value = "", Selected = true });
                string dt = DateTime.Now.ToString("MMM");
                //SelectListItem selectedItem = items.Where(a => a.Value.ToLower() == dt.ToLower()).FirstOrDefault();
                //if (selectedItem != null)
                //{
                //    selectedItem.Selected = true;
                //}
                items.Insert(0, new SelectListItem() { Text = "Select Month", Value = "" });
                // items.Insert(0, new SelectListItem() { Text = dt, Value = dt });
                return items;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static List<SelectListItem> getYearForTimeSheet()
        {
            try
            {
                int year = DateTime.Now.Year;
                List<SelectListItem> li = new List<SelectListItem>();
                List<int> lst = new List<int>();
                for (int i = 2012; i <= 2100; i++)
                {

                    li.Add(new SelectListItem { Text = i.ToString(), Value = i.ToString() });
                }


                // Newly added
                List<SelectListItem> list = new List<SelectListItem>();
                foreach (SelectListItem item in li)
                {
                    list.Add(new SelectListItem()
                    {
                        Text = item.Text,
                        Value = item.Value
                    });
                }
                list = li.OrderBy(a => a.Text).ToList();
                string dt = DateTime.Now.ToString("yyyy"); ;
                //list.Insert(0, new SelectListItem() { Text = year.ToString(), Value = year.ToString() });
                list.Insert(0, new SelectListItem() { Text = "Select Year", Value = "" });
                // end of select list
                return list;
            }

            catch (Exception ex)
            {
                return null;
            }
        }
        //added later on 24/09/2013
        public static List<SelectListItem> getLocationForHoliday(Guid CountryID)
        {
            try
            {

                dbHRSystemEntities db = new dbHRSystemEntities();

                List<EmployeeLocation> liLocHoliday = db.EmployeeLocations.Where(a => a.CountryID == CountryID).ToList();
                SelectList _liLocHoliday = new SelectList(liLocHoliday, "LocationID", "LocationName");
                List<SelectListItem> li = new List<SelectListItem>();

                foreach (SelectListItem item in _liLocHoliday)
                {
                    li.Add(new SelectListItem() { Value = item.Value, Text = item.Text });
                }

                li.OrderBy(a => a.Text).ToString();
                li.Insert(0, new SelectListItem() { Text = "Select", Value = "" });
                return li;

            }
            catch (Exception ee)
            {
                throw ee;
            }


        }

    }
}







