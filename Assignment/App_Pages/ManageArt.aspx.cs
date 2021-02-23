using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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

        }

        protected void btnRemoveStockClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox textStock = (TextBox)item.FindControl("txtStock");
            int a = Int32.Parse(textStock.Text);
            textStock.Text = (--a).ToString();

            Label artLabel = (Label)item.FindControl("lblArtworkID");
            int artID = Int32.Parse(artLabel.Text);

            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String updateStock = "UPDATE [dbo].[Artwork] SET [StockQuantity] = @newStock WHERE [ArtworkID] = @artID";
            SqlCommand cmdUpdateStock = new SqlCommand(updateStock, cnn);
            cmdUpdateStock.Parameters.AddWithValue("@newStock", a);
            cmdUpdateStock.Parameters.AddWithValue("@artID", artID);

            int updated = cmdUpdateStock.ExecuteNonQuery();
            cnn.Close();

        }

        protected void btnAddStockClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            TextBox textStock = (TextBox)item.FindControl("txtStock");
            int a = Int32.Parse(textStock.Text);
            textStock.Text = (++a).ToString();

            Label artLabel = (Label)item.FindControl("lblArtworkID");
            int artID = Int32.Parse(artLabel.Text);

            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String updateStock = "UPDATE [dbo].[Artwork] SET [StockQuantity] = @newStock WHERE [ArtworkID] = @artID";
            SqlCommand cmdUpdateStock = new SqlCommand(updateStock, cnn);
            cmdUpdateStock.Parameters.AddWithValue("@newStock", a);
            cmdUpdateStock.Parameters.AddWithValue("@artID", artID);

            cmdUpdateStock.ExecuteNonQuery();

            cnn.Close();

        }

        protected void addItemFormSubmitClicked(object sender, EventArgs e)
        {
            string artName = formArtName.Text;
            float artPrice = float.Parse(formArtPrice.Text);
            int artQuantity = Int32.Parse(formArtStock.Text);
            string filePath = "../ArtImage/" + imgFile.FileName;

            if (imgFile.HasFile && imgFile.PostedFile != null)
            {
                string imagepath = Server.MapPath("~/ArtImage/") + imgFile.FileName;
                imgFile.PostedFile.SaveAs(imagepath);
            }

            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String updateStock = "INSERT INTO [dbo].[Artwork] VALUES(@ArtworkName,@StockQuantity,@Price,@Username,@URL);";
            SqlCommand cmdUpdateStock = new SqlCommand(updateStock, cnn);
            cmdUpdateStock.Parameters.AddWithValue("@ArtworkName", artName);
            cmdUpdateStock.Parameters.AddWithValue("@StockQuantity", artQuantity);
            cmdUpdateStock.Parameters.AddWithValue("@Price", artPrice);
            cmdUpdateStock.Parameters.AddWithValue("@URL", filePath);
            cmdUpdateStock.Parameters.AddWithValue("@Username", Session["username"].ToString());
            cmdUpdateStock.ExecuteNonQuery();

            cnn.Close();

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
    }
}