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
    public partial class ViewIncident : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            string incident_id = rbtnIncidentList.SelectedValue.ToString();
            string query = "SELECT customer_id, Report_Date_Time, Incident_number, Status, Problem_Description FROM Incidents WHERE id ='" + incident_id + "'";
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
                    lblValueCustID.Text = row["customer_id"].ToString();
                    lblValueDateTime.Text = row["Report_Date_Time"].ToString();
                    lblValueIncident.Text = row["incident_number"].ToString();
                    lblDescription.Text = row["problem_description"].ToString();
                    lblValueStatus.Text = row["status"].ToString();
                }
            }
        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            //concat('Incident for Product ', Product, ', ', Status, ', ', Report_Date_Time, ' - ', Brief) as display
        }
    }
}