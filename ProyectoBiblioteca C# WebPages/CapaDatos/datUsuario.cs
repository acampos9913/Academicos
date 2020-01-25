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
    public class datUsuario
    {
        #region Singleton
        private static readonly datUsuario _instancia = new datUsuario();
        public static datUsuario Instancia
        {
            get { return datUsuario._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public entUsuario VerificarAcceso(String _Usuario, String _Password)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            entUsuario c = null;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spVerificarAcceso", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmstrUsuario", _Usuario);
                cmd.Parameters.AddWithValue("@prmstrPass", _Password);
                cn.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    c = new entUsuario();
                    c.UsuarioCodigo = Convert.ToUInt16(dr["UsuarioCodigo"]);
                    c.UsuarioNombres = dr["UsuarioNombres"].ToString();
                    c.UsuarioApellidos = dr["UsuarioApellidos"].ToString();
                    c.UsuarioDNI = dr["UsuarioDNI"].ToString();
                    c.UsuarioEstado = Convert.ToBoolean(dr["UsuarioEstado"]);
                    c.UsuarioLimiteLibros = Convert.ToUInt16(dr["UsuarioLimiteLibros"]);
                    c.UsuarioTipo = dr["UsuarioTipo"].ToString();
                    c.UsuarioUsuario = dr["UsuarioUsuario"].ToString();
                    c.PermisoUsuarioFecha = Convert.ToDateTime(dr["PermisoUsuarioFecha"]);
                    c.EntregaFechaLimite = Convert.ToDateTime(dr["EntregaFechaLimite"]);
                    c.EntregaEstado = dr["EntregaEstado"].ToString();
                    c.RUsuario = Convert.ToUInt16(dr["RUsuario"]);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return c;
        }

        //public int RegistrarCliente(String xml, String UserName)
        //{
        //    SqlCommand cmd = null;
        //    int pkcreado = 0;
        //    try
        //    {
        //        SqlConnection cn = Conexion.Instancia.Conectar();
        //        cmd = new SqlCommand("sp_RegistrarCliente", cn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@prmstrXml", xml);
        //        cmd.Parameters.AddWithValue("@prmstrUserName", UserName);
        //        cn.Open();
        //        pkcreado = cmd.ExecuteNonQuery();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally { cmd.Connection.Close(); }
        //    return pkcreado;
        //}

        public int actualizaEstadoCliente(String user)
        {
            SqlCommand cmd = null;
            int estado = 0;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spActualizarEstado", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user", user);
                cn.Open();
                estado = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return estado;
        }

        public int RegistrarUsuario(String UsuarioNombres, String UsuarioApellidos, String UsuarioDNI, String UsuarioTelefono, String UsuarioDireccion, String UsuarioCorreoElectronico, String UsuarioUsuario, String UsuarioPassword)
        {
            SqlCommand cmd = null;
            int pkcreado = 0;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spRegistrarUsuario", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nombres", UsuarioNombres);
                cmd.Parameters.AddWithValue("@Apellidos", UsuarioApellidos);
                cmd.Parameters.AddWithValue("@DNI", UsuarioDNI);
                cmd.Parameters.AddWithValue("@Telefono", UsuarioTelefono);
                cmd.Parameters.AddWithValue("@Direccion", UsuarioDireccion);
                cmd.Parameters.AddWithValue("@Correo", UsuarioCorreoElectronico);
                cmd.Parameters.AddWithValue("@Usuario", UsuarioUsuario);
                cmd.Parameters.AddWithValue("@Clave", UsuarioPassword);

                cn.Open();
                pkcreado = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return pkcreado;
        }
        #endregion Singleton
    }
}
