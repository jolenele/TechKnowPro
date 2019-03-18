using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TechKnowPro
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Request.Cookies["Cookie"] != null )
            {
                string inputemail = Request.Cookies["Cookie"].Values["email"];
                string inputpassword = Request.Cookies["Cookie"].Values["password"];
                if (inputemail == "admin@isp.net" && inputpassword == "p@ssword1")
                {
                    Session["email"] = "Admin";
                    Session["username"] = "Admin";
                    Response.Redirect("Home.aspx");
                }
                else if (inputemail == "tech@isp.net" && inputpassword == "p@ssword2")
                {
                    Session["email"] = "Technician";
                    Session["username"] = "Technician";
                    Response.Redirect("Home.aspx");
                }
                else if (inputemail != "admin@isp.net" && inputemail != "tech@isp.net")
                {
                    string loginquery = "select * from Customers where email ='" + inputemail + "' and password ='" + inputpassword + "'";
                    SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
                    DBConnection.Open();
                    SqlCommand cmd = new SqlCommand(loginquery, DBConnection);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    DBConnection.Close();
                    if (dt.Rows.Count == 1)
                    {
                        bool is_active = Convert.ToBoolean(dt.Rows[0]["email_confirm"]);
                        if (is_active == true)
                        {
                            Session["user_id"] = dt.Rows[0]["user_id"].ToString();
                            Session["username"] = dt.Rows[0]["username"].ToString();
                            Session["email"] = dt.Rows[0]["email"].ToString();
                            Session["password"] = dt.Rows[0]["password"].ToString();
                            Session["first_name"] = dt.Rows[0]["first_name"].ToString();
                            Session["last_name"] = dt.Rows[0]["last_name"].ToString();
                            Session["secret_question"] = dt.Rows[0]["secret_question"].ToString();
                            Session["secret_answer"] = dt.Rows[0]["secret_answer"].ToString();
                            Session["address"] = dt.Rows[0]["address"].ToString();
                            Session["phone"] = dt.Rows[0]["phone"].ToString();
                            Response.Redirect("Home.aspx");
                        }
                    }
                }
            }
        }
       
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            bool remember = false;
            if (CbRemember.Checked)
                remember = true;
            HttpCookie Cookie = new HttpCookie("Cookie");
            string inputemail = TxtUsername.Text.ToLower();
            string inputpassword = TxtPassword.Text.ToLower();
            if (inputemail == "admin@isp.net" && inputpassword == "p@ssword1")
            {
                if (remember == true)
                {
                    Cookie.Values["email"] = inputemail;
                    Cookie.Values["password"] = inputpassword;
                    Cookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(Cookie);
                }
                Session["email"] = "Admin";
                Session["username"] = "Admin";
                Response.Redirect("Home.aspx");
            }
            else if(inputemail == "tech@isp.net" && inputpassword == "p@ssword2")
            {
                if (remember == true)
                {
                    Cookie.Values["email"] = inputemail;
                    Cookie.Values["password"] = inputpassword;
                    Cookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(Cookie);
                }
                Session["email"] = "Technician";
                Session["username"] = "Technician";
                Response.Redirect("Home.aspx");
            }
            else if (inputemail != "admin@isp.net" && inputemail != "tech@isp.net")
            {
                string loginquery = "select * from Customers where email ='" + inputemail + "' and password ='" + inputpassword + "'";
                SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
                DBConnection.Open();
                SqlCommand cmd = new SqlCommand(loginquery, DBConnection);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DBConnection.Close();
                if (dt.Rows.Count == 1)
                {
                    bool is_active = Convert.ToBoolean(dt.Rows[0]["email_confirm"]);
                    if (is_active == true)
                    {
                        if (remember == true)
                        {
                            Cookie.Values["email"] = inputemail;
                            Cookie.Values["password"] = inputpassword;
                            Cookie.Expires = DateTime.Now.AddDays(1);
                            Response.Cookies.Add(Cookie);
                        }
                        Session["user_id"] = dt.Rows[0]["user_id"].ToString();
                        Session["username"] = dt.Rows[0]["username"].ToString();
                        Session["email"] = dt.Rows[0]["email"].ToString();
                        Session["password"] = dt.Rows[0]["password"].ToString();
                        Session["first_name"] = dt.Rows[0]["first_name"].ToString();
                        Session["last_name"] = dt.Rows[0]["last_name"].ToString();
                        Session["secret_question"] = dt.Rows[0]["secret_question"].ToString();
                        Session["secret_answer"] = dt.Rows[0]["secret_answer"].ToString();
                        Session["address"] = dt.Rows[0]["address"].ToString();
                        Session["phone"] = dt.Rows[0]["phone"].ToString();
                        Response.Redirect("Home.aspx");
                    }
                    else
                        errormessage.Text = "This account have not been confirmed yet.";
                }
                else
                    errormessage.Text = "Invalid Username or Password.";
            }
            else
            {
                errormessage.Text = "Invalid Username or Password.";
            }
        }
    }
}