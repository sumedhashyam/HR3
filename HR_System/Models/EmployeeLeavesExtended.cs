﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HR_System.Models
{
    public class EmployeeLeavesExtended : DAO.EmployeeLeaf
    {
        public decimal? balanceLeave { get; set; }
    }
}