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
            string username = Convert.ToString(Session["username"]);
            if (email != null)
            {
                LblUsername.Text = "Hello " + username + " !";
                if (email == "Admin")
                {
                    Lbl1.Text = "Go to <a href='CustomerInfo.aspx'>Customers</a> section to search customer information.";
                    Lbl2.Text = "Go to <a href='ContactList.aspx'>Contact List</a> section to view list of customers who need contact.";
                    Lbl3.Text = "Go to <a href='ViewSurvey.aspx'>View Survey</a> section to view customers' surveys.";
                }
                else if (email == "Technician")
                {
                    Lbl1.Text = "Go to <a href='CustomerInfo.aspx'>Customers</a> section to search customer information.";
                    Lbl2.Text = "Go to <a href='ContactList.aspx'>Contact List</a> section to view list of customers who need contact.";
                    Lbl3.Text = "Go to <a href='CreateIncident.aspx'>Incidents</a> to search and review client incident reports";
                    Lbl4.Text = "Go to <a href='ViewIncident.aspx'>View Incidents</a> to search and review client incident reports";
                }
                else
                {
                    Lbl1.Text = "Go to <a href='ProfilePage.aspx'>Profile</a> to update your profile.";
                    Lbl2.Text = "Go to <a href='Survey.aspx'>Survey</a> to do survey";
                }
            }
                
            else
                LblUsername.Text = "You must log in first.";
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("LoginForm.aspx");
        }
    }
}