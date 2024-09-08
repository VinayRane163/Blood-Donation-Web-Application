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
    public partial class RegisterDonor : System.Web.UI.Page
    {
        public readonly string constring = "Server=sql.bsite.net\\MSSQL2016;Database=bharatbuys_db;User Id=bharatbuys_db;Password=Ganesh@123.;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        
        protected  void RegisterasDonar_Click(object sender, EventArgs e)
        {
            string name=Username.Text;
            DateTime dob = Convert.ToDateTime(dateofbirth.Text);
            string gender = GenderList.SelectedValue;
            string bloodtype = DropDownListBloodType.SelectedValue;
            string medicalhistory = DropDownListMedicalHistory.SelectedValue;
            string state = DropDownList1.SelectedValue;
            string city = City.Text;
            string pincode = Pincode.Text;
            string address = Address.Text;
            string mob = MobileNumber.Text;
            string emob = EmergencyContact.Text;

            DateTime minimumage = DateTime.Today.AddYears(-18);

            if (dob >= minimumage)
            {
                string successScript = "alert('you cant register because you are underage .');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Age Issue", successScript, true);
                return;
            }
           else if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(dateofbirth.Text) ||
            string.IsNullOrEmpty(gender) || string.IsNullOrEmpty(bloodtype) ||
            string.IsNullOrEmpty(medicalhistory) || string.IsNullOrEmpty(state) ||
            string.IsNullOrEmpty(city) || string.IsNullOrEmpty(pincode) ||
            string.IsNullOrEmpty(address) || string.IsNullOrEmpty(mob) ||
            string.IsNullOrEmpty(emob))
           {
                string successScript = "alert('Fill All Fields .');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "data not filled", successScript, true);
                return;
           }
            else if (numberexist(mob))
            {
                string successScript = "alert('number already exist.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "data not filled", successScript, true);
                return;
            }
            else if(medicalhistory != "None")
            {
                string successScript = "alert('People with medical History cant register as Donor .');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "not fit", successScript, true);
                return;
            }
            else if(!CheckBox1.Checked)
            {
                string successScript = "alert('Please Accept Terms and Conditions.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "not fit", successScript, true);
                return;
            }
            else
            {
                using (SqlConnection con = new SqlConnection(constring))
                {
                    con.Open();
                    string query = "INSERT INTO bd_Donor " +
                        "(Donor_Email,Name, DateOfBirth, Gender, BloodType, MedicalHistory, State, City, Pincode, Address, MobileNumber, EmergencyContact)" +
                        " VALUES " +
                        "(@Donor_Email,@Name, @DateOfBirth, @Gender, @BloodType, @MedicalHistory, @State, @City, @Pincode, @Address, @MobileNumber, @EmergencyContact)";
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@Donor_Email", Session["Username"].ToString());
                        command.Parameters.AddWithValue("@Name", name);
                        command.Parameters.AddWithValue("@DateOfBirth", dob);
                        command.Parameters.AddWithValue("@Gender", gender);
                        command.Parameters.AddWithValue("@BloodType", bloodtype);
                        command.Parameters.AddWithValue("@MedicalHistory", medicalhistory);
                        command.Parameters.AddWithValue("@State", state);
                        command.Parameters.AddWithValue("@City", city);
                        command.Parameters.AddWithValue("@Pincode", pincode);
                        command.Parameters.AddWithValue("@Address", address);
                        command.Parameters.AddWithValue("@MobileNumber", mob);
                        command.Parameters.AddWithValue("@EmergencyContact", emob);

                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            string successScript = "if (confirm('Sucessfully Registered as Donor')) { window.location.href = 'Default.aspx'; } else { setTimeout(function(){ window.location.href = 'Default.aspx'; }, 3000); };";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "RegistrationSuccessScript", successScript, true);
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

        public bool numberexist(string x)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constring))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("Select count(MobileNumber) from bd_Donor where MobileNumber=@Number", con))
                    {
                        cmd.Parameters.AddWithValue("@Number", x);
                        int count = (int)cmd.ExecuteScalar();

                        return count > 0;


                    }

                }
            }
            catch {
                string successScript = "alert('registeration failed.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", successScript, true);
                return false;
            }

        }

    }    
}