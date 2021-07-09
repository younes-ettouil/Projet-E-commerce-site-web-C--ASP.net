using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_E_Commerce_Projet
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                String usnm = TextBoxUsnm.Text;
                String email = TextEmail.Text;

                String passwd = GetHashedText(TextPswd.Text);

                var cl = new t_client
                {
                    username = usnm,
                    email = email,
                    pswd = passwd,
                };
                dc.t_client.InsertOnSubmit(cl);
                dc.SubmitChanges();
                clearTB();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('registre Succesfully Welcom"+usnm+" ')", true);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "')", true);
            }
        }

        private void clearTB()
        {
            TextBoxUsnm.Text = "";
            TextEmail.Text = "";
            TextPswd.Text = "";
            TextBoxpswd2.Text = "";
        }

        private string GetHashedText(string inputData)
        {
            byte[] tmpSource;
            byte[] tmpData;
            tmpSource = System.Text.ASCIIEncoding.ASCII.GetBytes(inputData);
            tmpData = new MD5CryptoServiceProvider().ComputeHash(tmpSource);
            return Convert.ToBase64String(tmpData);
        }
    }
}