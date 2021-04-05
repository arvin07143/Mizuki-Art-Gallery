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
            con.Open();
            SqlCommand cmdOrderID = new SqlCommand("SELECT OrderID FROM [dbo].[Order] ORDER BY OrderID DESC;", con);
            int orderID = Convert.ToInt32(cmdOrderID.ExecuteScalar());
            con.Close();
            lblOrderId.Text= orderID.ToString();

            DateTime orderDate = DateTime.Now;
            lblOrderTime.Text = orderDate.ToString("dd-MM-yyyy");

            DateTime estimatedArriveTime = orderDate.AddDays(7);
            lblEstimatedArriveTime.Text = estimatedArriveTime.ToString("dd-MM-yyyy");

            con.Open();
            SqlCommand cmdDeliveryAddress = new SqlCommand("SELECT DeliveryAddress FROM [dbo].[Order] ORDER BY OrderID DESC;", con);
            lblDeliveryAddress.Text = Convert.ToString(cmdDeliveryAddress.ExecuteScalar());
            con.Close();

            con.Open();
            String strSelectItem = "SELECT Cart.ArtworkID, Art.ArtworkName, Art.Price, Art.URL, Cart.Quantity, Cart.Quantity * Art.Price AS TotalPrice FROM Artwork Art, CartDetails Cart WHERE Art.ArtworkID = Cart.ArtworkID AND Cart.Username= @Username;";
            SqlCommand cmdSelectItem = new SqlCommand(strSelectItem, con);
            cmdSelectItem.Parameters.AddWithValue("@Username", Session["Username"].ToString());
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