using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
   public class datAutores
    {
        #region Singleton
       private static readonly datAutores _instancia = new datAutores();
       public static datAutores Instancia
        {
            get { return datAutores._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public List<entAutores> ListarAutores()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entAutores> Lista = null;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spListarAutores", cn);
                cn.Open();
                dr = cmd.ExecuteReader();
                Lista = new List<entAutores>();
                while (dr.Read())
                {
                    entAutores m = new entAutores();
                    m.AutoresCodigo = Convert.ToUInt16(dr["AutoresCodigo"]);
                    m.AutoresNombres = dr["AutoresNombres"].ToString();
                    m.AutoresEstado = dr["AutoresEstado"].ToString();
                    Lista.Add(m);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return Lista;
        }
        #endregion Metodos
    }
}
