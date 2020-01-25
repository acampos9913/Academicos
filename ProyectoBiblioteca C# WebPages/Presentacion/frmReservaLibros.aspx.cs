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
    public partial class frmReservaLibros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                entUsuario c = (entUsuario)Session["cliente"];

                DataTable dt = (DataTable)Session["reserva"];
                grvReserva.DataSource = dt;
                grvReserva.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                int Total = 0;
                entUsuario c = (entUsuario)Session["cliente"];
                DataTable dt = (DataTable)Session["reserva"];
                foreach (DataRow r in dt.Rows)
                {
                    Total += Convert.ToInt32(r["cantidad"]);
                }
                if (Total > c.UsuarioLimiteLibros)
                {
                    lblMensaje.Text = "Usted ha superado el limite de libros que desea reservar.";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    if (c.RUsuario > 0)
                    {
                        lblMensaje.Text = "Usted no puede hacer mas de una reserva de libros en el mismo día.";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        int i = negReserva.Instancia.InsertarReserva(c, dt);
                        if (i > 0)
                        {
                            lblMensaje.Text = "Su Reserva de Libros ha sido guardado satisfactoriamente.";
                            lblMensaje.ForeColor = System.Drawing.Color.Blue;
                        }
                        else
                        {
                            lblMensaje.Text = "No se pudo Insertar";
                            lblMensaje.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }
        protected void btnQuitar(object sender, GridViewDeleteEventArgs e)
        {
            int indice = Convert.ToInt32(e.RowIndex);
            DataTable dt = (DataTable)Session["reserva"];
            dt.Rows[indice].Delete();
            Session["reserva"] = dt;
            grvReserva.DataSource = dt;
            grvReserva.DataBind();
        }
    }
}