using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;
namespace CapaNegocio
{
    public class negCategorias
    {
        #region Singleton
        private static readonly negCategorias _instancia = new negCategorias();
        public static negCategorias Instancia
        {
            get { return negCategorias._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public List<entCategorias> ListarCategorias()
        {
            try
            {
                return datCategorias.Instancia.ListarCategorias();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        

        #endregion Metodos
    }
}
