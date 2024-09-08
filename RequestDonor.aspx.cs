using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Drawing;

namespace bloodDonation
{
    public partial class RequestDonor : System.Web.UI.Page
    {
        public readonly string constring = "Server=sql.bsite.net\\MSSQL2016;Database=bharatbuys_db;User Id=bharatbuys_db;Password=Ganesh@123.;";

        protected void Page_Load(object sender, EventArgs e)
        {
            string Did = Request.QueryString["DonorID"];
            if(Did == null)
            {
                Response.Redirect("SearchDonor.aspx");
            }
            else
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("Select * from bd_Donor where DonorID=@DonorID", con))                            
                        {
                            cmd.Parameters.AddWithValue("@DonorID", Did);
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

        }

        protected void sendreq(object sender, EventArgs e)
        {
            try
            {
                string Did = Request.QueryString["DonorID"];

                DateTime dateTime = Convert.ToDateTime(DATE.Text);
                DateTime current = DateTime.Now;
                if(string.IsNullOrEmpty(DATE.Text)||string.IsNullOrEmpty(RName.Text)||string.IsNullOrEmpty(MESSAGE.Text)||string.IsNullOrEmpty(Number.Text))
                {
                    string successScript = "alert('Fill all data";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", successScript, true);
                    return;
                }
          
                else if (dateTime >= current)
                {

                    try
                    {
                        using (SqlConnection con = new SqlConnection(constring))
                        {
                            con.Open();
                            using (SqlCommand cmd = new SqlCommand("Select Donor_Email from bd_Donor where DonorID=@DonorID", con))
                            {
                                cmd.Parameters.AddWithValue("@DonorID", Did);
                                var result = cmd.ExecuteScalar();
                                 string donorName = result.ToString();
                                insertdata(donorName);

                                sendBloodRequest(donorName);


                            }
                            con.Close();



                        }

                    }
                    catch(Exception err)
                    {
                        string successScript = $"alert('{err.Message}');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", successScript, true);
                        return;
                    }
                }
         
                else
                {
                    string successScript = "alert('Error. Check all input data');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", successScript, true);
                    return;

                }
            }
            catch 
            {


                string successScript = "alert('Error occured . unable to send message');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", successScript, true);
                return;
            }
        }
        public void insertdata(string donorName)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constring))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO bd_requestData (SenderEmail, SenderName, SenderNumber, RequestDate, SenderMessage, ReceiverName) VALUES (@SenderEmail, @SenderName, @SenderNumber, @RequestDate, @SenderMessage, @ReceiverName)", con))
                    {
                        cmd.Parameters.AddWithValue("@receivername", donorName);
                        cmd.Parameters.AddWithValue("@SenderEmail", Session["Username"].ToString());
                        cmd.Parameters.AddWithValue("@SenderName", RName.Text);
                        cmd.Parameters.AddWithValue("@SenderNumber", Number.Text);
                        cmd.Parameters.AddWithValue("@SenderMessage", MESSAGE.Text);
                        cmd.Parameters.AddWithValue("@RequestDate", DATE.Text);



                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            string successScript = "if (confirm('You have successfully sent request.')) { window.location.href = 'Default.aspx'; } else { setTimeout(function(){ window.location.href = 'Default.aspx'; }, 5000); };";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "RegistrationSuccessScript", successScript, true);
                        }
                        else
                        {
                            string successScript = "alert('Error occured . unable to save data');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", successScript, true);
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                string successScript = $"alert('{ex.Message}');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", successScript, true);
            }
        }
        private void sendBloodRequest(string DONOR)
        {
            string date = DateTime.Now.ToShortDateString();
            string message = MESSAGE.Text;
            string contactNumber = Number.Text; 
            string Name = RName.Text; 

            try
            {
                // Gmail SMTP configuration
                string smtpHost = "smtp.gmail.com";
                int smtpPort = 587;
                string smtpUsername = "exploremumbai69@gmail.com";
                string smtpPassword = "svrc qelk zbvx nxle";
                string REmail = Session["Username"].ToString();
                // Email content
                string subject = "Blood Donation Request - Blood Donation";
                string body = $@"
            <html>
                <body style='font-family: Arial, sans-serif;'>
                    <p>Dear {DONOR},</p>
                    <p>We have a request for you to donate blood. Here are the details:</p>
                    <table style='border: 1px solid #dddddd; border-collapse: collapse; width: 100%; margin-top: 20px;'>
                        <tr>
                            <td style='border: 1px solid #dddddd; padding: 8px;'><strong>Name:</strong></td>
                            <td style='border: 1px solid #dddddd; padding: 8px;'>{Name}</td>
                        </tr>
                        <tr>
                            <td style='border: 1px solid #dddddd; padding: 8px;'><strong>Reciepient's Email:</strong></td>
                            <td style='border: 1px solid #dddddd; padding: 8px;'>{REmail}</td>
                        </tr>  
                        <tr>
                            <td style='border: 1px solid #dddddd; padding: 8px;'><strong>Message:</strong></td>
                            <td style='border: 1px solid #dddddd; padding: 8px;'>{message}</td>
                        </tr>
                        <tr>
                            <td style='border: 1px solid #dddddd; padding: 8px;'><strong>Date:</strong></td>
                            <td style='border: 1px solid #dddddd; padding: 8px;'>{date} mm/dd/yyyy</td>
                        </tr>
                        <tr>
                            <td style='border: 1px solid #dddddd; padding: 8px;'><strong>Contact Number:</strong></td>
                            <td style='border: 1px solid #dddddd; padding: 8px;'>{contactNumber}</td>
                        </tr>
                    </table>

                    <p style='margin-top: 20px;'>Please contact the provided number as soon as possible to coordinate the donation.</p>
                    <p>Thank you for your support and willingness to help save lives.</p>
                    <p>Sincerely,<br>BharatBuys Team</p>
                </body>
            </html>
            ";

                using (SmtpClient smtpClient = new SmtpClient(smtpHost, smtpPort))
                {
                    smtpClient.EnableSsl = true;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);

                    using (MailMessage mailMessage = new MailMessage())
                    {
                        mailMessage.From = new MailAddress(smtpUsername);
                        mailMessage.To.Add(DONOR);
                        mailMessage.Subject = subject;
                        mailMessage.Body = body;
                        mailMessage.IsBodyHtml = true;

                        smtpClient.Send(mailMessage);
                    }
                }
            }
            catch 
            {
                // Log the exception message for debugging purposes
                string errorMessage = $"Email sending error ";
                string errorScript = $"alert('{errorMessage}');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CoverImageErrorScript", errorScript, true);
            }
        }

        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("SearchDonor.aspx");
        }
    }
}