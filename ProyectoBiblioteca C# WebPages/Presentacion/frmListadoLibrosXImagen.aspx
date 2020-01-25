<%@ Page Title="" Language="C#" MasterPageFile="~/Principal2.Master" AutoEventWireup="true" CodeBehind="frmListadoLibrosXImagen.aspx.cs" Inherits="Presentacion.frmListadoLibrosXImagen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>      
        <asp:DataList ID="dlsLibros" runat="server" RepeatColumns="1" OnItemCommand="dlsLibros_ItemCommand">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="250px"
                                Width="250px" ImageUrl='<%# Eval("LibrosImagen", "/images/{0}") %>' />

                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td style="color: white" >hola</td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">CÓDIGO: 
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("LibrosCodigo") %>'
                                    Width="270px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">DESCRIPCIÓN: 
                                <asp:Label ID="lblDescripcion" runat="server" Text='<%# Eval("LibrosDescripcion") %>'
                                    Width="270px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">TÍTULO: 
                                <asp:Label ID="lblTitulo" runat="server" Text='<%# Eval("LibrosTitulo") %>' Width="270px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">EJEMPLARES: 
                                <asp:Label ID="lblEjemplares" runat="server" Text='<%# Eval("LibrosEjemplares") %>' Width="270px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">STOCK: 
                                <asp:Label ID="lblStock" runat="server" Text='<%# Eval("LibrosStock") %>' Width="270px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">OBSERVACIONES: 
                                <asp:Label ID="lblObservaciones" runat="server" Text='<%# Eval("LibrosObservaciones") %>' Width="270px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">ESTADO: 
                                <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("LibrosEstado") %>' Width="270px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">CATEGORÍA: 
                                <asp:Label ID="lblCategoria" runat="server" Text='<%# Eval("Categorias.CategoriasNombres") %>' Width="50px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">AUTOR: 
                                <asp:Label ID="lblAutores" runat="server" Text='<%# Eval("Autores.AutoresNombres") %>' Width="270px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman'; color: black; font-size: 15px">EDITOR: 
                                <asp:Label ID="lblEditores" runat="server" Text='<%# Eval("Editores.EditoresNombres") %>' Width="270px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtCant" runat="server" Text="1" Width="60px"
                                TextMode="Number"></asp:TextBox>
                            <asp:Button ID="btnReservar" runat="server" Text="Reservar" CommandName="btnReservar" />
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("LibrosCodigo") %>'
                                Visible="false"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--<br />--%>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
