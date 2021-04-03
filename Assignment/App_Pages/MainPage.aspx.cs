﻿using System;
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
            if (!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmdGetURL = new SqlCommand("SELECT TOP 5 [URL], [ArtworkName], [ArtworkID] from [Artwork]", con);
                carouselRepeater.DataSource = cmdGetURL.ExecuteReader();
                carouselRepeater.DataBind();
                HtmlGenericControl div = (HtmlGenericControl)carouselRepeater.Items[0].FindControl("carouselItem");
                div.Attributes.Add("class", "carousel-item active");

                cmdGetURL = new SqlCommand("SELECT TOP 6 ArtworkID, ArtworkName, Username, URL FROM [Artwork]", con);
                rptTrending.DataSource = cmdGetURL.ExecuteReader();
                rptTrending.DataBind();

                cmdGetURL = new SqlCommand("SELECT TOP 6 ArtworkID, ArtworkName, Username, URL FROM [Artwork]", con);
                rptHotSelling.DataSource = cmdGetURL.ExecuteReader();
                rptHotSelling.DataBind();

                cmdGetURL = new SqlCommand("SELECT TOP 6 ArtworkID, ArtworkName, Username, URL FROM [Artwork]", con);
                rptNewArt.DataSource = cmdGetURL.ExecuteReader();
                rptNewArt.DataBind();
                con.Close();


            }
        }

        protected void SlideImg_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton lnkRowSelection = (ImageButton)sender;
            //Get the id from command argumen tof linkbutton
            string artworkID = lnkRowSelection.CommandArgument.ToString();
            
            Response.Redirect("~/App_Pages/ArtDetail.aspx?ArtworkID=" + artworkID);
        }
    }
}