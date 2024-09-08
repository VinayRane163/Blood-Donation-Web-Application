using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bloodDonation
{
    public partial class Register : System.Web.UI.Page
    {
        public readonly string constring = "Server=sql.bsite.net\\MSSQL2016;Database=bharatbuys_db;User Id=bharatbuys_db;Password=Ganesh@123.;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            try
            {

                if (string.IsNullOrEmpty(Password.Text) || string.IsNullOrEmpty(Username.Text) || string.IsNullOrEmpty(Email.Text) || string.IsNullOrEmpty(MobileNumber.Text))
                {
                    string successScript = "alert('fill all details.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "data not filled", successScript, true);
                    return;
                }
                else if (numberexist(MobileNumber.Text))
                {
                    string successScript = "alert('number already exist.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "data not filled", successScript, true);
                    return;
                }
                else if (EMAILEXIST(Email.Text))
                {
                    string successScript = "alert('eMAIL already exist.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "data not filled", successScript, true);
                    return;
                }
                else
                {
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("insert into bd_userdata values (@name,@email,@mobile,@pass)", con))
                        {
                            cmd.Parameters.AddWithValue("@name", Username.Text);
                            cmd.Parameters.AddWithValue("@email", Email.Text);
                            cmd.Parameters.AddWithValue("@mobile", MobileNumber.Text);
                            cmd.Parameters.AddWithValue("@pass", RePass.Text);
                            int rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                Session["Username"] = Username.Text;
                                Response.Redirect("Default.aspx");
                            }
                            else
                            {
                                string successScript = "alert('registeration failed.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", successScript, true);
                                return;
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                string successScript = "alert('Error Message');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", successScript, true);
                return;
            }
        }

        public bool numberexist(string x)
        {
            using (SqlConnection con = new SqlConnection(constring))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select count(Number) from bd_userdata where Number=@Number", con))
                {
                    cmd.Parameters.AddWithValue("@Number", x);
                    int count = (int)cmd.ExecuteScalar();

                    return count > 0;


                }

            }

        }

        public bool EMAILEXIST(string x)
        {
            using (SqlConnection con = new SqlConnection(constring))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select count(Email) from bd_userdata where Email=@Email", con))
                {
                    cmd.Parameters.AddWithValue("@Email", x);
                    int count = (int)cmd.ExecuteScalar();

                    return count > 0;


                }

            }

        }
    }
}