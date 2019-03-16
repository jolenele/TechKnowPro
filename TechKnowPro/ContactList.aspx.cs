using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class ContactList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {

        }

        protected void BtbEmptyList_Click(object sender, EventArgs e)
        {
            string query = "DELETE FROM Contacts";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(query, DBConnection);
            cmd.ExecuteNonQuery();
            DBConnection.Close();
        }

        protected void BtbSelectCust_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerInfo.aspx");
        }

        protected void BtbRemoveContact_Click(object sender, EventArgs e)
        {
            string user_id = ContactListBox.SelectedValue.ToString();
            string query = "DELETE FROM Contacts WHERE user_id = '" + user_id + "'";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(query, DBConnection);
            cmd.ExecuteNonQuery();
            DBConnection.Close();
            //ContactListBox
        }
    }
}