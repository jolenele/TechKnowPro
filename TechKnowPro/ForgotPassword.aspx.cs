using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            string inputemail = TxtEmail.Text.ToLower();
            string query = "SELECT * FROM Customers WHERE email ='" + inputemail + "'";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(query, DBConnection);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DBConnection.Close();
            if (dt.Rows.Count > 0)
            {
                ResetPassword(inputemail);
                Response.Redirect("SuccessfulResetPassword.aspx");
            }
            else
            {
                errormessage.Text = "This email does not exist.";
            }    
        }

        public string GeneratePassword()
        {
            char[] uppercase = "ABCDEFGHIJKLMNOPQRSTUVWYZ".ToCharArray();
            char[] special = "@$!% *#?&".ToCharArray();
            char[] chars = "0123456789abcdefghijklmnopqrstuvwyz".ToCharArray();
            Random random = new Random();
            string pass1 = uppercase[random.Next(uppercase.Length)].ToString();
            string pass2 = special[random.Next(special.Length)].ToString();
            string pass3 = "";
            for (int i = 0; i < 10; i++)
            {
                pass3 += chars[random.Next(chars.Length)].ToString();
            }
            string new_password = pass1 + pass2 + pass3;
            return new_password;
        }

        public void ResetPassword(string email)
        {
            string mail = email;
            string new_password = GeneratePassword();
            string query = "UPDATE Customers SET password='" + new_password + "' WHERE email ='" + mail + "'";
            SqlConnection DBConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Customers.mdf;Integrated Security=True");
            DBConnection.Open();
            SqlCommand cmd = new SqlCommand(query, DBConnection);
            cmd.ExecuteNonQuery();
            DBConnection.Close();
            SendEmail(mail, new_password);
        }

        public void SendEmail(string email, string new_password)
        {
            var fromAddress = new MailAddress("techknowpro.gbc@gmail.com", "TechKnowPro");
            var toAddress = new MailAddress(email);
            const string fromPassword = "saobietduoc";
            const string subject = "ResetPassword Email";
            string body = "Dear " + email + " !" + "\nWe received a request to reset the password of the account using this email. \nYour new password is: " + new_password + ".";

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