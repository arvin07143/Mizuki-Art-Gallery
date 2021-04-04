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
            string orderID = Request.QueryString["orderID"];

            String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection orderCon = new SqlConnection(strOrderCon);

            orderCon.Open();
            String strSelectItem = "SELECT Cart.ArtworkID, Art.ArtworkName, Art.Price, Art.URL, Cart.Quantity, Cart.Quantity * Art.Price AS TotalPrice FROM Artwork Art, CartDetails Cart WHERE Art.ArtworkID = Cart.ArtworkID AND Cart.Username= @Username;";
            SqlCommand cmdSelectItem = new SqlCommand(strSelectItem, orderCon);
            cmdSelectItem.Parameters.AddWithValue("@Username", Session["Username"].ToString());
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelectItem;
            DataTable dt = new DataTable();
            da.Fill(dt);
            Repeater1.DataSource = cmdSelectItem.ExecuteReader();
            Repeater1.DataBind();
            orderCon.Close();

            lblSubtotal.Text = String.Format("{0:0.00}", Convert.ToDouble(Session["TotalPrice"].ToString()));
            lblTax.Text = (Convert.ToDouble(lblSubtotal.Text) * 0.06).ToString();
            lblTotal.Text = String.Format("{0:C2}", (Convert.ToDouble(lblTax.Text) + Convert.ToDouble(lblSubtotal.Text)));

            orderCon.Open();
            SqlConnection orderCont = new SqlConnection(strOrderCon);
            String strSelectAllItem = "SELECT * FROM Order WHERE Username = @Username;";
            SqlCommand cmdSelectAllItem = new SqlCommand(strSelectAllItem, orderCont);
            cmdSelectAllItem.Parameters.AddWithValue("@Username", Session["Username"].ToString());
            SqlDataAdapter daa = new SqlDataAdapter();
            daa.SelectCommand = cmdSelectAllItem;
            DataTable dt1 = new DataTable();
            daa.Fill(dt1);
            orderCont.Close();


        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}