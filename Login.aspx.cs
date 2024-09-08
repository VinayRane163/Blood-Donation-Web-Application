using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bloodDonation
{
    public partial class Login : System.Web.UI.Page
    {
        public readonly string constring = "Server=sql.bsite.net\\MSSQL2016;Database=bharatbuys_db;User Id=bharatbuys_db;Password=Ganesh@123.;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using(SqlConnection con = new SqlConnection(constring))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("Select * from bd_userdata where Email=@Email and Password=@Password", con))
                    {
                       cmd.Parameters.AddWithValue("@Email",Username.Text);
                       cmd.Parameters.AddWithValue("@Password",Password.Text);
                        cmd.ExecuteNonQuery();
                        using(SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Session["Username"] = Username.Text;
                                Response.Redirect("Default.aspx");
                                
                            }
                            else
                            {
                                string successScript = "alert('Wrong username or password.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "wrong Login", successScript, true);
                                return;
                            }
                        }
                    }
                }

            }
            catch 
            {
                string successScript = "alert('Error occured.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", successScript, true);
                return;
            }
        }
        
    }
}