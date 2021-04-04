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
        }
    }
}