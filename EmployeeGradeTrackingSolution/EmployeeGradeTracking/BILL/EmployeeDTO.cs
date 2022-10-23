using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeGradeTracking.BILL
{
    public class EmployeeDTO
    {
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public DateTime JoiningDate { get; set; }
        public string Email { get; set; }
        public int Phone { get; set; }
        public bool IsActive { get; set; }
        public string Picture { get; set; }
        public int DepartmentId { get; set; }
    }
}