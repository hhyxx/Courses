<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeBehind="ContentPage1.aspx.cs" Inherits="WebSite10.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="IncrementButton" />
        <asp:AsyncPostBackTrigger ControlID="DecrementButton" />
    </Triggers>
</asp:UpdatePanel>
</asp:Content>
