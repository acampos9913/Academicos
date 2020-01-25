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
  public class negEmpleado
    {
        #region Singleton
      private static readonly negEmpleado _instancia = new negEmpleado();
      public static negEmpleado Instancia
        {
            get { return negEmpleado._instancia; }
        }

        #endregion Singleton
        #region Metodos
        public entEmpleado VerificarAcceso(String _Usuario, String _Password)
        {
            try
            {
                return datEmpleado.Instancia.VerificarAcceso(_Usuario, _Password);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion Metodos
    }
}
