using System;
using System.Collections;
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
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                if (Session["username"] != null)
                {
                    String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection orderCon = new SqlConnection(strOrderCon);
                    orderCon.Open();

                    //select data to be bound
                    String strSelectItem = "Select ArtworkName, Art.Price AS PRICE, Cart.Quantity AS Quantity, Cart.Quantity * Art.Price AS TotalPrice, Art.URL AS URL from Artwork Art, [User] u Where Username = u.Username and Art.ArtworkID = @artworkID;";
                    SqlCommand cmdSelectCartItem = new SqlCommand(strSelectItem, orderCon);
                    cmdSelectCartItem.Parameters.AddWithValue("@username", Session["username"].ToString());
                    //SqlDataAdapter da = new SqlDataAdapter();
                    //da.SelectCommand = cmdSelectCartItem;
                    //DataTable dt = new DataTable();
                    //da.Fill(dt);

                    //cartItemRepeater.DataSource = cmdSelectCartItem.ExecuteReader();
                    //cartItemRepeater.DataBind();

                    //String strCartTotal = "Select Cart.Quantity * Art.Price AS TotalPrice from Artwork Art, CartDetails Cart, [User] u Where Cart.Username = u.Username and Cart.Username = @username and Art.ArtworkID = Cart.ArtworkID; ";
                    //SqlCommand cmdCartTotal = new SqlCommand(strCartTotal, cartCon);
                    //cmdCartTotal.Parameters.AddWithValue("@username", Session["username"].ToString());
                    //SqlDataReader dr = cmdCartTotal.ExecuteReader();
                    //decimal Total = Convert.ToDecimal(0.0);
                    //while (dr.Read())
                    //{
                    //    Total = Total + Convert.ToDecimal(dr["TotalPrice"].ToString());
                    //}
                    //lblTotalPrice.Text = Convert.ToString(Total);

                    //cartCon.Close();
                }
                else
                {
                    Response.Redirect("~/App_Pages/Login.aspx");
                }
            }

        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }  

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {

        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtQuantity.Text);
            if (a > 1)
            {
                a--;
                txtQuantity.Text = Convert.ToString(a);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtQuantity.Text);
            int maxQuantity = 5; //gonna replace with maxQuantity from database
            if (a < maxQuantity)
            {
                a++;
                txtQuantity.Text = Convert.ToString(a);
            }
        }
    }
}