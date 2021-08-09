<%@ Page Title="jQuery Demo" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeBehind="jQuery.aspx.cs" Inherits="WebSite11.MasterPages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<input id="Button1" type="button" value="button" />
<script type="text/javascript">
    $(document).ready(function () {
        $('# Content2').css('background-color', 'green')

        $('#Button1').click(function () {
            $('# Content2').css('background-color', 'red')
            .animate({ width: '100px', height: '800px' })
        });
    });
</script>
</asp:Content>

