using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.App_Pages
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                lblName.Text = Session["name"].ToString();
            }
            else
            {
                Response.Redirect("~/App_Pages/Login.aspx");
            }
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

            int updated = cmdAddToCart.ExecuteNonQuery();
            cnn.Close();
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

            Response.Redirect("~/App_Pages/ProfileParameter.aspx");
        }

    }
}