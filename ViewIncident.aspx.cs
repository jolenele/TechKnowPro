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

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            string incident_id = lbxIncidentList.SelectedValue.ToString();
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
                lblValueCustID.Text = dt.Rows[0]["customer_id"].ToString();
                lblValueDateTime.Text = dt.Rows[0]["Report_Date_Time"].ToString();
                lblValueIncident.Text = dt.Rows[0]["incident_number"].ToString();
                lblDescription.Text = dt.Rows[0]["problem_description"].ToString();
                ddlStatus.Text = dt.Rows[0]["status"].ToString();
            }
        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ddlStatus.SelectedValue.ToString() != "default")
            {
                string query = "UPDATE Incidents SET status = '" + ddlStatus.SelectedValue.ToString() + "' WHERE id ='" + lbxIncidentList.SelectedValue + "'";
                SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
                DBConnection.Open();
                SqlCommand cmd = new SqlCommand(query, DBConnection);
                if (Page.IsValid)
                {
                    cmd.ExecuteNonQuery();
                    DBConnection.Close();
                }
                lblError.Text = "";
            }
            else
            {
                lblError.Text = "You must select an eligible Status";
            }
        }
    }
}