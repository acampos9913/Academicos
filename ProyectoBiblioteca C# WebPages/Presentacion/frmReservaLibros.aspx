<%@ Page Title="" Language="C#" MasterPageFile="~/Principal2.Master" AutoEventWireup="true" CodeBehind="frmReservaLibros.aspx.cs" Inherits="Presentacion.frmReservaLibros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView OnRowDeleting="btnQuitar" ID="grvReserva" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="Horizontal" Width="859px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
        <Columns>
            <asp:BoundField DataField="Numero" HeaderText="Nº" />
            <asp:BoundField DataField="idlibro" HeaderText="Codigo" >
            <ItemStyle HorizontalAlign="center" />
            </asp:BoundField>
            <asp:BoundField DataField="dlibro" HeaderText="Descripcion" />
            <asp:BoundField DataField="cantidad" HeaderText="Cantidad">
            <ItemStyle HorizontalAlign="center" />
            </asp:BoundField>
            <asp:BoundField DataField="titulo" HeaderText="Titulo" />
            <asp:BoundField DataField="categoria" HeaderText="Categoria" />
            <asp:BoundField DataField="autor" HeaderText="Autor" />
            <asp:BoundField DataField="editor" HeaderText="Editor" />
            <asp:ImageField DataImageUrlField="imagen" HeaderText="Imagen">
                <ControlStyle Height="30px" Width="30px" />
                    <ItemStyle Height="20px" Width="20px" />
                <ItemStyle HorizontalAlign="center" />
            </asp:ImageField>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/delete.png" ShowDeleteButton="True" >
                <ControlStyle Height="25px" Width="25px" />
                <ItemStyle HorizontalAlign="center" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>

    <br />
    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Reserva" OnClick="btnGuardar_Click" />
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
</asp:Content>
