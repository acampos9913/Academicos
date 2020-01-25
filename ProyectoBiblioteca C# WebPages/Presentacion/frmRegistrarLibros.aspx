<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalIntranet.Master" AutoEventWireup="true" CodeBehind="frmRegistrarLibros.aspx.cs" Inherits="Presentacion.frmRegistrarLibros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="font-family: 'Times New Roman'">Registrar Libros</h3>
    <br />
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Descripción: " Width="80px" ForeColor="Black"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCategoria" runat="server" Text="Categoria: " Width="80px" ForeColor="Black"></asp:Label></td>
            <td>
                <asp:DropDownList ID="cboCategoria" runat="server">
                    <asp:ListItem Value="1">Matemática</asp:ListItem>
                    <asp:ListItem Value="2">Filosofía</asp:ListItem>
                    <asp:ListItem Value="3">Programación</asp:ListItem>
                    <asp:ListItem Value="4">Humor</asp:ListItem>
                    <asp:ListItem Value="5">Música</asp:ListItem>
                    <asp:ListItem Value="6">Religión</asp:ListItem>
                    <asp:ListItem Value="7">Política</asp:ListItem>
                    <asp:ListItem Value="8">Literatura</asp:ListItem>
                    <asp:ListItem Value="9">Historia Sociales</asp:ListItem>
                    <asp:ListItem Value="10">Ética Profesional</asp:ListItem>
                    <asp:ListItem Value="11">Algoritmos</asp:ListItem>
                    <asp:ListItem Value="12">Estadística</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Título: " Width="80px" ForeColor="Black"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtTitulo" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Ejemplares: " Width="80px" ForeColor="Black"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtEjemplares" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Imagen: " Width="80px" ForeColor="Black"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtImagen" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Observaciones: " Width="80px" ForeColor="Black"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtObservaciones" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Stock: " Width="80px" ForeColor="Black"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtStock" runat="server"></asp:TextBox></td>
        </tr>
        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
    </table>
    <br />
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    <br /><br />
    <asp:GridView ID="grvDatos" runat="server"></asp:GridView>

</asp:Content>
