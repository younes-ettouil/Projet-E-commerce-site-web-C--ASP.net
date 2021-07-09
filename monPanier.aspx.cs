using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_E_Commerce_Projet
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPanier();
            }
        }
        private void LoadPanier()
        {
            t_article[] cmds = dc.t_article.ToArray();
            var cm = (from s in dc.t_cmd where s.clientID == (int)Session["id_client"] select s.articleID).ToArray();
            object[] tab = new object[cm.Length];

            for (int i = 0; i < cm.Length; i++)
            {
                for (int j = 0; j < cmds.Length; j++)
                {
                    if (cmds[j].id == cm[i])
                    {
                        tab[i] = cmds[j];

                    }
                }
            }

            grd.DataSource = tab;
            grd.DataBind();
        }

        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grd.EditIndex = e.NewEditIndex;
        }

        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id_Article = Convert.ToInt32(grd.DataKeys[e.RowIndex].Value.ToString());
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('are u sure')", true);
            annulerCommand(id_Article);

        }

        private void annulerCommand(int id_Article)
        {
            var stu = (from s in dc.t_cmd where s.articleID == id_Article && s.clientID== (int)Session["id_client"] select s).First();

            dc.t_cmd.DeleteOnSubmit(stu);
            dc.SubmitChanges();

            LoadPanier();
        }

       

    }
}