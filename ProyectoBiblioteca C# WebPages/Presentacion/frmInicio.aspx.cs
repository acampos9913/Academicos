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
    public partial class frmInicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            try
            {
                dlsLibros.DataSource = negLibros.Instancia.ListarLibrosTodos();
                dlsLibros.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}