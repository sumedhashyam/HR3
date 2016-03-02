using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using BusinessLogics;
using DAL;
using DAO;

namespace HR_System.Models
{
    public class EmailLeaveBalance
    {
        clsEmployee _objEmployee = new clsEmployee();

        public bool setAccessibilityForTools()
        {
            // if session has null value for tools the set it in session
            if (HttpContext.Current.Session["tools"] == null)
            {
                string EmailUser1 = System.Web.Configuration.WebConfigurationManager.AppSettings["EmailUser1"].ToString().Trim();
                string EmailUser2 = System.Web.Configuration.WebConfigurationManager.AppSettings["EmailUser2"].ToString().Trim();
                bool isOkay = false;
                try
                {
                    MembershipUser u = Membership.GetUser();
                    if (Roles.IsUserInRole(u.UserName, SiteRoles.SuperAdmin))
                    {
                        isOkay = true;
                    }
                    else
                    {
                        if (u.UserName == EmailUser1 || u.UserName == EmailUser2)
                        {
                            isOkay = true;
                        }
                    }
                }
                catch (Exception ee)
                {
                    isOkay = false;
                }
                HttpContext.Current.Session["tools"] = isOkay;
            }

            // Now tools has been set in session
            bool toolsAccess = Convert.ToBoolean(HttpContext.Current.Session["tools"].ToString());
            return toolsAccess;
        }

        public bool sendLeaveBalance()
        {
            try
            {
                sendMail mailSender = new sendMail();
                bool isOkay = true;
                List<Employee> empList = _objEmployee.getEmployees();
                if (empList != null && empList.Count() > 0)
                {
                    //Lopp through all employees ( supervisors)
                    foreach (Employee empItem in empList)
                    {
                        // Get list of employees which comes under supervisor
                        List<Employee> employeesList = empList.Where(a => a.SupervisorID == empItem.EmployeeID).ToList();

                        // Remove if the supervisor itselt is in list
                        Employee selfSupervisor = employeesList.Where(a => a.EmployeeID == empItem.EmployeeID).FirstOrDefault();
                        if (selfSupervisor != null)
                        {
                            employeesList.Remove(selfSupervisor);
                        }

                        StringBuilder html = new StringBuilder();
                        html.Append("<div style='padding:10px;'>");
                        html.Append("<h1 style='text-align: left:color:blue;'> Supervisor Name " + empItem.FirstNameEn + " " + empItem.LastNameEn + "</h1>");
                        string leaveBalanceHtml = getLeaveBalanceHTML(employeesList);
                        isOkay = string.IsNullOrEmpty(leaveBalanceHtml) ? false : true;
                        html.Append(leaveBalanceHtml);
                        html.Append("</div>");
                        if (isOkay)
                        {
                            bool sent = mailSender.MailSender(empItem.Email, html.ToString(), "Leave Balance Report");
                        }
                    }
                }
                return true;
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        private string getLeaveBalanceHTML(List<Employee> li)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                MVCUtility objMVCUtility = new MVCUtility();
                foreach (Employee item in li)
                {
                    sb.Append("<div style='margin-bottom:20px;'>");
                    sb.Append("<h3 style='text-align: center'>Employee Name : " + item.FirstNameEn + " " + item.LastNameEn + "</h3>");
                    sb.Append("<table>");
                    sb.Append("<tr><th style='border: 1px solid black;'>Type</th><th style='border: 1px solid black;'>Total (Prev. Balance + Current Assigned)</th>");
                    sb.Append("<th style='border: 1px solid black;'>Balance</th><th>");
                    List<EmployeeLeaveModified> leavesList = objMVCUtility.getLeaveSummary(item.EmployeeID);
                    foreach (EmployeeLeaveModified leaveItem in leavesList)
                    {
                        sb.Append("<tr>");
                        sb.Append("<td style='border: 1px solid black;'>" + leaveItem.LeaveTypeName + "</td>");
                        sb.Append("<td style='border: 1px solid black;'>" + leaveItem.TotalLeaves + "</td>");
                        sb.Append("<td style='border: 1px solid black;'>" + leaveItem.BalanceLeaves + "</td>");
                        sb.Append("</tr>");
                    }
                    sb.Append("</table>");
                    sb.Append("</div>");

                }
                return sb.ToString();
            }
            catch (Exception ee)
            {
                return string.Empty;
            }
        }
    }
}