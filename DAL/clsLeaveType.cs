using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsLeaveType
    {
        #region Declaration: Object & Variables
        dbHRSystemEntities db = new dbHRSystemEntities();
        #endregion

        #region Function For :Get all Leave Type
        public List<LeaveType> getLeaveType()
        {
            try
            {
                return db.LeaveTypes.ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Add Leave Type
        public bool addLeaveType(LeaveType obj)
        {
            try
            {
                db.LeaveTypes.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Get Leave Type Detail
        public LeaveType getLeaveTypebyId(Guid id)
        {
            try
            {
                return db.LeaveTypes.Where(a => a.LeaveTypeID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Update Leave Type detail
        public bool updateLeaveTypeDetail(LeaveType objEdit)
        {
            try
            {
                LeaveType LeaveTypeObj = db.LeaveTypes.Where(a => a.LeaveTypeID == objEdit.LeaveTypeID).FirstOrDefault();
                LeaveTypeObj.LeaveTypeName = objEdit.LeaveTypeName;
                LeaveTypeObj.LeaveTypeCode = objEdit.LeaveTypeCode;
                LeaveTypeObj.LeaveTypeColor = objEdit.LeaveTypeColor;
                LeaveTypeObj.DefaultLeaves = objEdit.DefaultLeaves;
                LeaveTypeObj.WillHolidaysCount = objEdit.WillHolidaysCount;
                db.SaveChanges();                
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }

        }
        #endregion

        #region Function For :Delete Leave Type
        public bool deleteLeaveType(Guid id)
        {


            try
            {
                LeaveType deleteDetail = db.LeaveTypes.Where(a => a.LeaveTypeID == id).FirstOrDefault();

                db.LeaveTypes.Remove(deleteDetail);

                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {

                return false;
            }

        }
        #endregion

        #region Function For :Add Employee Leave
        public bool addEmployeeLeave(EmployeeLeaf obj,int i)
        {
            try
            {
                List<EmployeeLeaf> emplv = db.EmployeeLeaves.Where(a => a.EmpId == obj.EmpId).ToList();
                if (1 == i)
                {
                    foreach (var item in emplv)
                    {
                        db.EmployeeLeaves.Remove(item);

                        db.SaveChanges();

                    }
                    db.EmployeeLeaves.Add(obj);
                    db.SaveChanges();
                    return true;

                }
                db.EmployeeLeaves.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        #endregion

        #region Function For :Update Employee Leave
        public bool UpdateEmployeeLeave(EmployeeLeaf obj)
        {
            try
            {
                EmployeeLeaf objempLeave = db.EmployeeLeaves.Where(a => a.EmployeeLeaveID == obj.EmployeeLeaveID).FirstOrDefault();
                objempLeave.EmpId = obj.EmpId;
                objempLeave.LeaveTypeID = obj.LeaveTypeID;
                objempLeave.IssuedLeaves = obj.IssuedLeaves;
                objempLeave.TotalLeaves = obj.TotalLeaves;
                objempLeave.BalanceLeaves = obj.BalanceLeaves;
                objempLeave.Year = obj.Year;

                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Edit Employee Leave
        public List<EmployeeLeaf> EditEmployeeLeave(Guid id)
        {
            try
            {
                return db.EmployeeLeaves.Where(a => a.EmpId==id).ToList();
               
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        #endregion

        #region Function For :Delete Employee Leave
        public bool delEmployeeLeave(Guid id, Guid empid)
        {


            try
            {
                EmployeeLeaf co = db.EmployeeLeaves.Where(a => (a.LeaveTypeID == id) && (a.EmpId == empid)).FirstOrDefault();
                if (co != null)
                {
                    db.EmployeeLeaves.Remove(co);
                    db.SaveChanges();
                    return true;
                }
                else {

                    return true;
                }
            }


            catch (Exception ee)
            {

                return false;
            }

        }
        #endregion

        #region Function For :Add New Employee Leave
        public bool addNewEmployeeLeave(EmployeeLeaf obj)
        {
            try
            {
                db.EmployeeLeaves.Add(obj);
                db.SaveChanges();
                return false;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        #endregion
    }
}
