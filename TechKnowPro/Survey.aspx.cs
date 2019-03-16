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
    public partial class Survey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Convert.ToString(Session["user_id"]);
            string query = "SELECT id, user_id FROM Customers WHERE id ='" + id + "'";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(query, DBConnection);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DBConnection.Close();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    lblCustomerID.Text = row["user_id"].ToString();
                    lblCustomerID.
                }
            }
        }
        
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            
        }

        protected void ddlIncident_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}