using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Assignment.App_Pages
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmdGetURL = new SqlCommand("SELECT TOP 3 [URL] from [Artwork]", con);
            carouselRepeater.DataSource = cmdGetURL.ExecuteReader();
            carouselRepeater.DataBind();
            HtmlGenericControl div = (HtmlGenericControl)carouselRepeater.Items[0].FindControl("carouselItem");
            div.Attributes.Add("class", "carousel-item active");
            con.Close();
        }
        
        
    }
}