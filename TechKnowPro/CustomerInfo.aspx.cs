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
    public partial class CustomerInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string user_id = CustomerList.SelectedValue.ToString();
            string query = "SELECT email, address, phone FROM Customers WHERE user_id ='" + user_id + "'";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(query, DBConnection);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DBConnection.Close();
            if (dt.Rows.Count > 0)
            {
                LblAddress.Text = dt.Rows[0]["address"].ToString();
                LblPhone.Text = dt.Rows[0]["phone"].ToString();
                LblEmail.Text = dt.Rows[0]["email"].ToString();
            }
        }

        protected void BtbAddToContact_Click(object sender, EventArgs e)
        {
            string user_id = CustomerList.SelectedValue.ToString();
            string query = "SELECT user_id, username, phone, email FROM Customers WHERE user_id ='" + user_id + "'";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd1 = new SqlCommand(query, DBConnection);
            SqlDataAdapter sda = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DBConnection.Close();
            if (dt.Rows.Count > 0)
            {
                string username = dt.Rows[0]["username"].ToString();
                string phone = dt.Rows[0]["phone"].ToString();
                string email = dt.Rows[0]["email"].ToString();
                AddContact(user_id, username, phone, email);
            }
        }

        public void AddContact(string user_id, string username, string phone, string email)
        {
            string addquery = "INSERT INTO Contacts(user_id, username, phone, email) VALUES('" + user_id + "','" + username + "','" + phone + "','" + email + "')";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(addquery, DBConnection);
            cmd.ExecuteNonQuery();
            DBConnection.Close();
        }
    }
}