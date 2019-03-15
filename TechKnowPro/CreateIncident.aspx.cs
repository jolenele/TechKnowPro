using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                txtCustomerID.Text = ddlCustomer.SelectedValue.ToString();
                txtDateTime.Text = DateTime.Now.ToString("mm:dd:yyy h:mm");
                txtIncident.Text = "100";
            
        }

        protected void btbSubmit_Click(object sender, EventArgs e)
        {
            string user_id = ddlCustomer.SelectedValue.ToString();
            txtCustomerID.Text = user_id;
            string incidentQuery = "INSERT INTO Incidents(Customer_ID, Report_Date_Time, Incident_number, Status, Problem_Description, Contact_Method) " +
                "VALUES('" + user_id + "','" + DateTime.Now.ToString("mm:dd:yyy h:mm") + "','" + txtIncident.Text + "','" 
                + ddlStatus.SelectedValue.ToString() + "','" + txtDescription.Text + "','" + rblContact.SelectedValue.ToString() + "')";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(incidentQuery, DBConnection);
            if (Page.IsValid)
            {
                cmd.ExecuteNonQuery();
                DBConnection.Close();
                Response.Redirect("ViewIncident.aspx");
            }
        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCustomerID.Text = ddlCustomer.SelectedValue.ToString();
        }
    }
}