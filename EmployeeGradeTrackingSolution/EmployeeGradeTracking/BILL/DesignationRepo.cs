using EmployeeGradeTracking.EmployeeGradeTracking;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmployeeGradeTracking.BILL
{
    public class DesignationRepo : IDesignationRepo
    {
        SqlConnection con;
        public DesignationRepo()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        }
        public void Delete(DesignationDTO dto)
        {
            throw new NotImplementedException();
        }

        public int DesignationCount()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Designations", this.con))
            {
                this.con.Open();
                int n = (int)cmd.ExecuteScalar();
                this.con.Close();
                return n;
            }
        }

        public DesignationDTO Get(int id)
        {
            throw new NotImplementedException();
        }

        public ICollection<DesignationDTO> GetAll()
        {
            List<DesignationDTO> Designations = new List<DesignationDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Designations", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    Designations.Add(new DesignationDTO
                    {
                        DesignationId = r.Field<int>("DesignationId"),
                        Designation = r.Field<string>("Designation"),
                    });
                }
                return Designations;

            }
        }

        public void Insert(DesignationDTO dto)
        {
            string sql = @"INSERT INTO [Designations]
                           ([Designation])
                            VALUES
                           (@Designation)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@Designation", dto.Designation);
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

        public void Update(DesignationDTO dto)
        {
            throw new NotImplementedException();
        }
        public void Dispose()
        {
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}