using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaEntidades;
using CapaNegocio;

namespace Presentacion
{
    public partial class RegistrarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (txtNombres.Text == String.Empty && txtNombres.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar Nombres";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtApellidos.Text == String.Empty && txtApellidos.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar Apellidos";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtDni.Text == String.Empty && txtDni.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar DNI";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtTelefono.Text == String.Empty && txtTelefono.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar Telefono";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtDireccion.Text == String.Empty && txtDireccion.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar la Dirección";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtCorreo.Text == String.Empty && txtCorreo.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar el Correo";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtUsuario.Text == String.Empty && txtUsuario.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar el Usuario";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtPassword.Text == String.Empty && txtPassword.Text.Equals(""))
            {
                lblMensaje.Text = "Debe ingresar el Password";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                int i = negUsuario.Instancia.RegistrarUsuario(txtNombres.Text, txtApellidos.Text, txtDni.Text, txtTelefono.Text, txtDireccion.Text, txtCorreo.Text, txtUsuario.Text, txtPassword.Text);
                if (i > 0)
                {

                    lblMensaje.Text = "Usted ha sido Registrado Satisfactoriamente";
                    lblMensaje.ForeColor = System.Drawing.Color.Blue;
                    txtNombres.Text = ""; txtApellidos.Text = ""; txtDni.Text = ""; txtTelefono.Text = ""; txtDireccion.Text = ""; txtCorreo.Text = ""; txtUsuario.Text = ""; txtPassword.Text = "";
                }
                else
                {
                    lblMensaje.Text = "Error al Registrarse";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    txtNombres.Text = ""; txtApellidos.Text = ""; txtDni.Text = ""; txtTelefono.Text = ""; txtDireccion.Text = ""; txtCorreo.Text = ""; txtUsuario.Text = ""; txtPassword.Text = "";
                }

            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }
    }
}