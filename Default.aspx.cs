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
    public partial class Default : System.Web.UI.Page
    {
        public readonly string constring = "Server=sql.bsite.net\\MSSQL2016;Database=bharatbuys_db;User Id=bharatbuys_db;Password=Ganesh@123.;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                seesh();
            }
        }
               

        protected void regdonor(object sender, EventArgs e)
        {

            Response.Redirect("RegisterDonor.aspx");
        }

        protected void searchdonor(object sender, EventArgs e)
        {
            Response.Redirect("SearchDonor.aspx");
        }

        protected void logout(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void seerequest(object sender, EventArgs e)
        {
            Response.Redirect("BloodRequest.aspx");
        }

        public  void seesh()
        {
            
            using (SqlConnection con = new SqlConnection(constring))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select count(Donor_Email) from bd_Donor where Donor_Email=@Donor_Email", con))
                {
                    cmd.Parameters.AddWithValue("@Donor_Email", Session["Username"].ToString() );
                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        Button2.Visible = false;
                    }
                    else
                    {
                        Button3.Visible = false;
                    }


                }

            }
        }
    }
}