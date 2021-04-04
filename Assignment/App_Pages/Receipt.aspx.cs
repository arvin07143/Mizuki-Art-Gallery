using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.App_Pages
{
    public partial class Receipt : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection orderCon = new SqlConnection(strOrderCon);

            lblCityZip.Text = Request.QueryString["ZipCode"] + Request.QueryString["City"] + Request.QueryString["State"];

            orderCon.Open();
            SqlCommand cmdOrder = new SqlCommand("SELECT *, FORMAT([Order].Date, 'dd/MM/yyyy') AS FormattedDate, [User].Name FROM [Order] INNER JOIN [User] ON ([Order].Username = [User].Username) WHERE OrderID = @OrderID;", orderCon);
            cmdOrder.Parameters.AddWithValue("@OrderID", Request.QueryString["OrderID"]);
            SqlDataReader orderDR = cmdOrder.ExecuteReader();
            while (orderDR.Read())
            {
                lblName.Text = orderDR["RecipientName"].ToString();
                lblPaymentType.Text = orderDR["PaymentType"].ToString();
                lblPhone.Text = orderDR["ContactNumber"].ToString();
                lblCardNumber.Text = orderDR["CardNumber"].ToString();
                lblOrderID.Text = orderDR["OrderID"].ToString();
                lblDate.Text = orderDR["FormattedDate"].ToString();
                lblName2.Text = orderDR["Name"].ToString();
            }
            orderCon.Close();

            orderCon.Open();
            SqlCommand cmdGetOrderDetails = new SqlCommand("SELECT OrderDetails.*, Artwork.*, (Artwork.Price * OrderDetails.Quantity) AS TotalPrice FROM OrderDetails INNER JOIN ARTWORK ON (OrderDetails.ArtworkID = Artwork.ArtworkID) WHERE OrderID = @OrderID", orderCon);
            cmdGetOrderDetails.Parameters.AddWithValue("@OrderID", Request.QueryString["OrderID"]);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdGetOrderDetails;
            DataTable dt = new DataTable();
            da.Fill(dt);
            Repeater1.DataSource = cmdGetOrderDetails.ExecuteReader();
            Repeater1.DataBind();            
            orderCon.Close();

            lblSubtotal.Text = String.Format("{0:0.00}", Convert.ToDouble(Session["TotalPrice"].ToString()));
            lblTax.Text = (Convert.ToDouble(lblSubtotal.Text) * 0.06).ToString();
            lblTotal.Text = String.Format("{0:C2}", (Convert.ToDouble(lblTax.Text) + Convert.ToDouble(lblSubtotal.Text)));

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}