using System;
using System.Collections.Generic;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.App_Pages
{
    public partial class ProductDelivery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            
            //lblOrderId.Text= Request.QueryString["OrderID"];

            DateTime orderDate = DateTime.Now;
            lblOrderTime.Text = orderDate.ToString("dd-MM-yyyy");

            DateTime estimatedArriveTime = orderDate.AddDays(7);
            lblEstimatedArriveTime.Text = estimatedArriveTime.ToString("dd-MM-yyyy");

            con.Open();
            SqlCommand cmdDeliveryAddress = new SqlCommand("SELECT DeliveryAddress FROM [dbo].[Order] WHERE OrderID = @OrderID;", con);
            cmdDeliveryAddress.Parameters.AddWithValue("@OrderID", Request.QueryString["OrderID"]);
            lblDeliveryAddress.Text = Convert.ToString(cmdDeliveryAddress.ExecuteScalar());
            con.Close();

            con.Open();       
            String strSelectItem = "SELECT OrderDetails.ArtworkID, Artwork.ArtworkName, Artwork.Price, Artwork.URL, OrderDetails.Quantity, OrderDetails.Quantity * Artwork.Price AS TotalPrice FROM OrderDetails INNER JOIN ARTWORK ON(OrderDetails.ArtworkID = Artwork.ArtworkID) WHERE OrderID = @OrderID;";
            SqlCommand cmdSelectItem = new SqlCommand(strSelectItem, con);
            cmdSelectItem.Parameters.AddWithValue("@OrderID", Request.QueryString["OrderID"]);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelectItem;
            DataTable dt = new DataTable();
            da.Fill(dt);
            Repeater1.DataSource = cmdSelectItem.ExecuteReader();
            Repeater1.DataBind();
            con.Close();

            lblSubtotal.Text = String.Format("{0:0.00}", Convert.ToDouble(Session["TotalPrice"].ToString()));
            lblTax.Text = (Convert.ToDouble(lblSubtotal.Text) * 0.06).ToString();
            lblTotal.Text = String.Format("{0:C2}", (Convert.ToDouble(lblTax.Text) + Convert.ToDouble(lblSubtotal.Text)));
        }
    }
}