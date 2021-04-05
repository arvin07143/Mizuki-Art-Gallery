﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment.App_Pages
{
    public partial class Receipt : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmdOrderID = new SqlCommand("SELECT OrderID FROM [dbo].[Order] ORDER BY OrderID DESC;", con);
            int orderID = Convert.ToInt32(cmdOrderID.ExecuteScalar());
            con.Close();


            con.Open();
            SqlCommand cmdDeliveryAddress = new SqlCommand("SELECT DeliveryAddress FROM [dbo].[Order] ORDER BY OrderID DESC;", con);
            lblDeliveryAddress.Text = Convert.ToString(cmdDeliveryAddress.ExecuteScalar());
            con.Close();


            String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection orderCon = new SqlConnection(strOrderCon);

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
                lblOrderID0.Text = orderDR["OrderID"].ToString();
                lblName2.Text = orderDR["Name"].ToString();
                lblEmail.Text = orderDR["EmailAddress"].ToString();
            }
            orderCon.Close();

            orderCon.Open();
            SqlCommand cmdGetOrderDetails = new SqlCommand("SELECT OrderDetails.*, Artwork.*, (Artwork.Price * OrderDetails.Quantity) AS TotalPrice FROM OrderDetails INNER JOIN ARTWORK ON (OrderDetails.ArtworkID = Artwork.ArtworkID) WHERE OrderID = @OrderID", orderCon);
            cmdGetOrderDetails.Parameters.AddWithValue("@OrderID", Request.QueryString["OrderID"]);
            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmdGetOrderDetails;
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            Repeater1.DataSource = cmdGetOrderDetails.ExecuteReader();
            Repeater1.DataBind();
            orderCon.Close();

            lblSubtotal.Text = String.Format("{0:0.00}", Convert.ToDouble(Session["TotalPrice"].ToString()));
            lblTax.Text = String.Format("{0:0.00}", (Convert.ToDouble(lblSubtotal.Text) * 0.06).ToString());
            lblTotal.Text = String.Format("RM {0:0.00}", (Convert.ToDouble(lblTax.Text) + Convert.ToDouble(lblSubtotal.Text)));

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {


            string to = lblEmail.Text;
            string from = "mizuki2629@gmail.com";
            MailMessage message = new MailMessage(from, to);

            string mailbody = "";
            message.Subject = "Mizuki Gallery - Receipt(OrderID : )" + lblOrderID0.Text;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("mizuki2629@gmail.com", "Password");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            string queryString = "~/App_Pages/ProductDelivery.aspx?OrderID=" + lblOrderID0.Text;
            Response.Redirect(queryString);
        }


    }
}