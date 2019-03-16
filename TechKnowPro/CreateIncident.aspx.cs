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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            char[] chars = "0123456789".ToCharArray();
            Random random = new Random();
            string code = "";
            for (int i = 0; i < 4; i++)
            {
                code += chars[random.Next(chars.Length)].ToString();
            }
            txtIncident.Text = code;*/
        
            txtCustomerID.Text = ddlCustomer.SelectedValue.ToString();
            txtDateTime.Text = DateTime.Now.ToString();

            string query = "SELECT incident_number FROM incidents WHERE id = (select MAX(id) from incidents)";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(query, DBConnection);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DBConnection.Close();
            txtIncident.Text = "1000";
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    int num = Convert.ToInt32(row["incident_number"]) + 1;
                    txtIncident.Text = num.ToString();
                }
            }
        }

        protected void btbSubmit_Click(object sender, EventArgs e) 
        {
            string user_id = ddlCustomer.SelectedValue.ToString();
            txtCustomerID.Text = user_id;
            string incidentQuery = "INSERT INTO Incidents(Customer_ID, Report_Date_Time, Incident_number, Status, Problem_Description, Contact_Method, Brief, Product) " +
                "VALUES('" + txtCustomerID.Text + "','" + DateTime.Now + "','" + txtIncident.Text + "','"
                + ddlStatus.SelectedValue.ToString() + "','" + txtDescription.Text + "','" + 
                rblContact.SelectedValue.ToString() + "','" + txtBrief.Text + "','" + txtProduct.Text.ToUpper() + "')";
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}