using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Assignment.App_Pages
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                //SqlCommand cmdGetURL = new SqlCommand("SELECT TOP 5 [URL], [ArtworkName], [ArtworkID] from [Artwork] WHERE StockQuantity > 0", con);
                SqlCommand cmdGetURL = new SqlCommand("SELECT Artwork.ArtworkID, Artwork.URL, Artwork. ArtworkName FROM Artwork WHERE ArtworkID IN (SELECT TOP 5 OrderDetails.ArtworkID AS TotalQuantity FROM OrderDetails GROUP BY OrderDetails.ArtworkID ORDER BY SUM(OrderDetails.Quantity) DESC) AND Artwork.StockQuantity > 0", con);
                carouselRepeater.DataSource = cmdGetURL.ExecuteReader();
                carouselRepeater.DataBind();
                HtmlGenericControl div = (HtmlGenericControl)carouselRepeater.Items[0].FindControl("carouselItem");
                div.Attributes.Add("class", "carousel-item active");

                //cmdGetURL = new SqlCommand("SELECT [User].Name, Artwork.ArtworkID, Artwork.URL, Artwork. ArtworkName FROM Artwork INNER JOIN [User] ON (Artwork.Username = [User].Username) WHERE ArtworkID IN (SELECT TOP 5 OrderDetails.ArtworkID AS TotalQuantity FROM OrderDetails INNER JOIN [Order] on (OrderDetails.OrderID = [Order].OrderID) WHERE (GETDATE() - [Order].Date) BETWEEN 0 AND 7 GROUP BY OrderDetails.ArtworkID ORDER BY SUM(OrderDetails.Quantity) DESC) AND Artwork.StockQuantity > 0", con);
                cmdGetURL = new SqlCommand("SELECT [User].Name, Artwork.ArtworkID, Artwork.URL, Artwork. ArtworkName FROM Artwork INNER JOIN [User] ON (Artwork.Username = [User].Username) WHERE ArtworkID IN (SELECT TOP 5 OrderDetails.ArtworkID AS TotalQuantity FROM OrderDetails GROUP BY OrderDetails.ArtworkID ORDER BY SUM(OrderDetails.Quantity) DESC) AND Artwork.StockQuantity > 0", con);
                rptTrending.DataSource = cmdGetURL.ExecuteReader();
                rptTrending.DataBind();

                cmdGetURL = new SqlCommand("SELECT [User].Name, Artwork.ArtworkID, Artwork.URL, Artwork. ArtworkName FROM Artwork INNER JOIN [User] ON (Artwork.Username = [User].Username) WHERE ArtworkID IN (SELECT TOP 5 OrderDetails.ArtworkID AS TotalQuantity FROM OrderDetails GROUP BY OrderDetails.ArtworkID ORDER BY SUM(OrderDetails.Quantity) DESC) AND Artwork.StockQuantity > 0", con);
                rptHotSelling.DataSource = cmdGetURL.ExecuteReader();
                rptHotSelling.DataBind();

                cmdGetURL = new SqlCommand("SELECT [User].Name, Artwork.ArtworkID, Artwork.URL, Artwork. ArtworkName FROM Artwork INNER JOIN [User] ON (Artwork.Username = [User].Username) WHERE ArtworkID IN (SELECT TOP 5 OrderDetails.ArtworkID AS TotalQuantity FROM OrderDetails GROUP BY OrderDetails.ArtworkID ORDER BY SUM(OrderDetails.Quantity) ASC) AND Artwork.StockQuantity > 0", con);
                rptNewArt.DataSource = cmdGetURL.ExecuteReader();
                rptNewArt.DataBind();
                con.Close();


            }
        }

        protected void SlideImg_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton lnkRowSelection = (ImageButton)sender;
            //Get the id from command argumen tof linkbutton
            string artworkID = lnkRowSelection.CommandArgument.ToString();
            
            Response.Redirect("~/App_Pages/ArtDetail.aspx?ArtworkID=" + artworkID);
        }
    }
}