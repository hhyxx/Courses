<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-10.aspx.cs" Inherits="WebSite5.example5_10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Wizard id="Wizard1" runat="server" ActiveStepIndex="0" DisplayCancelButton="true">
     <WizardSteps>
     <asp:WizardStep runat="server" id="Step1" title="第一步，输入基本信息" StepType="Start">
     <b>请输入您的个人基本信息：</b>
     <br />
     请输入您的姓名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <br/>
     请输入您的E-mail：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
     </asp:WizardStep>
   <asp:WizardStep runat="server" id="Step2" title="第二步，输入用户信息" StepType="Step">
    <b>请输入您的个人用户信息：</b>
    <br />
    用户名：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br/>
     密码：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
   </asp:WizardStep>
    <asp:WizardStep runat="server" StepType="Finish" ID="Finish" Title="第三步，信息汇总">
    <b>登录信息汇总：</b><br/>
    你的姓名是：<asp:Label ID="Label1" runat="server" Text="Label" ></asp:Label><br/>
    你的E-mail是：<asp:Label ID="Label2" runat="server" Text="Label" ></asp:Label><br/>
    你的用户名是：<asp:Label ID="Label3" runat="server" Text="Label" ></asp:Label><br/>
    你的密码是：<asp:Label ID="Label4" runat="server" Text="Label" ></asp:Label><br/>
        </asp:WizardStep>
      </WizardSteps>
     </asp:Wizard>
    </div>
  </form>
</body>
</html>
