using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using System.Data;

namespace Presentacion
{
    public partial class frmListadoLibrosXImagen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack){
               
                    Int16 idLibros = Convert.ToInt16(Request.QueryString["idLibrito"]);
                    dlsLibros.DataSource = negLibros.Instancia.ListarLibrosXImagen(idLibros);
                    dlsLibros.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(@"<script languaje='javascript'>alert('" + ex.Message + "')</script>");
            }
        }

        private void CrearTablaPedidoEnSesion() {
            try{
                //crea estructura de carrito en la sesion
                DataTable dt = new DataTable();
                dt.Columns.Add("idlibro", Type.GetType("System.Int32"));    
                dt.Columns.Add("dlibro", Type.GetType("System.String"));
                dt.Columns.Add("titulo", Type.GetType("System.String"));
                dt.Columns.Add("cantidad", Type.GetType("System.Int32"));
                dt.Columns.Add("categoria", Type.GetType("System.String"));
                dt.Columns.Add("autor", Type.GetType("System.String"));
                dt.Columns.Add("editor", Type.GetType("System.String"));
                dt.Columns.Add("imagen", Type.GetType("System.String"));
                dt.Columns.Add("Numero", Type.GetType("System.Int32"));
                dt.Columns["Numero"].AutoIncrement = true;
                dt.Columns["Numero"].AutoIncrementSeed = 1;
                dt.Columns["Numero"].AutoIncrementStep = 1;

                Session["reserva"] = dt;
            }catch (Exception){
                throw;
            }
        }

        private Boolean VerificaSiyaExisteProducto(Int16 idLib, DataTable dt) {
            Boolean yaExiste = false;
            for (int i = 0; i < dt.Rows.Count; i++) {
                DataRow r = dt.Rows[i];
                if (idLib == Convert.ToInt16(r["idlibro"]))
                {
                    yaExiste = true;
                    break;
                }
            }
            return yaExiste;
        }

        protected void dlsLibros_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try{
                if (e.CommandName == "btnReservar")
                {
                    if (Session["reserva"] == null)
                    {
                        CrearTablaPedidoEnSesion();
                    }
                    DataTable dt = (DataTable)Session["reserva"];
                    Int16 idLibro = Convert.ToInt16(((Label)e.Item.FindControl("lblId")).Text);
                    if (VerificaSiyaExisteProducto(idLibro, dt))
                    {
                        Response.Write(@"<script languaje='javascript'>alert('Usted ya agregó ese libro por favor elija otro');</script>");
                        return;
                    }
                    DataRow fila = dt.NewRow();
                    fila["idlibro"] = ((Label)e.Item.FindControl("lblId")).Text;
                    fila["cantidad"] = ((TextBox)e.Item.FindControl("txtCant")).Text;
                    fila["dlibro"] = ((Label)e.Item.FindControl("lblDescripcion")).Text;
                    fila["titulo"] = ((Label)e.Item.FindControl("lblTitulo")).Text;
                    fila["categoria"] = ((Label)e.Item.FindControl("lblCategoria")).Text;
                    fila["autor"] = ((Label)e.Item.FindControl("lblAutores")).Text;
                    fila["editor"] = ((Label)e.Item.FindControl("lblEditores")).Text;
                    //double subtotal = Convert.ToInt32(((TextBox)e.Item.FindControl("txtCant")).Text) *
                    //                Convert.ToDouble(((Label)e.Item.FindControl("lblPrecio")).Text);
                    //fila["SubTotal"] = subtotal;
                    //double subtotal1 = +subtotal;
                    //fila["SubTotal1"] = subtotal1;
                    fila["imagen"] = ((Image)e.Item.FindControl("Image1")).ImageUrl;

                    dt.Rows.Add(fila);
                    Response.Redirect("frmReservaLibros.aspx");
                }
            }catch (Exception ex){                
            }
        }
    }
}

