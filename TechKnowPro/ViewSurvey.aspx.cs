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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCustomerID.Text = ddlCustomer.SelectedValue.ToString();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            string survey_id = lbxSurveyList.SelectedValue.ToString();
            string query = "SELECT response_time, technician_efficiency, problem_resolution, comments, contact_to_discuss, contact_method FROM surveys WHERE id ='" + survey_id + "'";
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
                    lblTime.Text = row["response_time"].ToString();
                    lblEfficicency.Text = row["technician_efficiency"].ToString();
                    lblResolution.Text = row["problem_resolution"].ToString();
                    lblContact.Text = row["contact_to_discuss"].ToString();
                    lblMethod.Text = row["contact_method"].ToString();
                    txtComment.Text = row["comments"].ToString();
                }
            }
        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}