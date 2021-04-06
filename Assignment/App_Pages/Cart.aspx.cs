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
                    Session["TotalPrice"] = lblTotalPrice.Text;
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
            Label lblQuantity = (Label)e.Item.FindControl("lblQuantity");
            if (e.CommandName == "delete")
            {
                String strDelCartItem = "DELETE FROM CartDetails WHERE ArtworkID=@artworkId AND Username=@username";
                SqlCommand cmdDelCartItem = new SqlCommand(strDelCartItem, cartItemCon);
                cmdDelCartItem.Parameters.AddWithValue("@artworkId", artworkId);
                cmdDelCartItem.Parameters.AddWithValue("@username", Session["username"].ToString());
                cmdDelCartItem.ExecuteNonQuery();
                cartItemCon.Close();
                Response.Redirect("~/App_Pages/Cart.aspx");
            }
            if (e.CommandName == "minus")
            {
                SqlCommand cmdCheckQtyNve = new SqlCommand("SELECT Quantity FROM CartDetails WHERE ArtworkID=@artworkId AND Username=@username", cartItemCon);
                cmdCheckQtyNve.Parameters.AddWithValue("@artworkId", artworkId);
                cmdCheckQtyNve.Parameters.AddWithValue("@username", Session["username"].ToString());
                int cartItemQty = Convert.ToInt32(cmdCheckQtyNve.ExecuteScalar());
                if(cartItemQty > 1)
                {
                    String strDecreaseCartItem = "UPDATE CartDetails SET Quantity = Quantity-1 WHERE ArtworkID=@artworkId AND Username=@username";
                    SqlCommand cmdDecreaseCartItem = new SqlCommand(strDecreaseCartItem, cartItemCon);
                    cmdDecreaseCartItem.Parameters.AddWithValue("@artworkId", artworkId);
                    cmdDecreaseCartItem.Parameters.AddWithValue("@username", Session["username"].ToString());
                    cmdDecreaseCartItem.ExecuteNonQuery();
                    cartItemCon.Close();
                  
                    int qty = Convert.ToInt32(lblQuantity.Text);
                    qty -= 1;
                    lblQuantity.Text = qty.ToString();
                    Label unitPriceLabel = e.Item.FindControl("lblUnit") as Label;
                    Label subtotalLabel = e.Item.FindControl("lblSubtotal") as Label;
                    subtotalLabel.Text = (Convert.ToDouble(subtotalLabel.Text) - Convert.ToDouble(unitPriceLabel.Text)).ToString();
                    double total = Convert.ToDouble(lblTotalPrice.Text);
                    lblTotalPrice.Text = (total - Convert.ToDouble(unitPriceLabel.Text)).ToString();
                }
                else
                {
                    lblQuantity.Text = "1";
                }
                
            }
            if (e.CommandName == "plus")
            {
                //check qty in cart
                SqlCommand cmdCheckQty = new SqlCommand("SELECT Quantity FROM CartDetails WHERE ArtworkID = @artworkId AND Username = @username", cartItemCon);
                cmdCheckQty.Parameters.AddWithValue("@artworkId", artworkId);
                cmdCheckQty.Parameters.AddWithValue("@username", Session["username"].ToString());
                int cartItemQty = Convert.ToInt32(cmdCheckQty.ExecuteScalar());
                //check stock qty
                SqlCommand cmdCheckMaxQty = new SqlCommand("SELECT [StockQuantity] FROM Artwork WHERE ArtworkID = @artworkId", cartItemCon);
                cmdCheckMaxQty.Parameters.AddWithValue("@artworkId", artworkId);
                int stockQty = Convert.ToInt32(cmdCheckMaxQty.ExecuteScalar());
                if (cartItemQty < stockQty)
                {
                    String strIncreaseCartItem = "UPDATE CartDetails SET Quantity = Quantity+1 WHERE ArtworkID=@artworkId AND Username=@username";
                    SqlCommand cmdIncreaseCartItem = new SqlCommand(strIncreaseCartItem, cartItemCon);
                    cmdIncreaseCartItem.Parameters.AddWithValue("@artworkId", artworkId);
                    cmdIncreaseCartItem.Parameters.AddWithValue("@username", Session["username"].ToString());
                    cmdIncreaseCartItem.ExecuteNonQuery();
                    cartItemCon.Close();
                    int qty = Convert.ToInt32(lblQuantity.Text);
                    qty += 1;
                    lblQuantity.Text = qty.ToString();
                    Label unitPriceLabel = e.Item.FindControl("lblUnit") as Label;
                    Label subtotalLabel = e.Item.FindControl("lblSubtotal") as Label;
                    subtotalLabel.Text = (Convert.ToDouble(unitPriceLabel.Text) + Convert.ToDouble(subtotalLabel.Text)).ToString();
                    double total = Convert.ToDouble(lblTotalPrice.Text);
                    lblTotalPrice.Text = (total + Convert.ToDouble(unitPriceLabel.Text)).ToString();
                }
                else
                {
                    lblQuantity.Text = stockQty.ToString();
                }

            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            //check if the cart is empty
            SqlCommand cmdCartItemCount = new SqlCommand("SELECT COUNT(ArtworkID) FROM CartDetails WHERE Username=@username AND Quantity > 0", con);
            cmdCartItemCount.Parameters.AddWithValue("@username", Session["username"].ToString());
            int cartItemCount = Convert.ToInt32(cmdCartItemCount.ExecuteScalar());
            if (cartItemCount > 0)
            {
                //delete item with 0 quantity
                SqlCommand cmd = new SqlCommand("DELETE FROM CartDetails WHERE Quantity=0 AND Username=@username", con);
                cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
                cmd.ExecuteNonQuery();
                Response.Redirect("~/App_Pages/Checkout.aspx");
            }
            else
            {
                lblError.Text = "You cannot check out with your cart empty.";
            }

        }
    }
}