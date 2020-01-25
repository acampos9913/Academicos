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
    public partial class frmRegistrarLibros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void CrearDataTableenSesion()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("LibrosCodigo", Type.GetType("System.Int32"));             
                dt.Columns.Add("LibrosDescripcion", Type.GetType("System.String"));
                dt.Columns.Add("LibrosTitulo", Type.GetType("System.String"));
                dt.Columns.Add("LibrosEjemplares", Type.GetType("System.Int32"));
                dt.Columns.Add("LibrosImagen", Type.GetType("System.String"));
                dt.Columns.Add("LibrosObservaciones", Type.GetType("System.String"));
                dt.Columns.Add("LibrosStock", Type.GetType("System.Int32"));
                dt.Columns.Add("CategoriasCodigo", Type.GetType("System.Int32"));
                dt.Columns.Add("Numero", Type.GetType("System.Int32"));
                dt.Columns["Numero"].AutoIncrement = true;
                dt.Columns["Numero"].AutoIncrementSeed = 1;
                dt.Columns["Numero"].AutoIncrementStep = 1;
                Session["regLibros"] = dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["regLibros"] == null)
                {
                    CrearDataTableenSesion();
                }
                DataTable dt = (DataTable)Session["regLibros"];
                DataRow r = dt.NewRow();
                r["LibrosDescripcion"] = txtDescripcion.Text;
                r["LibrosTitulo"] = txtTitulo.Text;
                r["LibrosEjemplares"] = txtEjemplares.Text;
                r["LibrosImagen"] = txtImagen.Text;
                r["LibrosObservaciones"] = txtObservaciones.Text;
                r["LibrosStock"] = txtStock.Text;
                r["CategoriasCodigo"] = cboCategoria.Text.ToString();   
                dt.Rows.Add(r);

                grvDatos.DataSource = dt;
                grvDatos.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = (DataTable)Session["regLibros"];
                int i = negLibros.Instancia.RegistrarLibros(dt);
                if (i > 0)
                {
                    lblMensaje.Text = "Registro Guardado Satisfactoriamente";
                    lblMensaje.ForeColor = System.Drawing.Color.Blue;
                }
                else
                {
                    lblMensaje.Text = "No se pudo guardar";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
                Session["regLibros"] = null;

                grvDatos.DataSource = null;
                grvDatos.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }
    }
}