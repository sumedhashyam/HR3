using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAO;

namespace DAL
{
   public class clsEmployeeLeaveRequest
    {
       dbHRSystemEntities db = new dbHRSystemEntities();

       public bool cancelLeaveRequest(Guid leaveReauestId)
       {
           try
           {
               EmployeeLeaveRequest leaveRequest = db.EmployeeLeaveRequests.Where(a => a.EmployeeLeaveRequestID == leaveReauestId).FirstOrDefault();
               if (leaveRequest != null)
               {
                   leaveRequest.Cancel = true;
                   db.SaveChanges();
               }
               return true;
           }
           catch (Exception ee)
           {
               return false;
           }
       }
    }
}
