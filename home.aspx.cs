using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_E_Commerce_Projet
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loafingArticles();
            }
        }
        void loafingArticles()
        {
            GrvHome.DataSource = dc.t_article.ToList();
            GrvHome.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GrvHome_RowCommand(object sender, GridViewCommandEventArgs e)

        {
            /*int idc = Convert.ToInt32(GrvHome.DataKeys[e.RowIndex].Value.ToString());*/
            if (e.CommandName.Equals("add"))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('click me')", true);
            }

        }

        protected void GrvHome_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GrvHome.EditIndex = e.NewEditIndex;

        }

        protected void GrvHome_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id_Article = Convert.ToInt32(GrvHome.DataKeys[e.RowIndex].Value.ToString());

            ajouterCommand(id_Article);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + id_Article + "')", true);
        }

        private void ajouterCommand(int id_Article)
        {
            var id_c = Session["id_client"];

            if (id_c != null)
            {
                var artic = new t_cmd
                {
                    articleID = id_Article,

                    clientID = (int)id_c
                };
                dc.t_cmd.InsertOnSubmit(artic);
               dc.SubmitChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Ajouter au panier avec succès')", true);

            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

  

        protected void Unnamed1_Click(object sender, ImageClickEventArgs e)
        {
          
           
        }

        protected void Unnamed1_Click1(object sender, ImageClickEventArgs e)
        {
            if (Session["id_client"] != null)
            {
                Response.Redirect("monPanier.aspx");
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}