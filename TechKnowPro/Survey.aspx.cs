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
            lblCustomerID.Text = id;
        }
        
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string contact = "";
            if (ckbContact.Checked == true)
                contact = "yes";
            else
                contact = "no";
            string query = "INSERT INTO Surveys(customer_id, incident_id, response_time, technician_efficiency, problem_resolution, comments, contact_to_discuss, contact_method) " +
                "VALUES('" + lblCustomerID.Text + "','" + ddlIncident.SelectedValue.ToString() + "','" + rblTime.SelectedValue.ToString() + "','" + rblEfficiency.SelectedValue.ToString() + "','" + rblResolution.SelectedValue.ToString() + "','" + 
                txtComments.Text + "','" + contact + "','" + rblContactMethod.SelectedValue.ToString() + "')";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(query, DBConnection);
            if (Page.IsValid)
            {
                cmd.ExecuteNonQuery();
                DBConnection.Close();
                Response.Redirect("SurveyConfirmation.aspx");
            }

        }

        protected void ddlIncident_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void ckbContact_CheckedChanged(object sender, EventArgs e)
        {
            if (ckbContact.Checked == true)
                rblContactMethod.Visible = true;
            else
                rblContactMethod.Visible = false;
        }
    }
}