using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Assignment.App_Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void registerFormBtn_Click(object sender, EventArgs e)
        {
            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //get connection string
            SqlConnection loginCon = new SqlConnection(con);        //connect
            loginCon.Open();        // Open connection to database

            String strSelectUser = "Select * from [dbo].[User] where Username=@username ";

            SqlCommand cmdSelectUser = new SqlCommand(strSelectUser, loginCon);
            cmdSelectUser.Parameters.AddWithValue("@username", TxtRUsername.Text);
            
            SqlDataReader dtrUser = cmdSelectUser.ExecuteReader();
            
            
            if (DateTime.Parse(TxtRDOB.Text) > DateTime.Now || DateTime.Parse(TxtRDOB.Text) < DateTime.Now.AddYears(-100))
            {
                lblRegisterOk.Text = "Invalid date.";
            }
            else if (dtrUser.HasRows)
            {
                lblRegisterOk.Text = "Username already exist.";

            }else if (TxtRPass.Text == TxtRConfirmPass.Text)
            {
               
                lblRegisterOk.Text = "";
                char gender = ' ';
                if ((RadioButtonList1.SelectedItem.Text) == ("Male"))
                {
                    gender = 'M';
                }
                else if ((RadioButtonList1.SelectedItem.Text) == ("Female"))
                {
                    gender = 'F';
                }
                
                
                using (SqlConnection cnn = new SqlConnection(con))
                {
                   
                    using (SqlCommand cmdInsertUser = new SqlCommand("insert into [dbo].[User] (Username, UserPassword, Name, DOB, Gender, Email) VALUES(@Username, @UserPassword, @Name, @DOB, @Gender, @Email);", cnn))
                    {
                        cmdInsertUser.Parameters.AddWithValue("@Username", TxtRUsername.Text);
                        cmdInsertUser.Parameters.AddWithValue("@UserPassword", TxtRPass.Text);
                        cmdInsertUser.Parameters.AddWithValue("@Name", TxtRName.Text);
                        cmdInsertUser.Parameters.AddWithValue("@DOB", DateTime.Parse(TxtRDOB.Text));
                        cmdInsertUser.Parameters.AddWithValue("@Gender", gender);
                        cmdInsertUser.Parameters.AddWithValue("@Email", TxtREmail.Text);

                        cnn.Open();
                        cmdInsertUser.ExecuteNonQuery();
                        cnn.Close();
                    }
                }
               


                System.Text.StringBuilder javaScript = new System.Text.StringBuilder();
                string scriptKey = "SuccessMessage";

                javaScript.Append("var userConfirmation = window.confirm('" + "Successfully registerd." + "');\n");
                javaScript.Append("window.location='login.aspx';");

                ClientScript.RegisterStartupScript(this.GetType(), scriptKey, javaScript.ToString(), true);

            }
            else
            {
                lblRegisterOk.Text = "Password not match.";
            }
            loginCon.Close();

        }
       
    }
}