using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class ManageArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] == null)
            {
                Response.Redirect("~/App_Pages/Login.aspx");
            } else
            {
                if (!Page.IsPostBack)
                {
                    String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection cnn = new SqlConnection(con);
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[ArtCategory]", cnn);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    formArtCategory.DataSource = dt;
                    formArtCategory.DataTextField = "CategoryName";
                    formArtCategory.DataValueField = "CategoryID";
                    formArtCategory.DataBind();
                }
            }
        }

        protected void addItemFormSubmitClicked(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string artName = formArtName.Text;
                float artPrice = float.Parse(formArtPrice.Text);
                int artQuantity = Int32.Parse(formArtStock.Text);
                string filePath = "../ArtImage/" + imgFile.FileName;

                if (imgFile.HasFile && imgFile.PostedFile != null)
                {
                    // Get the name of the file to upload.
                    string fileName = Server.HtmlEncode(imgFile.FileName);

                    // Get the extension of the uploaded file.
                    string extension = System.IO.Path.GetExtension(fileName);

                    if((extension == ".jpg") || (extension == ".png"))
                    {
                        string imagepath = Server.MapPath("~/ArtImage/") + imgFile.FileName;
                        imgFile.PostedFile.SaveAs(imagepath);

                        String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection cnn = new SqlConnection(con);
                        cnn.Open();
                        String updateStock = "INSERT INTO [dbo].[Artwork] VALUES(@ArtworkName,@StockQuantity,@Price,@Username,@URL,@CategoryID);";
                        SqlCommand cmdUpdateStock = new SqlCommand(updateStock, cnn);
                        cmdUpdateStock.Parameters.AddWithValue("@ArtworkName", artName);
                        cmdUpdateStock.Parameters.AddWithValue("@StockQuantity", artQuantity);
                        cmdUpdateStock.Parameters.AddWithValue("@Price", artPrice);
                        cmdUpdateStock.Parameters.AddWithValue("@URL", filePath);
                        cmdUpdateStock.Parameters.AddWithValue("@Username", Session["username"].ToString());
                        cmdUpdateStock.Parameters.AddWithValue("@CategoryID", Int32.Parse(formArtCategory.SelectedValue));
                        cmdUpdateStock.ExecuteNonQuery();

                        cnn.Close();
                        Repeater1.DataBind();
                        Response.Redirect("~/App_Pages/ManageArt.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid File Type')</script>");
                    }
                }
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (sender is Repeater rptDemo && rptDemo.Items.Count < 1)
            {
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    // Show the Error Label (if no data is present).
                    Label lblErrorMsg = e.Item.FindControl("lblErrorMsg") as Label;
                    if (lblErrorMsg != null)
                    {
                        lblErrorMsg.Visible = true;
                    }
                }
            }
        }

        protected void btnDeleteImage_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            Label artLabel = (Label)item.FindControl("lblArtworkID");
            int artID = Int32.Parse(artLabel.Text);

            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String deleteArt = "DELETE FROM [dbo].[Artwork] WHERE [ArtworkID] = @artID";
            SqlCommand cmdUpdateStock = new SqlCommand(deleteArt, cnn);
            cmdUpdateStock.Parameters.AddWithValue("@artID", artID);

            cmdUpdateStock.ExecuteNonQuery();

            cnn.Close();
            Repeater1.DataBind();
        }

        protected void btnEditImage_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox artName = (TextBox)item.FindControl("artName");
            TextBox artPrice = (TextBox)item.FindControl("artPrice");
            TextBox artQty = (TextBox)item.FindControl("txtStock");
            Label artCat = (Label)item.FindControl("lblCategory");

            LinkButton btnSave = (LinkButton)item.FindControl("btnSaveImage");
            LinkButton btnCancel = (LinkButton)item.FindControl("btnCancelEdit");
            LinkButton btnDel = (LinkButton)item.FindControl("btnDeleteImage");

            DropDownList ddlCategory = (DropDownList)item.FindControl("ddlCat");
            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[ArtCategory]", cnn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataBind();

            artName.Enabled = true;
            artName.BorderStyle = BorderStyle.Inset;
            artName.BackColor = Color.White;

            artPrice.Enabled = true;
            artPrice.BorderStyle = BorderStyle.Inset;
            artPrice.BackColor = Color.White;

            artQty.Enabled = true;
            artQty.BorderStyle = BorderStyle.Inset;
            artQty.BackColor = Color.White;

            artCat.Visible = false;
            ddlCategory.Visible = true;

            btnSave.Visible = true;
            btnCancel.Visible = true;
            btnDel.Visible = true;
            btn.Visible = false;

        }

        protected void btnSaveImage_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                LinkButton btn = (LinkButton)sender;
                RepeaterItem item = (RepeaterItem)btn.NamingContainer;

                String artID = ((Label)item.FindControl("lblArtworkID")).Text;
                TextBox artName = (TextBox)item.FindControl("artName");
                TextBox artPrice = (TextBox)item.FindControl("artPrice");
                TextBox artQty = (TextBox)item.FindControl("txtStock");

                Label artCat = (Label)item.FindControl("lblCategory");
                DropDownList ddlCategory = (DropDownList)item.FindControl("ddlCat");

                LinkButton btnEdit = (LinkButton)item.FindControl("btnEditImage");
                LinkButton btnCancel = (LinkButton)item.FindControl("btnCancelEdit");
                LinkButton btnDel = (LinkButton)item.FindControl("btnDeleteImage");

                artName.Enabled = false;
                artName.BorderStyle = BorderStyle.None;
                artName.BackColor = Color.Transparent;

                artPrice.Enabled = false;
                artPrice.BorderStyle = BorderStyle.None;
                artPrice.BackColor = Color.Transparent;

                artQty.Enabled = false;
                artQty.BorderStyle = BorderStyle.None;
                artQty.BackColor = Color.Transparent;

                btnEdit.Visible = true;
                btnCancel.Visible = false;
                btnDel.Visible = false;
                btn.Visible = false;

                ddlCategory.Visible = false;
                artCat.Visible = true;

                String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection cnn = new SqlConnection(con);
                cnn.Open();
                String editArt = "UPDATE [dbo].[Artwork] SET [Artwork].[ArtworkName] = @newName, [Artwork].[StockQuantity] = @newQty, [Artwork].[Price] = @newPrice, [Artwork].[CategoryID] = @newCategory WHERE [Artwork].[ArtworkID] = @artID";
                SqlCommand cmdEditArt = new SqlCommand(editArt, cnn);
                cmdEditArt.Parameters.AddWithValue("@newName", artName.Text);
                cmdEditArt.Parameters.AddWithValue("@newQty", Int32.Parse(artQty.Text));
                cmdEditArt.Parameters.AddWithValue("@newPrice", Double.Parse(artPrice.Text));
                cmdEditArt.Parameters.AddWithValue("@newCategory", ddlCategory.SelectedValue);
                cmdEditArt.Parameters.AddWithValue("@artID", Int32.Parse(artID));
                int updated = cmdEditArt.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("~/App_Pages/ManageArt.aspx");
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox artName = (TextBox)item.FindControl("artName");
            TextBox artPrice = (TextBox)item.FindControl("artPrice");
            TextBox artQty = (TextBox)item.FindControl("txtStock");

            Label artCat = (Label)item.FindControl("lblCategory");
            DropDownList ddlCategory = (DropDownList)item.FindControl("ddlCat");

            LinkButton btnEdit = (LinkButton)item.FindControl("btnEditImage");
            LinkButton btnSave = (LinkButton)item.FindControl("btnSaveImage");
            LinkButton btnDel = (LinkButton)item.FindControl("btnDeleteImage");

            artName.Enabled = false;
            artName.BorderStyle = BorderStyle.None;
            artName.BackColor = Color.Transparent;

            artPrice.Enabled = false;
            artPrice.BorderStyle = BorderStyle.None;
            artPrice.BackColor = Color.Transparent;

            artQty.Enabled = false;
            artQty.BorderStyle = BorderStyle.None;
            artQty.BackColor = Color.Transparent;

            btnEdit.Visible = true;
            btnSave.Visible = false;
            btnDel.Visible = false;
            btn.Visible = false;

            ddlCategory.Visible = false;
            artCat.Visible = true;

            Repeater1.DataBind();
        }
    }
}