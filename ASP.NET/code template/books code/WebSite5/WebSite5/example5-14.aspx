<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-14.aspx.cs" Inherits="WebSite5.example5_14" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h2>提交预定</h2>
        <p>
            电子邮件地址：
            <asp:TextBox ID="textEmail" runat="server" Width="247px">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="邮件地址不能为空！" ControlToValidate="textEmail" CssClass="auto-style1" Display="Dynamic" ValidationGroup="AllValidators">*
            </asp:RequiredFieldValidator>
            &nbsp;

            <asp:RegularExpressionValidator 
            ID="RegularExpressionValidator1" 
            runat="server" 
            ErrorMessage="邮件地址错误！" 
            ControlToValidate="textEmail" 
            CssClass="auto-style1" 
            Display="Dynamic" 
            ValidationGroup="AllValidators"  一次性验证多个控件
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
            无效格式！
            </asp:RegularExpressionValidator>
            <br />

            预定人数 ：
            <asp:TextBox ID="textNumberInParty" runat="server" Width="245px">
            </asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请指出团队人数" ControlToValidate="textNumberInParty" CssClass="auto-style1" Display="Dynamic">
            *</asp:RequiredFieldValidator>
            <!-->ErrorMessage 指出验证失败的信息， ControlToValidate 指明需要验证的具体控件 </!-->

&nbsp;
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="textNumberInParty"  Display="Dynamic" MaximumValue="20" MinimumValue="1" ErrorMessage="为团队人数输入一个介于 1 和 20 之间的数字" ValidationGroup="AllValidators" Type="Integer" Text="输入一个介于1和20之间的数字">
            </asp:RangeValidator>
            <br />
            预 定 日 期 ：<asp:TextBox ID="textPreferredDate" runat="server" Width="244px"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="以yyyy-m-d格式输入一个日期&quot;" ControlToValidate="textPreferredDate" CssClass="auto-style1" Display="Dynamic" ValidationGroup="AllValidators"  EnableClientScript="False" OnServerValidate="CustomValidator1_ServerValidate" >无效日期格式(需要yyyy-m-d)</asp:CustomValidator>
        </p>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" />
        <p>
            <asp:Button ID="buttonSubmit" runat="server" Text="提交申请" ValidationGroup="AllValidators" OnClick="buttonSubmit_Click" />
            </p>
        <p>
            <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label>
            <br />
            &nbsp;</p>
    
    </div>
    </form>
</body>
</html>
