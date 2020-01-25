using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Conexion
    {
        private static readonly Conexion _instancia = new Conexion();
        public static Conexion Instancia
        {
            get { return Conexion._instancia; }
        }

        public SqlConnection Conectar()
        {
            try
            {
                SqlConnection cn = new SqlConnection();
                cn.ConnectionString = "Data source=.;Initial Catalog=BDBiblioteca;" +
                                     "User ID=sa; Password=12345678";
                //"Integrated Security = true";
                return cn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
