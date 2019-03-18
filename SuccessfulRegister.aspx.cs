using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class SuccessfulRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Label1.Text = "An account using " + Session["email"] + " has been successfully registred.";
            Label2.Text = "An confirmation email also has been sent to " + Session["email"] + ". You have to active your account to login.";
        }

        protected void BtnGoBack_Click(object sender, EventArgs e)
        {
            Session.Remove("email");
            Response.Redirect("LoginForm.aspx");
        }
    }
}