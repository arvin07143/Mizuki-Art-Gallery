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

                validationCode = "";
                System.Text.StringBuilder javaScript = new System.Text.StringBuilder();
                string scriptKey = "SuccessMessage";
                javaScript.Append("var userConfirmation = window.confirm('" + "Successfully reset password." + "');\n");
                javaScript.Append("window.location='login.aspx';");

                ClientScript.RegisterStartupScript(this.GetType(), scriptKey, javaScript.ToString(), true);
            }
            else
            {
                System.Text.StringBuilder javaScript = new System.Text.StringBuilder();
                string scriptKey = "ErrorMessage";

                javaScript.Append("var userConfirmation = window.confirm('" + "Wrong validation code." + "');\n");

                ClientScript.RegisterStartupScript(this.GetType(), scriptKey, javaScript.ToString(), true);
            }
            
        }

        protected void getVerificationCode_Click(object sender, EventArgs e)
        {
            String email;
            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //get connection string   
            SqlConnection selectCon = new SqlConnection(con);
            selectCon.Open();
            SqlCommand cmdEmail = new SqlCommand("SELECT Email FROM [dbo].[User] WHERE Username = @Username;", selectCon);
            cmdEmail.Parameters.AddWithValue("@Username", TxtRUsername.Text);
            SqlDataReader dtrUser = cmdEmail.ExecuteReader();

            if (dtrUser.HasRows && TxtRPass.Text == TxtRConfirmPass.Text) {
                selectCon.Close();
                selectCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT Email FROM [dbo].[User] WHERE Username = @Username;", selectCon);
                    
                        
                cmd.Parameters.AddWithValue("@Username", TxtRUsername.Text);
                email = Convert.ToString(cmdEmail.ExecuteScalar());
                selectCon.Close();
                    
                
                                      
                
                if (TxtRUsername.Text != "")
                {
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
                    System.Net.NetworkCredential("mizuki2629@gmail.com", "Mizuki12345");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = basicCredential1;

                    try
                    {
                        client.Send(message);
                        getCodeMsg.Text = "A validation code is successfully sent to your email, pleacele check.";
                    }

                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }


            }
            else if(dtrUser.HasRows == false)
            {
                selectCon.Close();
                System.Text.StringBuilder javaScript = new System.Text.StringBuilder();
                string scriptKey = "ErrorMessage";

                javaScript.Append("var userConfirmation = window.confirm('" + "Username does not exist." + "');\n");

                ClientScript.RegisterStartupScript(this.GetType(), scriptKey, javaScript.ToString(), true);
            }
            
            //else
            //  {
            //      System.Text.StringBuilder javaScript = new System.Text.StringBuilder();
            //      string scriptKey = "ErrorMessage";
            //
            //    javaScript.Append("var userConfirmation = window.confirm('" + "Confirm password does not match." + "');\n");
            //
            //  ClientScript.RegisterStartupScript(this.GetType(), scriptKey, javaScript.ToString(), true);
            //}
        }

        protected void conPassValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(TxtRPass.Text != TxtRConfirmPass.Text)
            {
                args.IsValid = false;
            }
        }
    }
}