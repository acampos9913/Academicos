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
    public class datLibros
    {
        #region Singleton
        private static readonly datLibros _instancia = new datLibros();
        public static datLibros Instancia
        {
            get { return datLibros._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public List<entLibros> ListarLibrosTodos()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entLibros> Lista = null;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spListarLibrosTodos", cn);
                cn.Open();
                dr = cmd.ExecuteReader();
                Lista = new List<entLibros>();
                while (dr.Read())
                {
                    entLibros m = new entLibros();
                    m.LibrosCodigo = Convert.ToUInt16(dr["LibrosCodigo"]);
                    m.LibrosDescripcion = dr["LibrosDescripcion"].ToString();
                    m.LibrosTitulo = dr["LibrosTitulo"].ToString();
                    m.LibrosImagen = dr["LibrosImagen"].ToString();
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

        public List<entLibros> ListarLibrosXCategoria(Int16 _idCategoria)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entLibros> Lista = null;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spListarLibrosXCategoria", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmintCategoria", _idCategoria);
                cn.Open();
                dr = cmd.ExecuteReader();
                Lista = new List<entLibros>();
                while (dr.Read())
                {
                    entLibros l = new entLibros();
                    l.LibrosCodigo = Convert.ToInt32(dr["LibrosCodigo"]);
                    l.LibrosDescripcion = dr["LibrosDescripcion"].ToString();
                    l.LibrosTitulo = dr["LibrosTitulo"].ToString();
                    l.LibrosEjemplares = Convert.ToInt16(dr["LibrosEjemplares"]);
                    l.LibrosImagen = dr["LibrosImagen"].ToString();
                    l.LibrosStock = Convert.ToInt16(dr["LibrosStock"]);
                    entCategorias c = new entCategorias();
                    c.CategoriasCodigo = Convert.ToInt32(dr["CategoriasCodigo"]);
                    c.CategoriasNombres = dr["DCategoria"].ToString();
                    l.Categorias = c;
                    Lista.Add(l);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return Lista;
        }

        public List<entLibros> ListarLibrosXAutores(Int16 _idAutores)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entLibros> Lista = null;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spListarLibrosXAutores", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmintAutores", _idAutores);
                cn.Open();
                dr = cmd.ExecuteReader();
                Lista = new List<entLibros>();
                while (dr.Read())
                {
                    entLibros l = new entLibros();
                    l.LibrosCodigo = Convert.ToInt32(dr["LibrosCodigo"]);
                    l.LibrosDescripcion = dr["LibrosDescripcion"].ToString();
                    l.LibrosTitulo = dr["LibrosTitulo"].ToString();
                    l.LibrosEjemplares = Convert.ToInt16(dr["LibrosEjemplares"]);
                    l.LibrosImagen = dr["LibrosImagen"].ToString();
                    l.LibrosStock = Convert.ToInt16(dr["LibrosStock"]);
                    entAutores a = new entAutores();
                    a.AutoresCodigo = Convert.ToInt32(dr["AutoresCodigo"]);
                    a.AutoresNombres = dr["DAutores"].ToString();
                    l.Autores = a;
                    Lista.Add(l);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return Lista;
        }

        public List<entLibros> ListarLibrosXImagen(Int16 _idLibro)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entLibros> Lista = null;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spListarLibroXImagen", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmintId", _idLibro);
                cn.Open();
                dr = cmd.ExecuteReader();
                Lista = new List<entLibros>();
                while (dr.Read())
                {
                    entLibros l = new entLibros();
                    l.LibrosCodigo = Convert.ToInt32(dr["LibrosCodigo"]);
                    l.LibrosDescripcion = dr["LibrosDescripcion"].ToString();
                    l.LibrosEstado = dr["LibrosEstado"].ToString();
                    l.LibrosTitulo = dr["LibrosTitulo"].ToString();
                    l.LibrosEjemplares = Convert.ToInt16(dr["LibrosEjemplares"]);
                    l.LibrosImagen = dr["LibrosImagen"].ToString();
                    l.LibrosObservaciones = dr["LibrosObservaciones"].ToString();
                    l.LibrosStock = Convert.ToInt16(dr["LibrosStock"]);
                    entCategorias c = new entCategorias();
                    c.CategoriasCodigo = Convert.ToInt32(dr["CategoriasCodigo"]);
                    c.CategoriasNombres = dr["DCategoria"].ToString();
                    l.Categorias = c;
                    entAutores a = new entAutores();
                    a.AutoresCodigo = Convert.ToInt32(dr["AutoresCodigo"]);
                    a.AutoresNombres = dr["DAutores"].ToString();
                    l.Autores = a;
                    entEditores e = new entEditores();
                    e.EditoresCodigo = Convert.ToInt32(dr["EditoresCodigo"]);
                    e.EditoresNombres = dr["DEditores"].ToString();
                    l.Editores = e;
                    Lista.Add(l);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { cmd.Connection.Close(); }
            return Lista;
        }

        public int RegistrarLibros(String xml)
        {
            SqlCommand cmd = null;
            int pkcreado = 0;
            try
            {
                SqlConnection cn = Conexion.Instancia.Conectar();
                cmd = new SqlCommand("spRegistrarLibros", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmstrXml", xml);
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

        #endregion Metodos
    }
}
