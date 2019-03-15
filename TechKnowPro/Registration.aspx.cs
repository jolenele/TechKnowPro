using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace TechKnowPro
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            char[] chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWYZ".ToCharArray();
            Random random = new Random();
            string code = "";
            for (int i = 0; i < 6; i++)
            {
                code += chars[random.Next(chars.Length)].ToString();
            }
            TxtUserID.Text = code;
        }
        
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if(AgreementCheck.Checked)
            {
                string inputuserid = TxtUserID.Text;
                string inputfirstname = TxtFirstname.Text;
                string inputlastname = TxtLastname.Text;
                string inputaddress = TxtAddress.Text;
                string inputemail = TxtEmail.Text.ToLower();
                string inputpassword = TxtPassword.Text;
                string inputconfirmpassword = TxtConfirmPassword.Text;
                if(inputconfirmpassword == inputpassword)
                {
                    string registerquery = "INSERT INTO Customers(user_id, first_name, last_name, address, email, password) VALUES('" + inputuserid + "','" + inputfirstname + "','" +  inputlastname + "','" + inputaddress + "','" + inputemail + "','" + inputpassword + "')";
                    SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
                    DBConnection.Open();
                    SqlCommand cmd = new SqlCommand(registerquery, DBConnection);
                    if (Page.IsValid)
                    {
                        cmd.ExecuteNonQuery();
                        DBConnection.Close();
                        MailSend(inputemail);

                        Session["email"] = inputemail;

                        Response.Redirect("SuccessfulRegister.aspx");
                    }
                }
                else
                {
                    errormessage.Text = "Password Confirmation does not match";
                }
            }
            else
            {
                errormessage.Text = "You have to agree with our terms of service";
            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginForm.aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                string inputemail = TxtEmail.Text.ToLower();
                string loginquery = "select * from Customers where email ='" + inputemail + "'";
                SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
                DBConnection.Open();
                SqlCommand cmd = new SqlCommand(loginquery, DBConnection);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DBConnection.Close();
                if (dt.Rows.Count == 0)
                    args.IsValid = true;
                else
                    args.IsValid = false;
                
            }
            catch(IOException e)
            {
               //lblTest.Text  = "This email has been used";
                throw;
            }
        }

        public void MailSend(string email)
        {
            var fromAddress = new MailAddress("techknowpro.gbc@gmail.com", "TechKnowPro");
            var toAddress = new MailAddress(email);
            const string fromPassword = "saobietduoc";
            string url = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + VirtualPathUtility.ToAbsolute("~/SuccessfulConfirmation.aspx");
            const string subject = "Confirmation Email";
            string body = "This email has been used to create an account on TechKnowPro Service. \nClick this link to active your account. \n" +url+"?email="+email;

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }
    }
}