using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsNotification
    {
        dbHRSystemEntities db = new dbHRSystemEntities();

        public List<Notification> getAllNotifications()
        {
            return db.Notifications.ToList();
        }

        public List<Notification> getAllNotificationsByEmployeeID(Guid employeeID)
        {
            return db.Notifications.Where(a => a.EmployeeID == employeeID).ToList();
        }

        public Notification getNotificationByID(Guid NotificationID)
        {
            return db.Notifications.Where(a => a.NotificationID == NotificationID).FirstOrDefault();
        }

        public bool addNotification(Notification obj)
        {
            try
            {
                db.Notifications.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        public bool markNotificationAsRead(Guid NotificationID)
        {
            try
            {
                Notification obj = db.Notifications.Where(a => a.NotificationID == NotificationID).FirstOrDefault();
                if (obj != null)
                {
                    obj.IsRead = true;
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
