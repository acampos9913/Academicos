using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace CapaDatos
{
   public class datReserva
    {
    #region Singleton
       private static readonly datReserva _instancia = new datReserva();
       public static datReserva Instancia
        {
            get { return datReserva._instancia; }
        }
    #endregion Singleton

    #region Metodos
        public int InsertarReserva(String xml){
            SqlCommand cmd = null;
            int pkcreado = 0;
            try{
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spInsertarReserva", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmstrXml", xml);
                cn.Open();
                pkcreado = cmd.ExecuteNonQuery();
            }catch (Exception ex){
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return pkcreado;
        }
    #endregion Metodos
    }
}
