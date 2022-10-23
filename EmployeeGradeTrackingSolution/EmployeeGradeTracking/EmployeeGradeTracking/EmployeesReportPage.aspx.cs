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
    public partial class EmployeesReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Employees", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Employees");
                    da.SelectCommand.CommandText = "SELECT * FROM Employees";
                    da.Fill(ds, "Employees");
                    EmployeesRpt rpt = new EmployeesRpt();
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}