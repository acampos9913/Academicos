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
public class negUsuario
    {
        #region Singleton
    private static readonly negUsuario _instancia = new negUsuario();
    public static negUsuario Instancia
        {
            get { return negUsuario._instancia; }
        }

        #endregion Singleton
    #region Metodos
    public entUsuario VerificarAcceso(String _Usuario, String _Password)
    {
        try
        {
            return datUsuario.Instancia.VerificarAcceso(_Usuario, _Password);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //public int RegistrarCliente(entUsuario u, DataTable dt)
    //{
    //    try
    //    {
    //        creamos variable tipo texto para crear la cadena XML
    //        String cadXml = "";
    //        foreach (DataRow r in dt.Rows)
    //        {
    //            cadXml += "<Cliente ";
    //            cadXml += "idCliente='0' ";
    //            cadXml += "RazonSocial='" + r["RazonSocial"] + "' ";
    //            cadXml += "RUC='" + r["RUC"] + "' ";
    //            cadXml += "direccion='" + r["direccion"] + "' ";
    //            cadXml += "Telefono='" + r["Telefono"] + "' ";
    //            cadXml += "Usuario='" + r["Usuario"] + "' ";
    //            cadXml += "Password='" + r["Password"] + "'/>";
    //        }
    //        cadXml = "<root>" + cadXml + "</root>";
    //        return datUsuario.Instancia.RegistrarCliente(cadXml, u.UsuarioUsuario);
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    public int actualizaEstado(String user)
    {
        return datUsuario.Instancia.actualizaEstadoCliente(user);
    }

    public int RegistrarUsuario(String UsuarioNombres, String UsuarioApellidos, String UsuarioDNI, String UsuarioTelefono, String UsuarioDireccion, String UsuarioCorreoElectronico, String UsuarioUsuario, String UsuarioPassword)
    {
        try
        {
            return datUsuario.Instancia.RegistrarUsuario(UsuarioNombres, UsuarioApellidos, UsuarioDNI, UsuarioTelefono, UsuarioDireccion, UsuarioCorreoElectronico, UsuarioUsuario, UsuarioPassword);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    #endregion Metodos
    }
}
