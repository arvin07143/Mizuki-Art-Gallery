using System;
using System.Collections.Generic;
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

        protected void btnAdd_Click(object sender, ImageClickEventArgs e)
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