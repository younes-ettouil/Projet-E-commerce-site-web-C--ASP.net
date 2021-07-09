using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_E_Commerce_Projet
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadarticle();
                LoadClient();
            }
        }

        private void LoadClient()
        {
            GridViewC.DataSource = dc.t_client.ToList();
            GridViewC.DataBind();
        }

        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {


                String articlee = TextBoxArt.Text;
                String cat = TextBoxCat.Text;
                String img = TextBoxImg.Text;
                float price = float.Parse(TextBoxPrix.Text);

                var artic = new t_article
                {
                    article = articlee,
                    prix = price,
                    categ = cat,
                    imgURL = img
                };
                dc.t_article.InsertOnSubmit(artic);
                dc.SubmitChanges();
                clearTB();
                /*ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('succesfully inserted')", true);
                */
                loadarticle();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "')", true);
            }
        }

        void loadarticle()
        {
            grd.DataSource = dc.t_article.ToList();
            grd.DataBind();
        }
        void clearTB()
        {
            TextBoxArt.Text = "";
            TextBoxPrix.Text = "";
            TextBoxCat.Text = "";
            TextBoxImg.Text = "";

        }

        protected void ButtonUPDT_Click(object sender, EventArgs e)
        {

        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("add"))
            {
                try
                {


                    String articlee = (grd.FooterRow.FindControl("txtArticlefooter") as TextBox).Text;
                    String cat = (grd.FooterRow.FindControl("txtCategfooter") as TextBox).Text;
                    String img = (grd.FooterRow.FindControl("txtimgfooter") as TextBox).Text;
                    float price = float.Parse((grd.FooterRow.FindControl("txtPrixfooter") as TextBox).Text);

                    var artic = new t_article
                    {
                        article = articlee,
                        prix = price,
                        categ = cat,
                        imgURL = img
                    };
                    dc.t_article.InsertOnSubmit(artic);
                    dc.SubmitChanges();
                    clearTB();
                    /*ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('succesfully inserted')", true);
                    */
                    loadarticle();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "')", true);
                }
            }

            else if (e.CommandName.Equals("save"))
            {

                grd.EditIndex = -1;
                loadarticle();

            }



        }

        protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grd.EditIndex = e.NewEditIndex;
            loadarticle();

        }

        protected void grd_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {

                int idc = Convert.ToInt32(grd.DataKeys[e.RowIndex].Value.ToString());
                String articlee = (grd.Rows[e.RowIndex].FindControl("txtArticle") as TextBox).Text;
                String cat = (grd.Rows[e.RowIndex].FindControl("txtCateg") as TextBox).Text;
                String img = (grd.Rows[e.RowIndex].FindControl("txtimg") as TextBox).Text;
                float price = float.Parse((grd.Rows[e.RowIndex].FindControl("txtPrix") as TextBox).Text);

                var stu = (from s in dc.t_article where s.id == idc select s).First();
                stu.article = articlee;
                stu.prix = price;
                stu.categ = cat;
                stu.imgURL = img;
                dc.SubmitChanges();
                grd.EditIndex = -1;
                loadarticle();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "')", true);
            }
        }

        protected void grd_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {



        }

        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                int idc = Convert.ToInt32(grd.DataKeys[e.RowIndex].Value.ToString());


                var stu = (from s in dc.t_article where s.id == idc select s).First();

                dc.t_article.DeleteOnSubmit(stu);
                dc.SubmitChanges();

                loadarticle();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex.Message.ToString() + "')", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void GridViewC_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}