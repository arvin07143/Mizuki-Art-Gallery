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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                String strCartCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection cartCon = new SqlConnection(strCartCon);
                cartCon.Open();
                //select data to be bound
                String strSelectCartItem = "Select Art.ArtworkName AS ArtworkName, Art.Price AS PRICE, Cart.Quantity AS Quantity, Cart.Quantity * Art.Price AS TotalPrice, Art.URL AS URL from Artwork Art, CartDetails Cart, [User] u Where Cart.Username = u.Username and Cart.Username=@username and Art.ArtworkID = Cart.ArtworkID;";
                SqlCommand cmdSelectCartItem = new SqlCommand(strSelectCartItem, cartCon);
                cmdSelectCartItem.Parameters.AddWithValue("@username", Session["username"].ToString());
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdSelectCartItem;
                DataTable dt = new DataTable();
                da.Fill(dt);

                cartItemRepeater.DataSource = cmdSelectCartItem.ExecuteReader();
                cartItemRepeater.DataBind();
            }
            else
            {
                Response.Redirect("~/App_Pages/Login.aspx");
            }

        }

        
    }
}