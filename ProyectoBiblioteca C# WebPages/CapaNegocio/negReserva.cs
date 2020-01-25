using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;
using System.Data;
namespace CapaNegocio
{
  public  class negReserva
    {
        #region Singleton
      private static readonly negReserva _instancia = new negReserva();
      public static negReserva Instancia
        {
            get { return negReserva._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public int InsertarReserva(entUsuario c, DataTable dt)
        {
            try
            {         
                String cadXml = "";
                String cadXmlDetalle = "";
                decimal Total = 0;
                //creamos el nodo Pedido
                cadXml += "<Reserva ";
                cadXml += "UsuarioCodigo='" + c.UsuarioCodigo + "' ";
                //creamos los nodos dpedido (detalles)
                foreach (DataRow r in dt.Rows)
                {
                    cadXmlDetalle += "<DetalleReserva ";
                    cadXmlDetalle += "LibrosCodigo='" + r["idlibro"] + "' ";
                    cadXmlDetalle += "Cantidad='" + r["cantidad"] + "'/>";
                    //cadXmlDetalle += "Precio='" + r["precio"] + "'/>";
                    Total += Convert.ToInt32(r["cantidad"]);
                }
                cadXml += "TotalLibros='" + Total + "'>";
                cadXml += cadXmlDetalle;
                cadXml += "</Reserva>";
                cadXml = "<root>" + cadXml + "</root>";
                return datReserva.Instancia.InsertarReserva(cadXml);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion Metodos
    }
}
