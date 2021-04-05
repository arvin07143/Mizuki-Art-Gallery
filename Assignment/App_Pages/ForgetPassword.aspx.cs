using System;
using System.Collections.Generic;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Assignment.App_Pages
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        static String validationCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void forgetPasssFormBtn_Click(object sender, EventArgs e)
        {
            String txtvalidation = TxtRValidationCode.Text;

            if (txtvalidation.CompareTo(validationCode) == 0)
            {
                String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //get connection string
                SqlConnection forgetPassCon = new SqlConnection(con);        //connect
                forgetPassCon.Open();        // Open connection to database

                String strSelectUser = "Select * from [dbo].[User] where Username=@username";

                SqlCommand cmdSelectUser = new SqlCommand(strSelectUser, forgetPassCon);
                cmdSelectUser.Parameters.AddWithValue("@username", TxtRUsername.Text);

                SqlDataReader dtrUser = cmdSelectUser.ExecuteReader();
                if (dtrUser.HasRows)
                {
                    using (SqlConnection cnn = new SqlConnection(con))
                    {
                        using (SqlCommand cmd = new SqlCommand("UPDATE [dbo].[User] SET UserPassword = @UserPassword where Username=@username", cnn))
                        {
                            cmd.Parameters.AddWithValue("@username", TxtRUsername.Text);
                            cmd.Parameters.AddWithValue("@UserPassword", TxtRPass.Text);
                            

                            cnn.Open();
                            cmd.ExecuteNonQuery();
                            cnn.Close();
                        }
                    }


                }
            }
        }

        protected void getVerificationCode_Click(object sender, EventArgs e)
        {
            TEST.Text = "NO";
            if (TxtRUsername.Text != "")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmdEmail = new SqlCommand("SELECT Email FROM [dbo].[User] WHERE Username = @Username;", con);
                cmdEmail.Parameters.AddWithValue("@Username", TxtRUsername.Text);
                String email = Convert.ToString(cmdEmail.ExecuteScalar());
                con.Close();

                TEST.Text = email;
                string to = email; //To address    
                string from = "pohzy-wp18@student.tarc.edu.my"; //From address    
                MailMessage message = new MailMessage(from, to);

                Random rnd = new Random();
                int v = rnd.Next(1000, 9999);
                validationCode = v.ToString();

                string mailbody = "Your validation code to reset password is " + validationCode;
                message.Subject = "Validation Code";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                System.Net.NetworkCredential basicCredential1 = new
                System.Net.NetworkCredential("pohzy-wp18@student.tarc.edu.my", "yokipoh2048");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}