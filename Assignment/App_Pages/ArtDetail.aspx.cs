using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Assignment.App_Pages
{
    public partial class ArtDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();
                    SqlCommand cmdGetURL = new SqlCommand("SELECT * FROM [Artwork] WHERE ArtworkID=@artId", con);
                    cmdGetURL.Parameters.AddWithValue("@artId", Request.QueryString["ArtworkID"].ToString());
                    SqlDataReader art = cmdGetURL.ExecuteReader();
                    while (art.Read())
                    {
                        artImage.Attributes.Add("src", art["URL"].ToString());
                        artName.Text = art["ArtworkName"].ToString();
                        artistName.Text = art["Username"].ToString();
                        stockQuantity.Text = art["StockQuantity"].ToString();
                        price.Text = String.Format("{0:0.00}", Convert.ToDouble(art["Price"].ToString()));

                    }
                    art.Close();
                    if (Session["username"] != null)
                    {
                        SqlCommand cmdWishlist = new SqlCommand("SELECT * FROM [Favourite] WHERE ArtworkID=@artworkId AND Username=@username", con);
                        cmdWishlist.Parameters.AddWithValue("@artworkId", Request.QueryString["ArtworkID"].ToString());
                        cmdWishlist.Parameters.AddWithValue("@username", Session["username"].ToString());
                        SqlDataReader rdrWishlist = cmdWishlist.ExecuteReader();
                        if (rdrWishlist.HasRows)
                        {
                            btnWishlist.Attributes.Add("style", "display: none");
                            btnWishlistRemove.Attributes.Add("style", "display: block");
                        }
                        rdrWishlist.Close();
                    }
                    con.Close();
            }
        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(txtQuantity.Text);
            if(qty > 1)
            {
                qty -= 1;
                txtQuantity.Text = qty.ToString();
            }
            
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            //int qty = Convert.ToInt32(txtQuantity.Text);
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            //con.Open();
            //SqlCommand cmdGetStock = new SqlCommand("SELECT StockQuantity FROM [Artwork] WHERE ArtworkID=@artId", con);
            //cmdGetStock.Parameters.AddWithValue("@artId", Request.QueryString["ArtworkID"].ToString());
            //int stock = Convert.ToInt32(cmdGetStock.ExecuteScalar());
            //if (qty < stock)
            //{
            //    qty += 1;
            //    txtQuantity.Text = qty.ToString();
            //}
            //con.Close();
            int qty = Convert.ToInt32(txtQuantity.Text);
            int stock = Convert.ToInt32(stockQuantity.Text);
            if (qty < stock)
            {
                qty += 1;
                txtQuantity.Text = qty.ToString();
            }
        }

        protected void btnWishlist_Click(object sender, EventArgs e)
        {
            if(Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmdAddWishlist = new SqlCommand("INSERT INTO Favourite (Username, ArtworkID) VALUES ('" + Session["username"].ToString() + "','" + Request.QueryString["ArtworkID"].ToString() + "')", con);
                cmdAddWishlist.ExecuteNonQuery();
                btnWishlist.Attributes.Add("style", "display: none");
                btnWishlistRemove.Attributes.Add("style", "display: block");
                con.Close();
            }
        }

        protected void btnWishlistRemove_Click(object sender, EventArgs e)
        {
            if(Session["username"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmdRemoveWishlist = new SqlCommand("DELETE FROM Favourite WHERE ArtworkID = @ArtworkID AND Username = @Username;", con);
                cmdRemoveWishlist.Parameters.AddWithValue("@ArtworkID", Request.QueryString["ArtworkID"].ToString());
                cmdRemoveWishlist.Parameters.AddWithValue("@Username", Session["username"].ToString());
                cmdRemoveWishlist.ExecuteNonQuery();
                btnWishlistRemove.Attributes.Add("style", "display: none");
                btnWishlist.Attributes.Add("style", "display: block");
                con.Close();
            }
           
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if(Session["username"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmdIsInCart = new SqlCommand("SELECT * FROM CartDetails WHERE Username=@username AND ArtworkID=@artworkId", con);
                cmdIsInCart.Parameters.AddWithValue("@username", Session["username"].ToString());
                cmdIsInCart.Parameters.AddWithValue("@artworkId", Request.QueryString["ArtworkID"].ToString());
                SqlDataReader rdrCart = cmdIsInCart.ExecuteReader();
                if(!rdrCart.HasRows)
                {
                    SqlCommand cmdAddNewToCart = new SqlCommand("INSERT INTO CartDetails VALUES (@username, @artworkId, @quantity)", con);
                    cmdAddNewToCart.Parameters.AddWithValue("@username", Session["username"].ToString());
                    cmdAddNewToCart.Parameters.AddWithValue("@artworkId", Request.QueryString["ArtworkID"].ToString());
                    cmdAddNewToCart.Parameters.AddWithValue("@quantity", txtQuantity.Text);
                    cmdAddNewToCart.ExecuteNonQuery();


                }
                rdrCart.Close();
                con.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
        }
    }
}