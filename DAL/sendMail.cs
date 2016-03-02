using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.Text;


/// <summary>
/// Summary description for sendMail
/// </summary>
namespace BusinessLogics
{
    public class sendMail
    {
        public sendMail()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public bool MailSender(string to, string html, string subject)
        {
            bool retVal;
            try
            {
                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                SmtpClient smtpClient = new SmtpClient();
                msg.From = new System.Net.Mail.MailAddress(ConfigurationManager.AppSettings["MailSenderUserName"].ToString(), "HR System");
                msg.To.Add(to);
                msg.Subject = subject;
                msg.Body = html;
                msg.IsBodyHtml = true;
                smtpClient.Host = ConfigurationManager.AppSettings["Host"].ToString();
                smtpClient.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["MailSenderUserName"].ToString(), ConfigurationManager.AppSettings["MailSenderPass"].ToString());
                smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"].ToString());
                smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
                smtpClient.Send(msg);
                retVal = true;

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return retVal;
        }

        public static string getMailHTML(string WebSiteName, string EmailTitle, string UserName, string Message, string SiteUrl, string SiteLogUrl, string WebsiteUrl)
        {
            System.Text.StringBuilder mailHtml = new StringBuilder("");
            mailHtml.Append("<div align='center'><div style='width: 650px'><div style=' width: 650px; color: #fff; background-color: #001b33; border-radius: 5px 5px 0px 0px;");
            mailHtml.Append("font-size: 11px; font-family: tahoma,verdana,arial,sans-serif'><div style='padding: 2px 29px;text-align: left;color: #FAFAFA;'>");
            mailHtml.Append("<h2 style='font-family: tahoma,verdana,arial,sans-serif;color: #FED20B;'>" + WebSiteName + "</h2>");
            mailHtml.Append("</div></div><div><table cellpadding='0' cellspacing='5px' style='border: 2px solid #a6a6a6; border-width: 0 2px;");
            mailHtml.Append(" width: 650px; font-size: 13px; background-color: #dddddd'><tbody><tr style='background-color: #ffffff'>");
            mailHtml.Append("<td><table cellpadding='0' cellspacing='0' width='100%'><tbody><tr>");
            mailHtml.Append("<td style='vertical-align: top;'><a href='" + WebsiteUrl + "' target='_blank'>");
            mailHtml.Append("<img src='" + SiteLogUrl + "' style='padding: 20px 20px;height: 115px; width: 130px; border: 0px'></a>");
            mailHtml.Append("</td><td style='vertical-align: middle; padding-left: 20px; padding-right: 25px; padding-top: 20px;text-align: left'>");
            mailHtml.Append("<div style='background-color: #ffffff; color: #333333; text-transform: uppercase;");
            mailHtml.Append("font-size: 16px; font-weight: bold; margin-bottom: 10px'>" + EmailTitle + "</div><br>");
            mailHtml.Append("<div style='font-family: tahoma,verdana,arial,sans-serif; font-size: 13px; margin-bottom: 15px'>Hello " + UserName + "</div>");
            mailHtml.Append("<div style='font-size: 13px; font-family: tahoma,verdana,arial,sans-serif; margin-bottom: 15px'>");
            mailHtml.Append("" + Message + "</div>");
            //mailHtml.Append("<div style='text-align: center; padding: 15px 0; margin: 10px 0; font-family: tahoma,verdana,arial,sans-serif'>");
            //mailHtml.Append("<a style='background-color: #FF7906; color: #ffffff; font-size: 14px; font-weight: bold;");
            //mailHtml.Append("  padding: 5px 10px; border-radius: 3px; text-decoration: none' href='" + WebsiteUrl + "' target='_blank'>");
            //mailHtml.Append("    Go To " + WebSiteName + "</a>");
            mailHtml.Append(" </div></td></tr></tbody></table></td></tr></tbody></table></div></div>");
            mailHtml.Append(" <div style='width: 650px; color: #fff; background-color: #001b33; border-radius: 0 0 5px 5px;");
            mailHtml.Append(" font-size: 11px; font-family: tahoma,verdana,arial,sans-serif'>");
            mailHtml.Append(" <div style='padding: 15px 0'>Thank You");
            mailHtml.Append(" </div></div></div>");

            return mailHtml.ToString();
        }
    }
}