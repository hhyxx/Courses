<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewBingding_2.aspx.cs" Inherits="WebSite9.GridViewBingding_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
            DataKeyNames="NO" OnRowDeleting="GridView1_RowDeleting" Height="185px" 
            Width="536px" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="NO" HeaderText="NO" ReadOnly="True" SortExpression="NO" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Sex" HeaderText="Sex" />
                <asp:BoundField DataField="birthday" HeaderText="birthday" />
                <asp:BoundField DataField="Adress" HeaderText="Adress" />
                <asp:BoundField DataField="Photo" HeaderText="Photo" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <EmptyDataTemplate>
                学号
            </EmptyDataTemplate>
        </asp:GridView>
   </div>
    </form>
</body>
</html>
