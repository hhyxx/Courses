<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewBingding_3.aspx.cs" Inherits="WebSite9.GridViewBingding_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
            PageSize="3" OnDataBound="GridView1_DataBound">
            <PagerSettings Mode="NextPrevious" NextPageText="下一页&gt;&gt;" PreviousPageText="&lt;&lt;上一页" />
        </asp:GridView>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        &nbsp;
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><br />
    </div>
    </form>
</body>
</html>
