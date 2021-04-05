using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.App_Pages
{
    public partial class Try : System.Web.UI.Page
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

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/ReceiptImage/");  //Create a Folder in your Root directory on your solution.
            string fileName = lblOrderID0.Text + ".jpg";
            string imagePath = folderPath + fileName;
            var image = ScreenCapture.CaptureActiveWindow();
            image.Save(imagePath, ImageFormat.Jpeg);

            string to = lblEmail.Text;
            string from = "mizuki2629@gmail.com";
            MailMessage mm = new MailMessage(from, to);
            mm.Subject = "Mizuki Gallery - Receipt(OrderID : " + lblOrderID0.Text + ")";

            AlternateView imgview = AlternateView.CreateAlternateViewFromString("Dear " + lblName2.Text + ", Here Is Your Digital Receipt For Order " + lblOrderID0.Text + ". Thank you!<br/><img src=cid:imgpath>",null, MediaTypeNames.Text.Html);
            LinkedResource lr = new LinkedResource(imagePath);
            lr.ContentId = "imagpath";
            imgview.LinkedResources.Add(lr);
            mm.AlternateViews.Add(imgview);
            mm.Body = lr.ContentId;
           

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            client.UseDefaultCredentials = false;
            System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential("mizuki2629@gmail.com", "Mizuki12345");
            client.EnableSsl = true;
            client.Credentials = basicCredential1;
            client.Send(mm);
    
            string queryString = "~/App_Pages/PurchaseSummary.aspx?OrderID=" + lblOrderID0.Text;
            Response.Redirect(queryString);
        }
    }
}