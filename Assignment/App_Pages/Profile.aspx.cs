using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Assignment.App_Pages
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                if (!Page.IsPostBack)
                {
                    lblName.Text = Session["name"].ToString();
                    loadOriginal();
                }
            }
            else
            {
                Response.Redirect("~/App_Pages/Login.aspx");
            }
        }

        protected void loadOriginal()
        {
            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String getProfileData = "SELECT Name, DOB, Gender, Email FROM [User] WHERE [User].Username = @currUsername";
            SqlCommand cmdGetProfileData = new SqlCommand(getProfileData, cnn);
            cmdGetProfileData.Parameters.AddWithValue("@currUsername", Session["username"].ToString());
            SqlDataReader reader = cmdGetProfileData.ExecuteReader();
            reader.Read();
            DateTime sourceDate = (DateTime)reader["DOB"];
            Calendar1.SelectedDate = sourceDate;
            Calendar1.VisibleDate = sourceDate;
            txtName.Text = reader["Name"].ToString();
            txtDOB.Text = String.Format("{0:dd/MMMM/yyyy}", sourceDate);
            txtGender.Text = reader["Gender"].ToString();
            txtEmail.Text = reader["Email"].ToString();
        }

        protected void btnAddToCart(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            Label artImage = (Label)item.FindControl("lblArtworkID");
            int artID = Int32.Parse(artImage.Text);

            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String addToCart = "INSERT INTO [dbo].[CartDetails] VALUES(@Username,@ArtworkID,@Quantity);";
            SqlCommand cmdAddToCart = new SqlCommand(addToCart, cnn);
            cmdAddToCart.Parameters.AddWithValue("@Username", Session["username"]);
            cmdAddToCart.Parameters.AddWithValue("@ArtworkID", artID);
            cmdAddToCart.Parameters.AddWithValue("@Quantity", 1);
            try
            {
                int updated = cmdAddToCart.ExecuteNonQuery();
                cnn.Close();
            } catch (Exception)
            {

            }      
        }

        protected void btnDeleteFav(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            Label artImage = (Label)item.FindControl("lblArtworkID");
            int artID = Int32.Parse(artImage.Text);

            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String deleteFav = "DELETE FROM [dbo].[Favourite] WHERE [Favourite].[Username] = @Username AND [Favourite].[ArtworkID] = @ArtworkID;";
            SqlCommand cmdDeleteFav = new SqlCommand(deleteFav, cnn);
            cmdDeleteFav.Parameters.AddWithValue("@Username", Session["username"]);
            cmdDeleteFav.Parameters.AddWithValue("@ArtworkID", artID);

            int updated = cmdDeleteFav.ExecuteNonQuery();
            cnn.Close();

            Response.Redirect("~/App_Pages/Profile.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtName.Enabled = true;
            txtName.CssClass = "form-control";
            txtName.BorderStyle = BorderStyle.Inset;
            txtName.BackColor = Color.White;

            Calendar1.Visible = true;
            txtDOB.Visible = false;
            DropDownList1.Visible = true;
            txtGender.Visible = false;

            txtEmail.Enabled = true;
            txtEmail.CssClass = "form-control";
            txtEmail.BorderStyle = BorderStyle.Inset;
            txtEmail.BackColor = Color.White;

            btnSave.Visible = true;
            btnCancel.Visible = true;
            btnEdit.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String editProfile = "UPDATE [dbo].[User] SET [User].[Name] = @newName, [User].[DOB] = @newDOB, [User].[Gender] = @newGender, [User].[Email] = @newEmail WHERE [User].[Username] = @Username";
            SqlCommand cmdEditProfile = new SqlCommand(editProfile, cnn);

            if (Page.IsValid)
            {
                cmdEditProfile.Parameters.AddWithValue("@Username", Session["username"]);
                cmdEditProfile.Parameters.AddWithValue("@newName", txtName.Text);
                cmdEditProfile.Parameters.AddWithValue("@newDOB", Calendar1.SelectedDate.ToString());
                cmdEditProfile.Parameters.AddWithValue("@newGender", DropDownList1.SelectedValue);
                cmdEditProfile.Parameters.AddWithValue("@newEmail", txtEmail.Text);

                int updated = cmdEditProfile.ExecuteNonQuery();
                cnn.Close();
                viewMode();

            }
        }

        protected void viewMode()
        {
            txtName.Enabled = false;
            txtName.CssClass = "";
            txtName.BorderStyle = BorderStyle.None;
            txtName.BackColor = Color.Transparent;

            Calendar1.Visible = false;
            txtDOB.Visible = true;
            DropDownList1.Visible = false;
            txtGender.Visible = true;

            txtEmail.Enabled = true;
            txtEmail.CssClass = "";
            txtEmail.BorderStyle = BorderStyle.None;
            txtEmail.BackColor = Color.Transparent;

            btnSave.Visible = false;
            btnCancel.Visible = false;
            btnEdit.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            loadOriginal();
            viewMode();
        }
    }
}