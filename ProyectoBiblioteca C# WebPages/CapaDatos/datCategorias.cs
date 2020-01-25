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
    public class datCategorias
    {

        #region Singleton
        private static readonly datCategorias _instancia = new datCategorias();
        public static datCategorias Instancia
        {
            get { return datCategorias._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public List<entCategorias> ListarCategorias()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entCategorias> Lista = null;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spListarCategorias", cn);
                cn.Open();
                dr = cmd.ExecuteReader();
                Lista = new List<entCategorias>();
                while (dr.Read())
                {
                    entCategorias m = new entCategorias();
                    m.CategoriasCodigo = Convert.ToUInt16(dr["CategoriasCodigo"]);
                    m.CategoriasNombres = dr["CategoriasNombres"].ToString();
                    m.CategoriasEstado = Convert.ToBoolean(dr["CategoriasEstado"]);
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
