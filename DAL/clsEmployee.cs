using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;


namespace DAL
{
    public class clsEmployee
    {
        dbHRSystemEntities db = new dbHRSystemEntities();
        public List<Employee> getEmployees()
        {
            try
            {
                return db.Employees.ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public List<aspnet_Users> getaspEmployees()
        {
            try
            {
                return db.aspnet_Users.Where(x=>db.Employees.Any(m=>m.UserID==x.UserId)).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public bool addEmployee(Employee obj)
        {
            try
            {
                db.Employees.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public Employee getEmployeesbyId(Guid id)
        {
            try
            {
                return db.Employees.Where(a => a.EmployeeID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public Employee getEmployeesbyUserId(Guid id)
        {
            try
            {
                return db.Employees.Where(a => a.UserID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public bool updateEmployedetail(Employee objEdit)
        {
            try
            {
                bool newCountry = false;
                Employee employeeObj = db.Employees.Where(a => a.EmployeeID == objEdit.EmployeeID).FirstOrDefault();
                employeeObj.Email = objEdit.Email;
                employeeObj.FirstNameAr = objEdit.FirstNameAr;
                employeeObj.FirstNameEn = objEdit.FirstNameEn;
                employeeObj.SecondNameAr = objEdit.SecondNameAr;
                employeeObj.SecondNameEn = objEdit.SecondNameEn;
                employeeObj.ThirdNameAr = objEdit.ThirdNameAr;
                employeeObj.ThirdNameEn = objEdit.ThirdNameEn;
                employeeObj.LastNameAr = objEdit.LastNameAr;
                employeeObj.LastNameEn = objEdit.LastNameEn;
                employeeObj.DateOfBirth = objEdit.DateOfBirth;
                employeeObj.MaritalStatus = objEdit.MaritalStatus;
                employeeObj.Gender = objEdit.Gender;
                if (objEdit.CountryID != employeeObj.CountryID)
                {
                    employeeObj.CountryID = objEdit.CountryID;
                    employeeObj.OfficeLocationID = null;
                    newCountry = true;
                }
                db.SaveChanges();
                if (newCountry)
                {
                    List<EmployeeHoilday> li = db.EmployeeHoildays.Where(a => a.EmpID == employeeObj.EmployeeID).ToList();
                    foreach (EmployeeHoilday item in li)
                    {
                        EmployeeHoilday _hoilday = db.EmployeeHoildays.Where(a => a.EmployeeHoildayID == item.EmployeeHoildayID).FirstOrDefault();
                        db.EmployeeHoildays.Remove(_hoilday);
                        db.SaveChanges();
                    }
                    // bulk delete giving error
                    // db.EmployeeHoildays.Delete(a => a.EmpID == employeeObj.EmployeeID);
                }
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }

        }
        //Upadating user id of a employee 
        public bool updateUserAccess(Employee objEdit)
        {
            try
            {
                Employee employeeObj = db.Employees.Where(a => a.EmployeeID == objEdit.EmployeeID).FirstOrDefault();
                employeeObj.UserID = objEdit.UserID;
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }

        }
        public bool updateJobdetail(Employee objEdit)
        {
            try
            {
                bool newLocation = false;
                Employee employeeObj = db.Employees.Where(a => a.EmployeeID == objEdit.EmployeeID).FirstOrDefault();
                employeeObj.HireDate = objEdit.HireDate;
                employeeObj.DepartmentID = objEdit.DepartmentID;
                employeeObj.JobID = objEdit.JobID;
                employeeObj.SupervisorID = objEdit.SupervisorID;
                employeeObj.EmployeeStatus = objEdit.EmployeeStatus;
                employeeObj.AlternativeSupervisorID = objEdit.AlternativeSupervisorID;
                employeeObj.AltFromDate = objEdit.AltFromDate;
                employeeObj.AltEndDate = objEdit.AltEndDate;
                //employeeObj.JobTitle = objEdit.JobTitle;
                //employeeObj.E_ID = objEdit.E_ID;
                //employeeObj.InsuranceNumber = objEdit.InsuranceNumber;
                //employeeObj.SUNSystem = objEdit.SUNSystem;
                if ((employeeObj.OfficeLocationID != objEdit.OfficeLocationID) && objEdit.OfficeLocationID.HasValue)
                {
                    employeeObj.OfficeLocationID = objEdit.OfficeLocationID;
                    newLocation = true;
                }
                db.SaveChanges();
                if (newLocation)
                {
                    updateHolidaysNew(objEdit.EmployeeID, objEdit.OfficeLocationID.Value);
                }
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }

        }

        public bool updateTerminationDetail(Employee objEdit)
        {
            try
            {            
                Employee employeeObj = db.Employees.Where(a => a.EmployeeID == objEdit.EmployeeID).FirstOrDefault();
                
                employeeObj.Termination_Date = objEdit.Termination_Date;
                employeeObj.Termination_Reason = objEdit.Termination_Reason;
                employeeObj.Comments = objEdit.Comments;
                employeeObj.LeaveBalacneAtTermination = objEdit.LeaveBalacneAtTermination;
                employeeObj.IsTerminated = objEdit.IsTerminated;
                db.SaveChanges();                
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }

        }

        public bool deleteEpmloyee(Guid id)
        {


            try
            {
                bool b = false;
                Employee deleteDetail = db.Employees.Where(a => a.EmployeeID == id).FirstOrDefault();

                // Remove Employee Leaves
                List<EmployeeLeaf> emplv = db.EmployeeLeaves.Where(a => a.EmpId == id).ToList();
                foreach (var item in emplv)
                {
                    db.EmployeeLeaves.Remove(item);
                    db.SaveChanges();
                }
                // Remove Employee Leaves Request
                List<EmployeeLeaveRequest> leaveRequestList = db.EmployeeLeaveRequests.Where(a => a.EmployeeID == id).ToList();
                foreach (var item in leaveRequestList)
                {
                    db.EmployeeLeaveRequests.Remove(item);
                    db.SaveChanges();
                }
                // Remove Employee Holidays
                List<EmployeeHoilday> holidaysList = db.EmployeeHoildays.Where(a => a.EmpID == id).ToList();
                foreach (var item in holidaysList)
                {
                    db.EmployeeHoildays.Remove(item);
                    db.SaveChanges();
                }
                // Remove Employee Projects
                List<EmployeeProject> employeeProjects = db.EmployeeProjects.Where(a => a.EmployeeID == id).ToList();
                foreach (var item in employeeProjects)
                {
                    db.EmployeeProjects.Remove(item);
                    db.SaveChanges();
                }
                // Remove Employee TimeSheets
                List<TimeSheetMaster> timeSheetList = db.TimeSheetMasters.Where(a => a.EmpID == id).ToList();
                foreach (var item in timeSheetList)
                {
                    if (item.TimeSheets.Count() > 0)
                    {
                        List<TimeSheet> liTimeSheets = db.TimeSheets.Where(a => a.TimeSheetMasterID == item.TimeSheetMasterID).ToList();
                        foreach (var _item in liTimeSheets)
                        {
                            db.TimeSheets.Remove(_item);
                            db.SaveChanges();
                        }
                    }
                    db.TimeSheetMasters.Remove(item);
                    db.SaveChanges();
                }

                // Remove Employee Weekends
                List<Weekend> employeeWeekends = db.Weekends.Where(a => a.EmployeeID == id).ToList();
                foreach (var item in employeeWeekends)
                {
                    db.Weekends.Remove(item);
                    db.SaveChanges();
                }

                // Remove Employee Logs
                List<LogTable> employeeLogs = db.LogTables.Where(a => a.EmployeeID == id).ToList();
                foreach (var item in employeeLogs)
                {
                    db.LogTables.Remove(item);
                    db.SaveChanges();
                }


                // Finally remove employee
                db.Employees.Remove(deleteDetail);
                db.SaveChanges();
                return true;



            }
            catch (Exception ee)
            {

                return false;
            }

        }
        public bool AssignEmployeeProject(EmployeeProject obj, int i)
        {
            try
            {
                List<EmployeeProject> empPjt = db.EmployeeProjects.Where(a => a.EmployeeID == obj.EmployeeID).ToList();
                if (1 == i)
                {
                    foreach (var item in empPjt)
                    {
                        db.EmployeeProjects.Remove(item);

                        db.SaveChanges();

                    }
                    db.EmployeeProjects.Add(obj);
                    db.SaveChanges();
                    return true;

                }
                db.EmployeeProjects.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        public Employee getEmployeesbyIdForReq(Guid id)
        {
            try
            {
                return db.Employees.Where(a => a.UserID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public Employee getaspEmployeesbyIdForReq(Guid id)
        {
            try
            {
                return db.Employees.Where(a => a.UserID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public Employee getSupervisoORaltSupervisorForEmployee(Guid? id)
        {
            try
            {
                return db.Employees.Where(a => a.EmployeeID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }


        public bool delEmployeeProject(Guid id, Guid empid)
        {


            try
            {
                EmployeeProject co = db.EmployeeProjects.Where(a => (a.ProjectID == id) && (a.EmployeeID == empid)).FirstOrDefault();
                if (co != null)
                {
                    db.EmployeeProjects.Remove(co);
                    db.SaveChanges();
                    return true;
                }
                else
                {

                    return true;
                }
            }


            catch (Exception ee)
            {

                return false;
            }

        }


        /// <summary>
        /// This method assigns new holiday to an employee if his/her office location has been changed.
        /// </summary>
        /// <param name="employeeID"></param>
        /// <param name="locationID"></param>
        /// <returns></returns>
        public bool updateHolidays(Guid employeeID, Guid locationID)
        {
            try
            {
                // List<EmployeeHoilday> holidayList = db.EmployeeHoildays.Where(a => a.EmpID == employeeID).ToList();
                EmployeeHoilday objEmpDel = db.EmployeeHoildays.Where(a => a.EmpID == employeeID).FirstOrDefault();
                db.EmployeeHoildays.Remove(objEmpDel);
                db.SaveChanges();
                List<Holiday> locationsHolidays = db.Holidays.Where(a => a.LocationID == locationID).ToList();
                foreach (Holiday _holiday in locationsHolidays)
                {
                    EmployeeHoilday empHoliday = new EmployeeHoilday();
                    empHoliday.EmployeeHoildayID = Guid.NewGuid();
                    empHoliday.EmpID = employeeID;
                    empHoliday.HolidayID = _holiday.HolidayID;
                    db.EmployeeHoildays.Add(empHoliday);
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        public bool updateHolidaysNew(Guid employeeID, Guid locationID)
        {
            try
            {
                // List<EmployeeHoilday> holidayList = db.EmployeeHoildays.Where(a => a.EmpID == employeeID).ToList();
                //db.EmployeeHoildays.Delete(a => a.EmpID == employeeID);
                EmployeeHoilday objEmpDel = db.EmployeeHoildays.Where(a => a.EmpID == employeeID).FirstOrDefault();
                db.EmployeeHoildays.Remove(objEmpDel);
                db.SaveChanges();
                List<Holiday> locationsHolidays = db.Holidays.Where(a => a.LocationID == locationID).ToList();
                foreach (Holiday _holiday in locationsHolidays)
                {
                    EmployeeHoilday empHoliday = new EmployeeHoilday();
                    empHoliday.EmployeeHoildayID = Guid.NewGuid();
                    empHoliday.EmpID = employeeID;
                    empHoliday.HolidayID = _holiday.HolidayID;
                    db.EmployeeHoildays.Add(empHoliday);
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        
        /// <summary>
        /// Created By : tailor
        /// Date: 19/12/2013
        /// </summary>
        /// <param name="date"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public decimal getTermationBalance(DateTime date, Guid id) 
        {
            /*Client Chat*/
            //Current Annual Leave Balance – [(Last carry forward days/12)*(No of months difference between December and Termination Date)]
            //Current Annual Leave Balance will be 10+24 = 34
            // Last Carry forward /12 = 24/12 = 2 days per onth
            //When HR enters termination date (Say 15 Feb 2014), then the system should Take (31Dec2014 - 15Feb2014) = 10.5 Months
            //So, 10.5 months * 2 = 21 Days should be Subtracted from CURRENT Balance
            // Balance at Termination = 34 - 21 = 13 Days left

            //Previous Annual Leave Balance of 2013: 8 Days
            //HR added carry-forward days for 2014:  24 days   (means 2 days per month. 24/12=2)
            //Employee is Terminated at End of May

            //So: Leave Balance at Termination will be:
            //Current Balance (8+24 = 32)
            //Last Carry forward /12 = 24/12 = 2
            //No of Months difference: 7   (31 December – 31 May)
            //So: Termination Balance = 32 – (2*7)= 18

            decimal balance = 0;
            decimal PreviousAnnualLeaveBalance = 0;
            
            EmployeeLeaf empLeavePrev = db.EmployeeLeaves.Where(a => a.EmpId == id && a.Year == DateTime.Now.Year).FirstOrDefault();
            if (empLeavePrev != null)
            {
                PreviousAnnualLeaveBalance = empLeavePrev.BalanceLeaves.Value; //8
                decimal HRAddedCarryForwardDays = empLeavePrev.IssuedLeaves.Value; // 24
                decimal perMonth = HRAddedCarryForwardDays / 12; //2 per month.
                decimal curruntBalance = PreviousAnnualLeaveBalance + HRAddedCarryForwardDays; //32
                DateTime first = new DateTime(date.Year, 12, 31); // 31 dec 2014
                decimal NoOfMonthsDifference = Convert.ToDecimal(first.Subtract(date).Days / (365.25 / 12));  //(31Dec2014 - 15Feb2014) = 10.5 Months
                balance = curruntBalance - (perMonth * NoOfMonthsDifference);
            }
            return balance;
        }

        public bool DeleteEmployeeHoliday(Guid Id)
        {
            try
            {
                List<EmployeeHoilday> deletedetail = db.EmployeeHoildays.Where(a => a.HolidayID == Id).ToList();
                foreach (var item in deletedetail)
                {
                    db.EmployeeHoildays.Remove(item);
                    db.SaveChanges();
                }
                return true;
               

            }
            catch (Exception ex)
            {
                return false;
            }
        }

        
    }
}
