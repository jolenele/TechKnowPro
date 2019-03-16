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
            
        }

        protected void ddlIncident_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}