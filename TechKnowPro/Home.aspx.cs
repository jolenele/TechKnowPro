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
            string email = Convert.ToString(Session["email"]);
            if (email != null)
            {
                LblUsername.Text = email;
                if (email == "Admin")
                    LblRole.Text = "Go to <a href='CustomerInfo.aspx'>Customers</a> section to search customer information";
                else if (email == "Technician")
                {
                    LblRole.Text = "Go to <a href='CreateIncident.aspx'>Incidents</a> to search and review client incident reports";
                    LblToSurvey.Text = "Go to <a href='ViewIncident.aspx'>View Incidents</a> to search and review client incident reports";
                }
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
            Session.Remove("email");
            Response.Redirect("LoginForm.aspx");
        }
    }
}