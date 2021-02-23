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
            String temp = " ";
            if (!IsPostBack)
            {
                try
                {
                    temp = Context.Items["ArtworkID"].ToString();                   
                }
                catch (NullReferenceException ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                temp = Session["artworkID"].ToString();
                
            }

            Session["artworkID"] = temp;
            HiddenField1.Value = temp;

            String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection orderCon = new SqlConnection(strOrderCon);
 
            //select data to be bound
            orderCon.Open();
            String strSelectItem = "SELECT Artwork.ArtworkName FROM Artwork WHERE (Artwork.ArtworkID = @ArtworkID);";
            SqlCommand cmdSelectItem = new SqlCommand(strSelectItem, orderCon);
            cmdSelectItem.Parameters.AddWithValue("@ArtworkID", temp);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelectItem;
            DataTable dt = new DataTable();
            da.Fill(dt);
            artworkName.DataSource = cmdSelectItem.ExecuteReader();
            artworkName.DataBind();
            orderCon.Close();

            orderCon.Open();
            strSelectItem = "SELECT Artwork.ArtworkName, [User].Name, Artwork.Price, Artwork.StockQuantity FROM Artwork INNER JOIN [User] ON Artwork.Username = [User].Username WHERE (Artwork.ArtworkID = @ArtworkID);";
            cmdSelectItem = new SqlCommand(strSelectItem, orderCon);
            cmdSelectItem.Parameters.AddWithValue("@ArtworkID", temp);
            da = new SqlDataAdapter();
            da.SelectCommand = cmdSelectItem;
            dt = new DataTable();
            da.Fill(dt);
            artworkDescription.DataSource = cmdSelectItem.ExecuteReader();
            artworkDescription.DataBind();
            orderCon.Close();
            
            orderCon.Open();
            strSelectItem = "SELECT URL FROM Artwork WHERE (Artwork.ArtworkID = @ArtworkID);";
            cmdSelectItem = new SqlCommand(strSelectItem, orderCon);
            cmdSelectItem.Parameters.AddWithValue("@ArtworkID", temp);
            da = new SqlDataAdapter();
            da.SelectCommand = cmdSelectItem;
            dt = new DataTable();
            da.Fill(dt);
            imageRepeater.DataSource = cmdSelectItem.ExecuteReader();
            imageRepeater.DataBind();
            orderCon.Close();

            orderCon.Open();
            strSelectItem = "SELECT StockQuantity FROM Artwork WHERE (Artwork.ArtworkID = @ArtworkID);";
            cmdSelectItem = new SqlCommand(strSelectItem, orderCon);
            cmdSelectItem.Parameters.AddWithValue("@ArtworkID", temp);
            SqlDataReader dtrArtwork = cmdSelectItem.ExecuteReader();
            String quantity = "";
            if (dtrArtwork.HasRows)
            {
                while (dtrArtwork.Read())
                {
                    quantity = dtrArtwork["StockQuantity"].ToString();
                }
            }
            else
            {
                quantity = "1";
            }
            Session["quantity"] = quantity;
            orderCon.Close();

            orderCon.Open();
            strSelectItem = "SELECT * FROM CartDetails WHERE (ArtworkID = @ArtworkID) AND (username = @Username);";
            cmdSelectItem = new SqlCommand(strSelectItem, orderCon);
            cmdSelectItem.Parameters.AddWithValue("@ArtworkID", temp);
            cmdSelectItem.Parameters.AddWithValue("@Username", Session["username"].ToString());
            dtrArtwork = cmdSelectItem.ExecuteReader();
            String alreadyInCart = "false";
            if (dtrArtwork.HasRows)
            {
                while (dtrArtwork.Read())
                {
                    alreadyInCart = "true";
                }
            }
            Session["alreadyInCart"] = alreadyInCart;
            orderCon.Close();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection orderCon = new SqlConnection(strOrderCon);
            orderCon.Open();

            if (Session["alreadyInCart"].ToString().Equals("false"))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO CartDetails (Username, ArtworkID, Quantity) VALUES ('" + Session["username"].ToString() + "','" + HiddenField1.Value + "','" + txtQuantity.Text + "')", orderCon);
                cmd.ExecuteNonQuery();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("UPDATE CartDetails SET Quantity =  Quantity + " + txtQuantity.Text + " WHERE ArtworkID = @ArtworkID AND Username = @username;", orderCon);
                cmd.Parameters.AddWithValue("artworkId", Session["artworkID"].ToString());
                cmd.Parameters.AddWithValue("username", Session["username"].ToString());
                cmd.ExecuteNonQuery();
            }
            orderCon.Close();
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {

        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtQuantity.Text);
            if (a > 0)
            {
                a--;
                txtQuantity.Text = Convert.ToString(a);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtQuantity.Text);
            int maxQuantity = Convert.ToInt32(Session["quantity"].ToString()); ; //gonna replace with maxQuantity from database
            if (a < maxQuantity)
            {
                a++;
                txtQuantity.Text = Convert.ToString(a);
            }
        }
    }
}