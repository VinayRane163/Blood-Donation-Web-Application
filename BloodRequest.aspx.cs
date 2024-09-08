using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bloodDonation
{
    public partial class BloodRequest : System.Web.UI.Page
    {
        private readonly string constring = "Server=sql.bsite.net\\MSSQL2016;Database=bharatbuys_db;User Id=bharatbuys_db;Password=Ganesh@123.;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                try
                {
                    string usr = Session["Username"].ToString();
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("select * from bd_requestData where receivername=@donor order by MessageId desc",con))
                        {
                            cmd.Parameters.AddWithValue("@donor", usr);
                            using (SqlDataReader reader= cmd.ExecuteReader())
                            { 
                                Repeater1.DataSource = reader;
                                Repeater1.DataBind();
                            }
                        }
                    }
                }
                catch(Exception ex)
                {
                    string msg = ex.Message;
                    string successScript = "alert('Error 💀💀')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", successScript, true);
                    return;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}