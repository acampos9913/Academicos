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
    public partial class Principal3 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["cliente"] != null)
                {
                    entUsuario c = (entUsuario)Session["cliente"];
                    lblNombres.Text = c.UsuarioNombres;
                    lblNombre.Text = c.UsuarioNombres;
                    lblApellidos.Text = c.UsuarioApellidos;
                    lblApellido.Text = c.UsuarioApellidos;
                    lblDni.Text = c.UsuarioDNI;
                    lblLimiteLibros.Text = c.UsuarioLimiteLibros.ToString();
                }
            }

            try
            {
                lsvAutores.DataSource = negAutores.Instancia.ListarAutores();
                lsvAutores.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(@"<script languaje='javascript'>alert('" + ex + "');</script>");
            }
        }
    }
}