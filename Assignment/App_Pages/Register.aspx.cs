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

        protected void loginFormBtn_Click(object sender, EventArgs e)
        {
            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //get connection string
            SqlConnection loginCon = new SqlConnection(con);        //connect
            loginCon.Open();        // Open connection to database

            String strSelectUser = "Select * from [dbo].[User] where Username=@username ";

            SqlCommand cmdSelectUser = new SqlCommand(strSelectUser, loginCon);
            cmdSelectUser.Parameters.AddWithValue("@username", TxtRUsername.Text);
            
            SqlDataReader dtrUser = cmdSelectUser.ExecuteReader();
            if (DateTime.Parse(TxtRDOB.Text) > DateTime.Now)
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
                    using (SqlCommand cmd = new SqlCommand("insert into [dbo].[User] values(@Username, @UserPassword, @Name, @DOB, @Gender,@Email)", cnn))
                    {
                        cmd.Parameters.AddWithValue("@Name", TxtRName.Text);
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        cmd.Parameters.AddWithValue("@DOB", DateTime.Parse(TxtRDOB.Text));
                        cmd.Parameters.AddWithValue("@Username", TxtRUsername.Text);
                        cmd.Parameters.AddWithValue("@UserPassword", TxtRPass.Text);
                        cmd.Parameters.AddWithValue("@Email", TxtREmail.Text);

                        cnn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Redirect("Login.aspx");
                
            }
            else
            {
                lblRegisterOk.Text = "Password not match.";
            }
            

        }
    }
}