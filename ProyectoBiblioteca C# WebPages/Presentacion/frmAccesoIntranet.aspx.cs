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
    public partial class frmAccesoIntranet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Text == String.Empty && txtUsuario.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar el nombre de Usuario";
                return;
            }
            if (txtPassword.Text == String.Empty && txtPassword.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar el Password";
                return;
            }
            try
            {
                entEmpleado c = negEmpleado.Instancia.VerificarAcceso(txtUsuario.Text, txtPassword.Text);
                     if (c != null) {
                         Session["empleado"] = c;
                            Response.Redirect("frmInicioIntranet.aspx");
                    }  
                    else
                    {
                        lblMensaje.Text = "Usuario o Password no Valido";
                    }

            }
            catch (Exception ex)
            {
                Response.Write(@"<script type='text/javascript' language='javascript'>alert('" + ex.Message + "');</script>");
            }
        }
    }
}