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
                    LBCustomerInfo.Visible = true;
                    LBContactList.Visible = true;
                    LBViewSurvey.Visible = true;
                }
                else if (email == "Technician")
                {
                    LBCustomerInfo.Visible = true;
                    LBContactList.Visible = true;
                    LBCreateIncident.Visible = true;
                    LBViewIncident.Visible = true;
                }
                else
                {
                    LBProfile.Visible = true;
                    LBSurvey.Visible = true;
                }
            }
                
            else
                LblUsername.Text = "You must log in first.";
        }
        
    }
}