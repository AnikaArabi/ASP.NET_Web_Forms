using EmployeeGradeTracking.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeGradeTracking.EmployeeGradeTracking
{
    public partial class EmployeeByDeptReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Departments", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Departments");
                    da.SelectCommand.CommandText = "SELECT * FROM Employees";
                    da.Fill(ds, "Employees");
                    EmployeeByDeptRpt rpt = new EmployeeByDeptRpt();
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}