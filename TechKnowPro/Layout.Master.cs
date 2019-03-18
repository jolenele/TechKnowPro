using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblContentHeader.Text = Page.Title;
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Response.Cookies["Cookie"].Expires = DateTime.Now.AddDays(-1);
            Session.RemoveAll();
            Response.Redirect("LoginForm.aspx");
        }

        protected void btnHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}