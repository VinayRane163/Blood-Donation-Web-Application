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
    public partial class SearchDonor : System.Web.UI.Page
    {
        public readonly string constring = "Server=sql.bsite.net\\MSSQL2016;Database=bharatbuys_db;User Id=bharatbuys_db;Password=Ganesh@123.;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"]==null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Search(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constring))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("Select * from bd_Donor where (City LIKE '%' + @search + '%' OR Pincode LIKE '%' + @search + '%') and BloodType=@BloodType", con))
                    {
                        cmd.Parameters.AddWithValue("@search", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@BloodType", DropDownListBloodType.SelectedValue);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                           
                                Repeater1.DataSource = reader;
                                Repeater1.DataBind();
                            
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

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}