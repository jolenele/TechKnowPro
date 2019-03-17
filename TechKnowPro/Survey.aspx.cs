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
            TxtCustomerID.Text = id;
        }
        
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt16(lbxIncident.SelectedValue) != 0)
            {
                string contact = "";
                if (ckbContact.Checked == true)
                    contact = "yes";
                else
                    contact = "no";
                string query = "INSERT INTO Surveys(customer_id, incident_id, response_time, technician_efficiency, problem_resolution, comments, contact_to_discuss, contact_method) " +
                    "VALUES('" + TxtCustomerID.Text + "','" + lbxIncident.SelectedValue.ToString() + "','" + rblTime.SelectedValue.ToString() + "','" + rblEfficiency.SelectedValue.ToString() + "','" + rblResolution.SelectedValue.ToString() + "','" +
                    txtComments.Text + "','" + contact + "','" + rblContactMethod.SelectedValue.ToString() + "')";
                string surveyChecked = "UPDATE Incidents SET survey = '" + 1 + "' WHERE id ='" + lbxIncident.SelectedValue + "'";
                SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
                DBConnection.Open();
                SqlCommand cmd = new SqlCommand(query, DBConnection);
                SqlCommand cmd2 = new SqlCommand(surveyChecked, DBConnection);
                if (Page.IsValid)
                {
                    cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    DBConnection.Close();
                    Response.Redirect("SurveyConfirmation.aspx");
                }
            }
            else
            {
                lblError.Text = "You must select one survey to complete!";
            }
        }

        protected void lbxIncident_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(Convert.ToInt16(lbxIncident.SelectedValue) == 0)
            {
                lblError.Text = "You must select one survey to complete!";
            }
            else
            {
                lblError.Text = "";
            }
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