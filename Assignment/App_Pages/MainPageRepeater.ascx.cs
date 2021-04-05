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
    public partial class MainPageRepeater : System.Web.UI.UserControl
    {
        public string displayType = "Trending";

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmdGetURL;
            heading.Text = displayType;

            switch (displayType)
            {
                case "Hot Selling":
                    //Hot Selling
                    cmdGetURL = new SqlCommand("SELECT [User].Name, Artwork.ArtworkID, Artwork.URL, Artwork. ArtworkName FROM Artwork INNER JOIN [User] ON (Artwork.Username = [User].Username) WHERE ArtworkID IN (SELECT TOP 5 OrderDetails.ArtworkID AS TotalQuantity FROM OrderDetails GROUP BY OrderDetails.ArtworkID ORDER BY SUM(OrderDetails.Quantity) DESC) AND Artwork.StockQuantity > 0", con);
                    break;

                case "New Artwork":
                    //New
                    cmdGetURL = new SqlCommand("SELECT [User].Name, Artwork.ArtworkID, Artwork.URL, Artwork. ArtworkName FROM Artwork INNER JOIN [User] ON (Artwork.Username = [User].Username) WHERE ArtworkID IN (SELECT TOP 5 ArtworkID FROM Artwork WHERE StockQuantity > 0 ORDER BY ArtworkID DESC)", con);            
                    break;

                default:
                    heading.CssClass = "h1 text-light mb4";
                    cmdGetURL = new SqlCommand("SELECT [User].Name, Artwork.ArtworkID, Artwork.URL, Artwork. ArtworkName FROM Artwork INNER JOIN [User] ON (Artwork.Username = [User].Username) WHERE ArtworkID IN (SELECT TOP 5 OrderDetails.ArtworkID AS TotalQuantity FROM OrderDetails INNER JOIN [Order] on (OrderDetails.OrderID = [Order].OrderID) WHERE [Order].[Date] > (GETDATE() - 7) GROUP BY OrderDetails.ArtworkID ORDER BY SUM(OrderDetails.Quantity) DESC) AND Artwork.StockQuantity > 0", con);
                    break;
            }

            rpt.DataSource = cmdGetURL.ExecuteReader();
            rpt.DataBind();
            con.Close();
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