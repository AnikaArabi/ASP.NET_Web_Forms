using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmployeeGradeTracking.BILL
{
    public class EmployeeManage
    {
        SqlConnection con;
        public EmployeeManage()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        }
        public ICollection<EmployeeDTO> GetAll()
        {
            List<EmployeeDTO> emloyees = new List<EmployeeDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Employees", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    emloyees.Add(new EmployeeDTO
                    {
                        EmployeeId = r.Field<int>("employeeId"),
                        EmployeeName = r.Field<string>("EmployeeName"),
                        JoiningDate = r.Field<DateTime>("JoiningDate"),
                        Email = r.Field<string>("Email"),
                        Phone = r.Field<int>("Phone"),
                        IsActive = r.Field<bool>("isActive"),
                        Picture = r.Field<string>("Picture"),
                        DepartmentId = r.Field<int>("DepartmentId")
                    });
                }
                return emloyees;
            }
        }
        public void Insert(EmployeeDTO dto)
        {
            string sql = @"INSERT INTO [dbo].[Employees]
                           ([EmployeeName]
                           ,[JoiningDate]
                           ,[Email]
                           ,[Phone]
                           ,[isActive]
                            ,[Picture]
                            ,[DepartmentId])
                     VALUES
                           (@EmployeeName
                           ,@JoiningDate
                           ,@Email
                           ,@Phone
                           ,@isActive
                            ,@Picture
                            ,@DepartmentId)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@EmployeeName", dto.EmployeeName);
                cmd.Parameters.AddWithValue("@JoiningDate", dto.JoiningDate);
                cmd.Parameters.AddWithValue("@Email", dto.Email);
                cmd.Parameters.AddWithValue("@Phone", dto.Phone);
                cmd.Parameters.AddWithValue("@isActive", dto.IsActive);
                cmd.Parameters.AddWithValue("@Picture", dto.Picture);
                cmd.Parameters.AddWithValue("@DepartmentId", dto.DepartmentId);
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }
        public void Update(EmployeeDTO dto) { }
        public void Delete(EmployeeDTO dto) { }
        public DataTable BranchDropItems()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Departments", this.con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        public string GetDepartmentName(int id)
        {
            string sql = "SELECT DepartmenthName FROM Departments WHERE DepartmentId=@id";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                try
                {
                    con.Open();
                    string name = cmd.ExecuteScalar().ToString();
                    con.Close();
                    return name;
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                finally
                {
                    if (con.State == ConnectionState.Open) con.Close();
                }
            }
        }

    }
}