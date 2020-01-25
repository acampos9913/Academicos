using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;
using System.Data;
namespace CapaNegocio
{
    public class negLibros
    {
        #region Singleton
        private static readonly negLibros _instancia = new negLibros();
        public static negLibros Instancia
        {
            get { return negLibros._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public List<entLibros> ListarLibrosTodos()
        {
            try
            {
                return datLibros.Instancia.ListarLibrosTodos();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<entLibros> ListarLibrosXCategoria(Int16 _idCategoria)
        {
            try
            {
                return datLibros.Instancia.ListarLibrosXCategoria(_idCategoria);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<entLibros> ListarLibrosXAutores(Int16 _idAutores)
        {
            try
            {
                return datLibros.Instancia.ListarLibrosXAutores(_idAutores);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<entLibros> ListarLibrosXImagen(Int16 _id)
        {
            try
            {
                return datLibros.Instancia.ListarLibrosXImagen(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int RegistrarLibros(DataTable dt)
        {
            try
            {
                String cadXml = "";
                foreach (DataRow r in dt.Rows)
                {
                    cadXml += "<Libros ";
                    cadXml += "LibrosCodigo='0' ";
                    cadXml += "LibrosDescripcion='" + r["LibrosDescripcion"] + "' ";
                    cadXml += "LibrosTitulo='" + r["LibrosTitulo"] + "' ";
                    cadXml += "LibrosEjemplares='" + r["LibrosEjemplares"] + "' ";
                    cadXml += "LibrosImagen='" + r["LibrosImagen"] + "' ";
                    cadXml += "LibrosObservaciones='" + r["LibrosObservaciones"] + "'/>";
                    cadXml += "LibrosStock='" + r["LibrosStock"] + "' ";
                    cadXml += "CategoriasCodigo='" + r["CategoriasCodigo"] + "'/>";

                }
                cadXml = "<root>" + cadXml + "</root>";
                return datLibros.Instancia.RegistrarLibros(cadXml);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Metodos
    }
}