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
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    String strCartCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection cartCon = new SqlConnection(strCartCon);
                    cartCon.Open();
                    //select data to be bound
                    String strSelectCartItem = "Select Cart.ArtworkID AS ArtworkID, Art.ArtworkName AS ArtworkName, Art.Price AS PRICE, Cart.Quantity AS Quantity, Cart.Quantity * Art.Price AS TotalPrice, Art.URL AS URL from Artwork Art, CartDetails Cart, [User] u Where Cart.Username = u.Username and Cart.Username=@username and Art.ArtworkID = Cart.ArtworkID;";
                    SqlCommand cmdSelectCartItem = new SqlCommand(strSelectCartItem, cartCon);
                    cmdSelectCartItem.Parameters.AddWithValue("@username", Session["username"].ToString());
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmdSelectCartItem;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    cartItemRepeater.DataSource = cmdSelectCartItem.ExecuteReader();
                    cartItemRepeater.DataBind();

                    String strCartTotal = "Select Cart.Quantity * Art.Price AS TotalPrice from Artwork Art, CartDetails Cart, [User] u Where Cart.Username = u.Username and Cart.Username = @username and Art.ArtworkID = Cart.ArtworkID; ";
                    SqlCommand cmdCartTotal = new SqlCommand(strCartTotal, cartCon);
                    cmdCartTotal.Parameters.AddWithValue("@username", Session["username"].ToString());
                    SqlDataReader dr = cmdCartTotal.ExecuteReader();
                    decimal Total = Convert.ToDecimal(0.0);
                    while (dr.Read())
                    {
                        Total = Total + Convert.ToDecimal(dr["TotalPrice"].ToString());
                    }
                    lblTotalPrice.Text = Convert.ToString(Total);
                    
                    cartCon.Close();
                }
                else
                {
                    Response.Redirect("~/App_Pages/Login.aspx");
                }

            }

        }

        protected void cartItemRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            String strCartItemCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cartItemCon = new SqlConnection(strCartItemCon);
            cartItemCon.Open();
            String artworkId = e.CommandArgument.ToString();
            if (e.CommandName == "delete")
            {
                String strDelCartItem = "DELETE FROM CartDetails WHERE ArtworkID=@artworkId AND Username=@username";
                SqlCommand cmdDelCartItem = new SqlCommand(strDelCartItem, cartItemCon);
                cmdDelCartItem.Parameters.AddWithValue("artworkId", artworkId);
                cmdDelCartItem.Parameters.AddWithValue("username", Session["username"].ToString());
                cmdDelCartItem.ExecuteNonQuery();
                cartItemCon.Close();
                Response.Redirect("~/App_Pages/Cart.aspx");
            }
            if (e.CommandName == "minus")
            {
                String strDecreaseCartItem = "UPDATE CartDetails SET Quantity = Quantity-1 WHERE ArtworkID=@artworkId AND Username=@username";
                SqlCommand cmdDecreaseCartItem = new SqlCommand(strDecreaseCartItem, cartItemCon);
                cmdDecreaseCartItem.Parameters.AddWithValue("artworkId", artworkId);
                cmdDecreaseCartItem.Parameters.AddWithValue("username", Session["username"].ToString());
                cmdDecreaseCartItem.ExecuteNonQuery();
                cartItemCon.Close();
                Response.Redirect("~/App_Pages/Cart.aspx");
            }
            if (e.CommandName == "plus")
            {
                String strIncreaseCartItem = "UPDATE CartDetails SET Quantity = Quantity+1 WHERE ArtworkID=@artworkId AND Username=@username";
                SqlCommand cmdIncreaseCartItem = new SqlCommand(strIncreaseCartItem, cartItemCon);
                cmdIncreaseCartItem.Parameters.AddWithValue("artworkId", artworkId);
                cmdIncreaseCartItem.Parameters.AddWithValue("username", Session["username"].ToString());
                cmdIncreaseCartItem.ExecuteNonQuery();
                cartItemCon.Close();
                Response.Redirect("~/App_Pages/Cart.aspx");
            }
        }

        
    }
}