using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_E_Commerce_Projet
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string GetHashedText(string inputData)
        {
            byte[] tmpSource;
            byte[] tmpData;
            tmpSource = System.Text.ASCIIEncoding.ASCII.GetBytes(inputData);
            tmpData = new MD5CryptoServiceProvider().ComputeHash(tmpSource);
            return Convert.ToBase64String(tmpData);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            t_admin[] admins = dc.t_admin.ToArray();
            t_client[] clients = dc.t_client.ToArray();
            Boolean conn = false;


            for (int i = 0; i < admins.Length; i++)
            {

                if (TextEmail.Text == admins[i].email && TextPswd.Text == admins[i].pswd)
                {
                    /*ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('click me')", true);*/
                    conn = true;
                    Session["id"] = admins[i].id;
                    Session["email"] = admins[i].email;
                    Response.Redirect("admin.aspx");

                }
            }
            for (int i = 0; i < clients.Length; i++)
            {

                if (TextEmail.Text == clients[i].email && GetHashedText(TextPswd.Text) == clients[i].pswd)
                {
                   /* ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('click me')", true);*/
                    conn = true;
                    Session["id_client"] = clients[i].id;
                    Session["username"] = clients[i].username;
                    Response.Redirect("home.aspx");

                }
            }




            if (!conn)
            {
                Labelmsg.Text = "email ou password incorrect !!!";
            }
        }
    }
}