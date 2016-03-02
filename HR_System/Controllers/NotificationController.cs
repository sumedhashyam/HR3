using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAO;
using DAL;
using HR_System.Models;
namespace HR_System.Controllers
{
    [Authorize]
    public class NotificationController : Controller
    {
        //
        // GET: /Notification/

        clsNotification _objNotification = new clsNotification();

        public ActionResult Index()
        {

            return View();
        }


        public ActionResult AllNotification()
        {
            Guid? employeeID = MVCUtility.getCurrentEmployeeID();
            List<Notification> li = _objNotification.getAllNotificationsByEmployeeID(employeeID.Value);
            return PartialView(li);
        }
        public ActionResult Detail(Guid id)
        {
            _objNotification.markNotificationAsRead(id);
            Notification obj = _objNotification.getNotificationByID(id);
            return View(obj);
        }

        public ActionResult LeaveNotification()
        {
            Guid? employeeID = MVCUtility.getCurrentEmployeeID();
            List<Notification> li = _objNotification.getAllNotificationsByEmployeeID(employeeID.Value).Where(a => a.IsRead == false).ToList();
            return PartialView(li);
           
        }

       
    }
}
