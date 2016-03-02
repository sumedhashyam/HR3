using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsServiceBonus
    {
        #region Deceleration : Objects & Variables
        dbHRSystemEntities db = new dbHRSystemEntities();
        #endregion

        #region Function For : Get All Employee Incremented Service Bonus Year
        public List<ServiceBonu> GetAllEmployeeIncrementedServiceBonusYear()
        {
            return db.ServiceBonus.ToList();
        }
        #endregion

        #region Function For : Get Specific Employee Incremented Service Bonus Years
        public List<ServiceBonu> GetEmployeeIncrementedServiceBonusYears(Guid ID)
        {
            return db.ServiceBonus.Where(a=>a.EmployeeID==ID).ToList();
        }
        #endregion

        #region Function For :Check Is Service Bonus Incremented Of A employee By Employee ID
        public Boolean IsServiceBonusIncremented(Guid ID,string year)
        {
            try
            {
                ServiceBonu IsExists = db.ServiceBonus.Where(a => a.EmployeeID == ID && a.IncrementedYear == year).FirstOrDefault();
                if (IsExists != null)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Function For : Add Incremented Service Bonus
        public Boolean AddIncrementedServiceBonus(ServiceBonu Add,int incrementvalue)
        {
            try
            {
                Guid leaveTypeID= new Guid("5E346FD2-CEC2-4F26-B18D-058585BC936E");

                int year = Convert.ToInt32(Add.IncrementedYear);
                EmployeeLeaf EmpLeave = db.EmployeeLeaves.Where(a => a.EmpId == Add.EmployeeID && (a.LeaveType.LeaveTypeID == leaveTypeID || a.LeaveType.LeaveTypeName == "Annual Leave") && a.Year == year).FirstOrDefault();
                    if (EmpLeave != null )
                    {
                        EmpLeave.IssuedLeaves = EmpLeave.IssuedLeaves + incrementvalue;
                        EmpLeave.TotalLeaves = EmpLeave.TotalLeaves + incrementvalue;
                        db.ServiceBonus.Add(Add);
                        db.SaveChanges();
                        return true;
                    }
                    return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion
    }
}
