using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
namespace DAL
{
    public class clsEmployeeLeaves
    {
        dbHRSystemEntities db = new dbHRSystemEntities();
        public List<EmployeeLeaf> getEmployeesbyId(Guid? id)
        {
            try
            {
                return db.EmployeeLeaves.Where(a => a.EmpId == id).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public bool DeleteEmployeeLeaveRequest(Guid id)
        {
            try
            {

                EmployeeLeaveRequest ObjleaveRequest = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == id).FirstOrDefault();
                Guid empid = (Guid)ObjleaveRequest.EmployeeID;
                
                LogTable employeeLogs=new LogTable();
                employeeLogs.EmployeeID=empid;
                employeeLogs.LogID=Guid.NewGuid();
                employeeLogs.RecordDate= DateTime.Now ;
                employeeLogs.Operation = "Delete";
                employeeLogs.Notes="Leave Request was deleted";
                db.LogTables.Add(employeeLogs);
                db.SaveChanges();


                db.EmployeeLeaveRequests.Remove(ObjleaveRequest);
                db.SaveChanges();
               
                return true;

            }
                catch(Exception e)
            {
                return false;
            }
            
        }

        public bool addEmployeeLeaveRquest(EmployeeLeaveRequest Emp_LeaveReq)
        {
            try
            {

                Emp_LeaveReq.Status = "pending";

                db.EmployeeLeaveRequests.Add(Emp_LeaveReq);
                db.SaveChanges();
                return true;
            }
            //catch (DbEntityValidationException e)
            //{
            //    foreach (var eve in e.EntityValidationErrors)
            //    {

            //        foreach (var ve in eve.ValidationErrors)
            //        {
            //            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
            //                ve.PropertyName, ve.ErrorMessage);
            //        }
            //    }
            //    throw;
            //}
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool updateEmployeeLeaveRquest(EmployeeLeaveRequest Emp_LeaveReq)
        {
            try
            {

                EmployeeLeaveRequest emp = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == Emp_LeaveReq.EmployeeLeaveRequestID).FirstOrDefault();
                if (emp != null)
                {
                    emp.FromDate = Emp_LeaveReq.FromDate;
                    emp.ToDate = Emp_LeaveReq.ToDate;
                    emp.Status = "approved";
                    emp.HalfDay = Emp_LeaveReq.HalfDay;
                    emp.LeaveReason = Emp_LeaveReq.LeaveReason;
                    emp.LeaveTypeID = Emp_LeaveReq.LeaveTypeID;
                    emp.ActualDate = Emp_LeaveReq.ActualDate;
                    emp.AssignedDate = Emp_LeaveReq.AssignedDate;
                    db.SaveChanges();
                }

                return true;
            }

            catch (Exception ex)
            {
                return false;
            }
        }

        public EmployeeLeaf getEmployeeLeveByLeaveID(Guid? id, Guid? leave_id, int year)
        {
            try
            {
                return db.EmployeeLeaves.Where(a => a.EmpId == id && a.LeaveTypeID == leave_id && a.Year == year).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public List<EmployeeLeaveRequest> getAllLeaveRequestByEmployeeId(Guid? emp_id, string status)
        {
            try
            {
                return db.EmployeeLeaveRequests.Where(a => a.EmployeeID == emp_id && a.Status.ToLower() == status.ToLower()).OrderBy(a => a.CreateDate).ToList();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<EmployeeLeaveRequest> getAllLeaveRequest()
        {
            try
            {
                return db.EmployeeLeaveRequests.OrderBy(a => a.CreateDate).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public EmployeeLeaveRequest getDetailForEmployeeLeave(Guid? req_ID)
        {
            try
            {
                EmployeeLeaveRequest empLeaveRequest = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == req_ID).FirstOrDefault();
                return empLeaveRequest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool releaveAssign(Guid? req_id, string result)
        {
            try
            {
                EmployeeLeaveRequest empLeaveRequest = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == req_id).FirstOrDefault();
                if (empLeaveRequest != null)
                {
                    empLeaveRequest.Status = result;
                    db.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool leaveAssign(EmployeeLeaveRequest empL, Guid? req_id, string result)
        {
            try
            {
                EmployeeLeaveRequest empLeaveRequest = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == empL.EmployeeLeaveRequestID).FirstOrDefault();
                if (empL != null)
                {
                    empL.Status = result;
                    db.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<EmployeeHoilday> getEmployeeHolidayList(Guid? emp_id)
        {
            try
            {
                List<EmployeeHoilday> listEmpHoliday = db.EmployeeHoildays.Where(a => a.EmpID == emp_id).ToList();
                return listEmpHoliday;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Holiday GetHolidayListByID(Guid? H_ID)
        {
            try
            {
                Holiday Holiday = db.Holidays.Where(a => a.HolidayID == H_ID).FirstOrDefault();
                return Holiday;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public List<Holiday> getAllHolidays()
        {
            try
            {
                List<Holiday> listHoliday = db.Holidays.ToList();
                return listHoliday;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<string> getStatus()
        {
            try
            {
                List<string> lstString = db.EmployeeLeaveRequests.Select(a => a.Status).ToList();
                return lstString;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Employee getEmployee(Guid? emp_ID)
        {
            try
            {
                return db.Employees.Where(a => a.EmployeeID == emp_ID).FirstOrDefault();
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public List<EmployeeLeaveRequest> getLeaveRequestForSuperadmin(Guid currentCountryID)
        {
            try
            {
                List<EmployeeLeaveRequest> lstEmpLeave = (from e in db.EmployeeLeaveRequests
                                                          join empL in db.Employees on e.EmployeeID equals empL.EmployeeID
                                                          where empL.CountryID == currentCountryID
                                                          orderby e.CreateDate
                                                          select e).ToList();
                return lstEmpLeave;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<EmployeeLeaveRequest> getLeaveRequestBySupervisorID(Guid? emp_ID, Guid currentCountryID)
        {
            try
            {
                List<EmployeeLeaveRequest> lstEmpLeave = (from e in db.EmployeeLeaveRequests
                                                          join empL in db.Employees on e.EmployeeID equals empL.EmployeeID
                                                          where empL.SupervisorID == emp_ID && empL.CountryID == currentCountryID
                                                          orderby e.CreateDate
                                                          select e).ToList();
                return lstEmpLeave;


            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<EmployeeLeaveRequest> getLeaveRequestByAltSupervisorID(Guid? emp_ID, Guid currentCountryID)
        {
            try
            {

                List<EmployeeLeaveRequest> lstEmpLeave = (from e in db.EmployeeLeaveRequests
                                                          join empL in db.Employees on e.EmployeeID equals empL.EmployeeID
                                                          where (empL.AlternativeSupervisorID.HasValue && empL.AlternativeSupervisorID == emp_ID &&
                                                          (empL.AltFromDate <= DateTime.Now && empL.AltEndDate >= DateTime.Now)
                                                          && empL.CountryID == currentCountryID)
                                                          orderby e.CreateDate
                                                          select e).ToList();
                return lstEmpLeave;

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<EmployeeLeaveRequest> getAllLeaveRequesByEmployeeID(Guid? emp_ID)
        {
            try
            {
                List<EmployeeLeaveRequest> listEmployeeLeaveRequest = db.EmployeeLeaveRequests.Where(a => a.EmployeeID == emp_ID).ToList();
                return listEmployeeLeaveRequest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public bool UpdateLeaveRequest(Guid? req_id)
        {
            try
            {
                EmployeeLeaveRequest empLeaveRequest = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == req_id).FirstOrDefault();
                if (empLeaveRequest != null)
                {
                    empLeaveRequest.Cancel = true;
                    db.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public List<EmployeeLeaveRequest> getLeaveAllRequest(Guid? emp_id)
        {
            try
            {
                return db.EmployeeLeaveRequests.Where(a => a.EmployeeID == emp_id).OrderBy(a => a.CreateDate).ToList();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public LeaveType getLeveTypeByID(Guid id)
        {
            try
            {
                return db.LeaveTypes.Where(a => a.LeaveTypeID == id).FirstOrDefault();
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public bool disapproveLeave(Guid? req_id)
        {
            try
            {
                EmployeeLeaveRequest empLeaveRequest = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == req_id).FirstOrDefault();
                if (empLeaveRequest != null)
                {
                    empLeaveRequest.Status = "disapproved";
                    db.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region For Leave Balance Section

        public List<EmployeeLeaf> getCurrentYearsSenctionedLeaves()
        {
            try
            {
                return db.EmployeeLeaves.Where(a => a.Year == DateTime.Now.Year).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public List<EmployeeLeaf> getCurrentYearsSenctionedLeavesbyYear(int year)
        {
            try
            {
                return db.EmployeeLeaves.Where(a => a.Year ==year).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public List<EmployeeLeaf> getCurrentYearsSenctionedLeaves(Guid employeeID)
        {
            try
            {
                return db.EmployeeLeaves.Where(a => a.EmpId == employeeID && a.Year ==DateTime.Now.Year).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public List<EmployeeLeaf> getCurrentYearsSenctionedLeaves(Guid employeeID,int year)
        {
            try
            {
                return db.EmployeeLeaves.Where(a => a.EmpId == employeeID && a.Year == year).ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        /// <summary>
        /// Return all requests of an employee of current year whose status is approved
        /// </summary>
        /// <param name="employeeID"></param>
        /// <returns></returns>
        /// 
        public List<EmployeeLeaveRequest> getCurrentYearsLeavesRequests(Guid employeeID)
        {
            try
            {
                int currentYear = DateTime.Now.Year;
                List<EmployeeLeaveRequest> li = db.EmployeeLeaveRequests.Where(a => a.EmployeeID == employeeID && a.Status.Trim().ToLower() == "approved").ToList();
               // li = li.Where(a => (a.FromDate.Value.Year == currentYear) && (a.ToDate.HasValue && a.ToDate.Value.Year == (currentYear+1))).ToList();
                li = li.Where(a => (a.FromDate.Value.Month >= 10 && a.FromDate.Value.Year == (currentYear - 1)) || (a.ToDate.Value.Month <= 9 && a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();
                return li;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<EmployeeLeaveRequest> getCurrentYearsLeavesRequests(Guid employeeID,int year)
        {
            try
            {
                int currentYear = year;
                List<EmployeeLeaveRequest> li = db.EmployeeLeaveRequests.Where(a => a.EmployeeID == employeeID && a.Status.Trim().ToLower() == "approved" && (!a.Cancel.HasValue || a.Cancel.Value==false)).ToList();
               //li = li.Where(a => (a.FromDate.Value.Year == currentYear) && (a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();
               // li = li.Where(a => (a.FromDate.Value.Month >= 10 && a.FromDate.Value.Year == (currentYear - 1)) || (a.ToDate.Value.Month <= 9 && a.ToDate.HasValue && a.ToDate.Value.Year == currentYear) || ((a.FromDate.Value.Month <= 9 && a.FromDate.Value.Year == (currentYear - 1))&&(a.ToDate.HasValue && (a.ToDate.Value.Year == currentYear||a.ToDate.Value.Year == currentYear-1)))).ToList();
                li = li.Where(a => (a.FromDate.Value.Month >= 10 && a.FromDate.Value.Year == (currentYear - 1)) || (a.ToDate.Value.Month <= 9 && a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();

                return li;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        /// <summary>
        /// Created By :tailor
        /// Date: 17/12/2013
        /// </summary>
        /// <param name="employeeID"></param>
        /// <returns></returns>
        public List<EmployeeLeaveRequest> getSelectedYearLeavesRequests(Guid employeeID,int year)
        {
            try
            {
                int currentYear = year;
                List<EmployeeLeaveRequest> li = db.EmployeeLeaveRequests.Where(a => a.EmployeeID == employeeID && a.Status.Trim().ToLower() == "approved").ToList();
                //li = li.Where(a => (a.FromDate.Value.Year == currentYear) && (a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();
                li = li.Where(a => (a.FromDate.Value.Month >= 10 && a.FromDate.Value.Year == (currentYear - 1)) || (a.ToDate.Value.Month <= 9 && a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();
                return li;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<EmployeeLeaveRequest> getCurrentYearsLeavesRequests()
        {
            try
            {
                int currentYear = DateTime.Now.Year;
                List<EmployeeLeaveRequest> li = db.EmployeeLeaveRequests.Where(a => a.Status.Trim().ToLower() == "approved").ToList();
                //li = li.Where(a => (a.FromDate.Value.Year == currentYear) && (a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();
                li = li.Where(a => (a.FromDate.Value.Month >= 10 && a.FromDate.Value.Year == (currentYear - 1)) || (a.ToDate.Value.Month <= 9 && a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();
                return li;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<EmployeeLeaveRequest> getCurrentYearsLeavesRequests(int year)
        {
            try
            {
                int currentYear = year;
                List<EmployeeLeaveRequest> li = db.EmployeeLeaveRequests.Where(a => a.Status.Trim().ToLower() == "approved").ToList();
                //li = li.Where(a => (a.FromDate.Value.Year == currentYear) && (a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();
                li = li.Where(a => (a.FromDate.Value.Month >= 10 && a.FromDate.Value.Year == (currentYear - 1)) || (a.ToDate.Value.Month <= 9 && a.ToDate.HasValue && a.ToDate.Value.Year == currentYear)).ToList();
                return li;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        public List<EmployeeLeaf> getEmployeeLeavesByYear(Guid employeeID, int year)
        {
            try
            {
                return db.EmployeeLeaves.Where(a => a.EmpId == employeeID && a.Year == year).ToList();
            }
            catch (Exception ee)
            {
                return null;
            }
        }
        public bool deletePreviousYearsEntries(Guid employeeID, int year)
        {
            try
            {
                List<EmployeeLeaf> li = db.EmployeeLeaves.Where(a => a.EmpId == employeeID && a.Year == year).ToList();
                foreach (var item in li)
                {
                    db.EmployeeLeaves.Remove(item);
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        #region  Check Leave date is Between current year to next year
        public Boolean isLeaveDateBetweenCurrentAndNext(EmployeeLeaveRequest Emp_LeaveReq)
        {
            try
            {
                if (Emp_LeaveReq != null)
                {
                    if (((Emp_LeaveReq.ToDate.HasValue && Emp_LeaveReq.ToDate.Value.Month >= 10) || (Emp_LeaveReq.ToDate.HasValue && Emp_LeaveReq.ToDate.Value.Month <= 9 && Emp_LeaveReq.ToDate.Value.Year == (Emp_LeaveReq.ToDate.Value.Year + 1))))
                    {
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                return true;
            }
        }
        #endregion

        #region Assign Postponed Leave
        public Boolean AssignPostponedLeave(PostponedLeave addPostponedLeave)
        {
            try {
                EmployeeLeaf isExists = db.EmployeeLeaves.Where(a => a.EmployeeLeaveID == addPostponedLeave.EmployeeLeaveID).FirstOrDefault();
                if (isExists!=null)
                {
                    isExists.TotalLeaves = isExists.TotalLeaves - (isExists.PostponedLeave??0);
                    isExists.TotalLeaves = isExists.TotalLeaves + (addPostponedLeave.PostponedLeaveValue ?? 0);
                    isExists.PostponedLeave = addPostponedLeave.PostponedLeaveValue;
                    isExists.TotalLeaves = isExists.TotalLeaves - ((isExists.BalanceLeaves ?? 0));
                    isExists.TotalLeaves = isExists.TotalLeaves + (addPostponedLeave.PreviousLeaveValue ?? 0);
                    isExists.BalanceLeaves = addPostponedLeave.PreviousLeaveValue;
                    db.SaveChanges();
                    return true;
                    }
                return false;
            }
            catch(Exception ex){return false;}
        }
        #endregion

    }
}
