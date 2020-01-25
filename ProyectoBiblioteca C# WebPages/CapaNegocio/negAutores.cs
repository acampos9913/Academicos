using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;

namespace CapaNegocio
{
  public class negAutores
    {
        #region Singleton
      private static readonly negAutores _instancia = new negAutores();
      public static negAutores Instancia
        {
            get { return negAutores._instancia; }
        }
        #endregion Singleton

        #region Metodos
        public List<entAutores> ListarAutores()
        {
            try
            {
                return datAutores.Instancia.ListarAutores();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion Metodos
    }
}
