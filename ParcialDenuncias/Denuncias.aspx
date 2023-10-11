<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Denuncias.aspx.cs" Inherits="ParcialDenuncias.Denuncias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 531px; width: 432px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Index.aspx">Volver</asp:HyperLink>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Texto:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Categoria:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id">
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Crear" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="texto" DataValueField="id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" Text="Actualizar" OnClick="Button2_Click1" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Eliminar" />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="texto" HeaderText="texto" SortExpression="texto" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:parcial1LP3ConnectionString %>" DeleteCommand="DELETE FROM [Denuncias] WHERE [id] = @id" InsertCommand="INSERT INTO [Denuncias] ([texto], [idDenunciaCategoria]) VALUES (@texto, @idDenunciaCategoria)" SelectCommand="SELECT Denuncias.id, Denuncias.texto, DenunciaCategorias.nombre FROM Denuncias INNER JOIN DenunciaCategorias ON Denuncias.idDenunciaCategoria = DenunciaCategorias.id" UpdateCommand="UPDATE [Denuncias] SET [texto] = @texto, [idDenunciaCategoria] = @idDenunciaCategoria WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="texto" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idDenunciaCategoria" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="texto" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idDenunciaCategoria" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:parcial1LP3ConnectionString %>" SelectCommand="SELECT * FROM [DenunciaCategorias]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                    <asp:BoundField DataField="CantidadDenuncias" HeaderText="CantidadDenuncias" ReadOnly="True" SortExpression="CantidadDenuncias" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:parcial1LP3ConnectionString %>" SelectCommand="SELECT DC.nombre AS Categoria, COUNT(D.id) AS CantidadDenuncias
FROM DenunciaCategorias DC
LEFT JOIN Denuncias D ON DC.id = D.idDenunciaCategoria
GROUP BY DC.nombre"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
