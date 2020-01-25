using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entUsuario
    {
        public int UsuarioCodigo { get; set; }
        public String UsuarioNombres { get; set; }
        public String UsuarioApellidos { get; set; }
        public String UsuarioDNI { get; set; }
        public String UsuarioTelefono { get; set; }
        public String UsuarioDireccion { get; set; }
        public String UsuarioCorreoElectronico { get; set; }
        public DateTime UsuarioFechaRegistro { get; set; }
        public DateTime UsuarioFechaNacimiento { get; set; }
        public String UsuarioImagen { get; set; }
        public Boolean UsuarioEstado { get; set; }
        public int UsuarioLimiteLibros { get; set; }
        public String UsuarioTipo { get; set; }
        public String UsuarioUsuario { get; set; }
        public String UsuarioPassword { get; set; }
        public DateTime PermisoUsuarioFecha { get; set; }
        public DateTime EntregaFechaLimite { get; set; }
        public String EntregaEstado { get; set; }
        public int RUsuario { get; set; }

    }
}
