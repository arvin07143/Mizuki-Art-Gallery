using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class ManageArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRemoveStockClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox textStock = (TextBox)item.FindControl("txtStock");
            int a = Int32.Parse(textStock.Text);
            textStock.Text = (--a).ToString();
        }

        protected void btnAddStockClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            TextBox textStock = (TextBox)item.FindControl("txtStock");
            int a = Int32.Parse(textStock.Text);
            textStock.Text = (++a).ToString();
        }

        private void MessageBox(string msg)
        {
            Label lbl = new Label();
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
            Page.Controls.Add(lbl);
        }

        protected void addItemFormSubmitClicked(object sender, EventArgs e)
        {
            string artName = formArtName.Text;
            float artPrice = float.Parse(formArtPrice.Text);
            int artQuantity = Int32.Parse(formArtStock.Text);
            string filePath = "../images/" + imgFile.FileName;

            if (imgFile.HasFile && imgFile.PostedFile != null)
            {
                string imagepath = Server.MapPath("~/images/") + imgFile.FileName;
                imgFile.PostedFile.SaveAs(imagepath);
            }

        }
    }
}