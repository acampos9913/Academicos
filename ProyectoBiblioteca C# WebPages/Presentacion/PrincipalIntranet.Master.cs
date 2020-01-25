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
    public partial class PrincipalIntranet : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["empleado"] != null)
                {
                    entEmpleado c = (entEmpleado)Session["empleado"];
                    lblNombres.Text = c.EmpleadosNombres;
                    lblNombre.Text = c.EmpleadosNombres;
                    lblApellido.Text = c.EmpleadosApellidos;
                    lblApellidos.Text = c.EmpleadosApellidos;
                    lblCodigo.Text = c.EmpleadosCodigo.ToString();
                }
            }
        }
    }
}