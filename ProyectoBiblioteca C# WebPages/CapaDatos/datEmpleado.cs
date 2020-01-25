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
   public class datEmpleado
    {
        #region Singleton
       private static readonly datEmpleado _instancia = new datEmpleado();
       public static datEmpleado Instancia
        {
            get { return datEmpleado._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public entEmpleado VerificarAcceso(String _Usuario, String _Password)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            entEmpleado c = null;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spVerificarAccesoIntranet", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmstrUsuario", _Usuario);
                cmd.Parameters.AddWithValue("@prmstrPass", _Password);
                cn.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    c = new entEmpleado();
                    c.EmpleadosCodigo = Convert.ToUInt16(dr["EmpleadosCodigo"]);
                    c.EmpleadosNombres = dr["EmpleadosNombres"].ToString();
                    c.EmpleadosApellidos = dr["EmpleadosApellidos"].ToString();
                    c.EmpleadosDireccion = dr["EmpleadosDireccion"].ToString();
                    c.EmpleadosTelefono = dr["EmpleadosTelefono"].ToString();
                    c.EmpleadosUsuario = dr["EmpleadosUsuario"].ToString();
                    c.EmpleadosPassword = dr["EmpleadosPassword"].ToString();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return c;
        }
        #endregion Singleton
    }
}