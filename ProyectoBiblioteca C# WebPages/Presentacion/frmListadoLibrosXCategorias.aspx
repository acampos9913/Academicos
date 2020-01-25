<%@ Page Title="" Language="C#" MasterPageFile="~/Principal2.Master" AutoEventWireup="true" CodeBehind="frmListadoLibrosXCategorias.aspx.cs" Inherits="Presentacion.frmListadoLibrosXCategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 align="center" style="font-family: 'Times New Roman'; font-size: 20px; color: white; background-color: darkcyan">
        <asp:Label ID="lblAutor" runat="server" Text="" ForeColor="white" Font-Size="22px"></asp:Label>
    </h3>
    <asp:Label ID="lblEstado" runat="server" Text="" ForeColor="red" Font-Size="22px"></asp:Label>
    <br />
    <asp:DataList ID="dlsLibros" runat="server" RepeatColumns="3" align="center">
        <ItemTemplate>
            <table>

                <tr align="center">
                    <td>
                        <a href="frmListadoLibrosXImagen.aspx?idLibrito=<%# Eval("LibrosCodigo") %>">
                            <asp:Image ID="Image1" runat="server" Height="180px"
                                Width="180px" ImageUrl='<%# Eval("LibrosImagen", "/images/{0}") %>' /></a>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("LibrosCodigo") %>'
                            Width="120px" ForeColor="DarkBlue" Font-Bold="true" Font-Size="12px"></asp:Label>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <asp:Label ID="lblTitulo" runat="server" Text='<%# Eval("LibrosTitulo") %>' Width="270px" ForeColor="DarkBlue" Font-Bold="true" Font-Size="12px"></asp:Label></td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
