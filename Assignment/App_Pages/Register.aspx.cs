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
            if (TxtRPass.Text == TxtRConfirmPass.Text)
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
                var cnnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection cnn = new SqlConnection(cnnString))
                {
                    using (SqlCommand cmd = new SqlCommand("insert into [dbo].[User] values(@Username, @UserPassword, @Name, @DOB, @Gender)", cnn))
                    {
                        cmd.Parameters.AddWithValue("Name", TxtRName.Text);
                        cmd.Parameters.AddWithValue("Gender", gender);
                        cmd.Parameters.AddWithValue("DOB", DateTime.Parse(TxtRDOB.Text));
                        cmd.Parameters.AddWithValue("Username", TxtRUsername.Text);
                        cmd.Parameters.AddWithValue("UserPassword", TxtRPass.Text);

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