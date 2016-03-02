using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HR_System.Models
{
    public class SiteRoles
    {
        static string _SuperAdmin = "superadmin";
        static string _Admin = "admin";
        static string _Setup = "setup";
        static string _HR = "hr";
        static string _Employee = "employee";

        public static string SuperAdmin
        {
            get
            {
                return _SuperAdmin;
            }
        }
        public static string Admin
        {
            get
            {
                return _Admin;
            }
        }
        public static string Setup
        {
            get
            {
                return _Setup;
            }
        }
        public static string HR
        {
            get
            {
                return _HR;
            }
        }
        public static string Employee
        {
            get
            {
                return _Employee;
            }
        }
       

    }
}