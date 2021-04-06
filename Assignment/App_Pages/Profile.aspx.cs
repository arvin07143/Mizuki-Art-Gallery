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
                    loadOriginal();
                    DateRangeValidator.MinimumValue = DateTime.Now.AddYears(-100).ToShortDateString();
                    DateRangeValidator.MaximumValue = DateTime.Now.Date.ToShortDateString();

                    String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection cnn = new SqlConnection(con);
                    cnn.Open();
                    try
                    {
                        String getProfilePic = "SELECT Name,ProfileImage,ProfileDesc FROM [User] WHERE [User].Username = @currUsername";
                        SqlCommand cmdGetProfPic = new SqlCommand(getProfilePic, cnn);
                        cmdGetProfPic.Parameters.AddWithValue("@currUsername", Session["username"].ToString());
                        SqlDataReader reader = cmdGetProfPic.ExecuteReader();
                        reader.Read();
                        String profile_pic_path = reader["ProfileImage"].ToString();
                        lblName.Text = reader["Name"].ToString();
                        if (profile_pic_path == "")
                        {
                            profilePic.ImageUrl = "../ProfileImage/empty_avatar.png";
                        }
                        else
                        {
                            profilePic.ImageUrl = profile_pic_path;
                        }
                        
                        txtDsc.Text = reader["ProfileDesc"].ToString();
                    }
                    catch (Exception)
                    {
                        Response.Redirect("~/App_Pages/MainPage.aspx");
                        Response.Write("<script>alert('Page Load Error')</script>");

                    }

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
            txtName.Text = reader["Name"].ToString();
            txtDOB.Text = sourceDate.ToString("yyyy-MM-dd");
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
            }
            catch (Exception)
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

            txtDsc.Enabled = true;
            txtDsc.BorderStyle = BorderStyle.Inset;
            txtDsc.BackColor = Color.White;

            txtDOB.Enabled = true;
            txtDOB.BorderStyle = BorderStyle.Inset;
            txtDOB.BackColor = Color.White;

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
            String editProfile = "UPDATE [dbo].[User] SET [User].[Name] = @newName, [User].[DOB] = @newDOB, [User].[Gender] = @newGender, [User].[Email] = @newEmail, [User].[ProfileDesc] = @newDesc WHERE [User].[Username] = @Username";
            SqlCommand cmdEditProfile = new SqlCommand(editProfile, cnn);

            if (Page.IsValid)
            {
                cmdEditProfile.Parameters.AddWithValue("@Username", Session["username"]);
                cmdEditProfile.Parameters.AddWithValue("@newName", txtName.Text);
                cmdEditProfile.Parameters.AddWithValue("@newDOB", txtDOB.Text);
                cmdEditProfile.Parameters.AddWithValue("@newGender", DropDownList1.SelectedValue);
                cmdEditProfile.Parameters.AddWithValue("@newEmail", txtEmail.Text);
                cmdEditProfile.Parameters.AddWithValue("@newDesc", txtDsc.Text);

                int updated = cmdEditProfile.ExecuteNonQuery();
                cnn.Close();
                viewMode();
                Response.Redirect("~/App_Pages/Profile.aspx");
            }
        }

        protected void viewMode()
        {
            txtName.Enabled = false;
            txtName.CssClass = "";
            txtName.BorderStyle = BorderStyle.None;
            txtName.BackColor = Color.Transparent;

            txtDsc.Enabled = false;
            txtDsc.BorderStyle = BorderStyle.None;
            txtDsc.BackColor = Color.Transparent;

            txtDOB.Enabled = false;
            txtDOB.BorderStyle = BorderStyle.None;
            txtDOB.BackColor = Color.Transparent;

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

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            e.Day.IsSelectable = e.Day.Date <= DateTime.Now;
        }

        protected void saveNewProfileImage(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string filepath = "../ProfileImage/" + imgFile.FileName;

                if (imgFile.HasFile && imgFile.PostedFile != null)
                {
                    // Get the name of the file to upload.
                    string fileName = Server.HtmlEncode(imgFile.FileName);

                    // Get the extension of the uploaded file.
                    string extension = System.IO.Path.GetExtension(fileName);

                    if ((extension == ".jpg") || (extension == ".png") || (extension == ".jpeg") || (extension == ".gif"))
                    {
                        string imagepath = Server.MapPath("~/ProfileImage/" + imgFile.FileName);
                        imgFile.PostedFile.SaveAs(imagepath);

                        String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection cnn = new SqlConnection(con);
                        cnn.Open();
                        String updateProfilePic = "UPDATE [dbo].[User] SET [User].[ProfileImage] = @newProfileImage WHERE [User].[Username] = @Username;";
                        SqlCommand cmdUpdateProfilePic = new SqlCommand(updateProfilePic, cnn);
                        cmdUpdateProfilePic.Parameters.AddWithValue("@newProfileImage", filepath);
                        cmdUpdateProfilePic.Parameters.AddWithValue("@Username", Session["username"].ToString());
                        cmdUpdateProfilePic.ExecuteNonQuery();

                        cnn.Close();
                        profilePic.ImageUrl = filepath;
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid File Type')</script>");
                    }
                }
            }
        }
    }
}