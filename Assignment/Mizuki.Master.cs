using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] != null)
            {
                userProfileLink.InnerHtml = Session["username"].ToString();
                loginNavLink.Attributes.Add("style", "display:none");
                userProfileLink.Attributes.Add("style", "display:block");

            }
            else
            {
                loginNavLink.Attributes.Add("style", "display:block");
                userProfileLink.Attributes.Add("style", "display:none");
            }

        }
    }
}