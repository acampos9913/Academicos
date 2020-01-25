using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaNegocio;

namespace Presentacion
{
    public partial class frmListadoLibrosXAutores1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Int16 idAutores = Convert.ToInt16(Request.QueryString["idautores"]);
                    dlsAutores.DataSource = negLibros.Instancia.ListarLibrosXAutores(idAutores);
                    dlsAutores.DataBind();

                    String desc = Request.QueryString["descripcion"];
                    lblAut.Text = desc;

                    String cat = Request.QueryString["descrip"];
                    lblCat.Text = cat;

                }
                catch (Exception ex)
                {
                    Response.Write(@"<script languaje='javascript'>alert('" + ex + "');</script>");
                }

            }
        }
    }
}