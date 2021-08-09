<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeBehind="jQueryDemos.aspx.cs" Inherits="WebSite11.MasterPages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
</asp:Content>
<asp:Content ID="cpMainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 title="First Header">First Header</h1>


<table id="Demo">
<tr><td>Row 1 Cell 1</td><td>Row 1 Cell 2</td></tr>
<tr><td>Row 2 Cell 1</td><td>Row 2 Cell 2</td></tr>
<tr><td>Row 3 Cell 1</td><td>Row 3 Cell 2</td></tr>
<tr><td>Row 4 Cell 1</td><td>Row 4 Cell 2</td></tr>
<tr><td>Row 5 Cell 1</td><td>Row 5 Cell 2</td></tr>
</table>

<h2>Second <span style="font-style: italic; font-weight: bold;">
Header</span></h2>
<input id="Button1" type="button" value="button" />
<input id="Text1" type="text" />
<input id="Checkbox1" type="checkbox" />
<input id="Checkbox2" type="checkbox" />
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="cpClientScript">
    <script type="text/javascript">
        $(function () {
            $('#Demo').css('background-color', 'green');
        });
	</script>
</asp:Content>