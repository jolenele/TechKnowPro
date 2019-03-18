using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class SuccessfulConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["email"] != null)
            {
                string email = Convert.ToString(Request.QueryString["email"]);
                string query = "UPDATE Customers SET email_confirm = '1' WHERE email ='" + email + "'";
                SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
                DBConnection.Open();
                SqlCommand cmd = new SqlCommand(query, DBConnection);
                cmd.ExecuteNonQuery();
                DBConnection.Close();
                Label1.Text = "The account using " + email + " has been confirmed. You are able to login now!";
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginForm.aspx");
        }
    }
}