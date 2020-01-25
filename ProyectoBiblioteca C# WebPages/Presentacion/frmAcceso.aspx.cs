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
    public partial class frmAcceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["Contador"] = 0;
                if (Session["cliente"] != null)
                {
                    Response.Redirect("frmInicio.aspx");
                }
            }
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
                entUsuario c = negUsuario.Instancia.VerificarAcceso(txtUsuario.Text, txtPassword.Text);
                DateTime fecha = DateTime.Today;
                //& c.EntregaEstado.Equals("No entregado")
                if (c != null)
                {
                    if (c.UsuarioEstado.Equals(true))
                    {
                        if (c.PermisoUsuarioFecha > fecha)
                        {
                            if (c.EntregaFechaLimite < fecha & c.EntregaEstado.Equals("No entregado"))
                            {
                                lblMensaje.Text = "Usted no puede Acceder por mantener libros pendientes a devolver vencidos a la fecha";
                                return;
                            }
                            else
                            {
                                Session["cliente"] = c;
                                Response.Redirect("frmInicio.aspx");
                            }
                        }
                        else
                        {
                            lblMensaje.Text = "Usted no puede Acceder por que se vencio su permiso";
                            return;
                        }
                    }
                    else
                    {
                        lblMensaje.Text = "Usted no puede Acceder por estar inactivo";
                        return;
                        
                    }
                }
                else
                {
                    ViewState["Contador"] = (int)ViewState["Contador"] + 1;

                    if ((int)ViewState["Contador"] == 3)
                    {
                        int u = negUsuario.Instancia.actualizaEstado(txtUsuario.Text);
                        if (u == 1)
                        {
                            lblMensaje.Text = "Usted ha sido desactivo por haber tenido 3 intentos fallidos ";
                        }
                    }
                    else
                    {
                        lblMensaje.Text = "Usuario o Password no Valido";
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(@"<script type='text/javascript' language='javascript'>alert('" + ex.Message + "');</script>");
            }
        }
    }
}