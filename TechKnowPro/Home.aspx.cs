using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Convert.ToString(Session["username"]);
            if (username != null)
            {
                LblUsername.Text = username;
                if (Convert.ToString(Session["username"]) == "Admin")
                    LblRole.Text = "Go to Customers section to search customer information";
                if (Convert.ToString(Session["username"]) == "Technician")
                    LblRole.Text = "Go to Incidents to search and review client incident reports";
                else
                {
                    LblRole.Text = "Go to <a href='ProfilePage.aspx'>Profile</a> to update your profile and/or customer information";
                    LblToSurvey.Text = "Go to <a href='Survey.aspx'>Survey</a> to do survey";
                }
            }
                
            else
                LblUsername.Text = "You must log in first.";
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("username");
            Response.Redirect("LoginForm.aspx");
        }
    }
}