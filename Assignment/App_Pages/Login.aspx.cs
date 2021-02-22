using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Redirect("~/App_Pages/MainPage.aspx");
            }
        }

        protected void loginFormBtn_Click(object sender, EventArgs e)
        {
            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //get connection string
            SqlConnection loginCon = new SqlConnection(con);        //connect
            loginCon.Open();        // Open connection to database

            String strSelectUser = "Select * from [dbo].[User] where Username=@username and UserPassword=@password";

            SqlCommand cmdSelectUser = new SqlCommand(strSelectUser, loginCon);
            cmdSelectUser.Parameters.AddWithValue("@username", TxtLUsername.Text);
            cmdSelectUser.Parameters.AddWithValue("@password", TxtLPass.Text);
            SqlDataReader dtrUser = cmdSelectUser.ExecuteReader();

            if (dtrUser.HasRows)
            {
                String strSelectName = "Select Name from [dbo].[User] where Username=@username";
                SqlCommand cmdSelectName = new SqlCommand(strSelectName, loginCon);
                cmdSelectName.Parameters.AddWithValue("@username", TxtLUsername.Text);
                Session["username"] = TxtLUsername.Text;
                Session["name"] = cmdSelectName.ExecuteScalar().ToString();
                Response.Redirect("MainPage.aspx");
            }
            else
            {
                lblLoginFail.Text = "Invalid Usernamd or Password";
            }
            //Response.Redirect("MainPage.aspx");
            loginCon.Close();
        }
    }
}