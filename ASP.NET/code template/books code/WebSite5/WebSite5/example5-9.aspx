<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-9.aspx.cs" Inherits="WebSite5.example5_9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-size:10.5pt;mso-bidi-font-size:10.0pt;
font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:
&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:HE">按书名、类别明还是出版社名称进行搜索？<br />
        </span>
        <br />
    <asp:RadioButton ID="radioProduct"   runat="server"   autopostback="true" 
    GroupName="SearchType"   Text="书名" 
    OnCheckedChanged="radioButton_CheckedChanged" CssClass="auto-style1" /> &nbsp;<asp:RadioButton ID="radioCategory"  runat="server"   autopostback="true" 
    GroupName="SearchType"   Text="类别" 
    OnCheckedChanged="radioButton_CheckedChanged" CssClass="auto-style1" />
<asp:RadioButton ID="radioPublisher"  runat="server"  AutoPostBack="True" 
    GroupName="SearchType"   Text="出版社" 
    oncheckedchanged="radioButton_CheckedChanged" CssClass="auto-style1" />
        <br />
        <asp:MultiView ID="MultiView1" runat="server"> <br />
    <asp:View ID="viewProductSearch" runat="server">
        输入书名： <asp:TextBox ID="textProductName" runat="server" Width="330px"></asp:TextBox>
    </asp:View> <br />
    <asp:View ID="viewCategorySearch" runat="server">
        输入类别：<asp:TextBox ID="textCategory" runat="server" Width="330px"></asp:TextBox>
    </asp:View> <br />
    <asp:View ID="ViewPublisher" runat="server">
        输入出版社名：<asp:TextBox ID="textPublisher" runat="server" Width="290px"></asp:TextBox>
    </asp:View>
</asp:MultiView>
        <br />
        <asp:Button ID="btnSearch" OnClick="Button1_Click" runat="server" Text="Search" />
    </div>
    </form>
</body>
</html>
