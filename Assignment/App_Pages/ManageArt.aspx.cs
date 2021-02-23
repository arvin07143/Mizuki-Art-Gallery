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

            //TODO : SQL
        }

        protected void btnAddStockClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            TextBox textStock = (TextBox)item.FindControl("txtStock");
            int a = Int32.Parse(textStock.Text);
            textStock.Text = (++a).ToString();

            //TODO : SQL
        }

        protected void addItemFormSubmitClicked(object sender, EventArgs e)
        {
            string artName = formArtName.Text;
            float artPrice = float.Parse(formArtPrice.Text);
            int artQuantity = Int32.Parse(formArtStock.Text);
            string filePath = "../artImages/" + imgFile.FileName;

            if (imgFile.HasFile && imgFile.PostedFile != null)
            {
                string imagepath = Server.MapPath("~/artImages/") + imgFile.FileName;
                imgFile.PostedFile.SaveAs(imagepath);
            }

            //TODO : SQL

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (sender is Repeater rptDemo && rptDemo.Items.Count < 1)
            {
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    // Show the Error Label (if no data is present).
                    Label lblErrorMsg = e.Item.FindControl("lblErrorMsg") as Label;
                    if (lblErrorMsg != null)
                    {
                        lblErrorMsg.Visible = true;
                    }
                }
            }
        }
    }
}