using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using CapaEntidades;
namespace Presentacion
{
    public partial class frmListadoLibrosXCategorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Int16 idCategoria = Convert.ToInt16(Request.QueryString["idcategorias"]);
                dlsLibros.DataSource = negLibros.Instancia.ListarLibrosXCategoria(idCategoria);
                dlsLibros.DataBind();

                String desc = Request.QueryString["descripcion"];
                lblAutor.Text = desc;

                //Boolean est = Convert.ToBoolean(Request.QueryString["descrip"]);
                //lblEstado.Text = est.ToString();

            }
        }
    }
}