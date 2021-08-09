<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example5-7.aspx.cs" Inherits="WebSite5.example5_7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1><span lang="EN-US" style="font-size:10.5pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;
mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:HE">ImageMap</span><span style="font-size:10.5pt;mso-bidi-font-size:10.0pt;font-family:宋体;mso-ascii-font-family:
&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;
mso-bidi-language:HE">控件导航示例</span></h1>
        <p>
            <span style="font-size:10.5pt;mso-bidi-font-size:10.0pt;
font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:
&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:HE">单击某个行星图片可看其更大的图片</span></p>
        <p>
            <asp:ImageMap ID="solarsys" runat="server" AlternateText="Solar System(太阳系)" Height="212px" HotSpotMode="Navigate" ImageUrl="~/images/xingxing.jpg" Width="440px">
                <asp:CircleHotSpot HotSpotMode="Navigate" NavigateUrl="~/Images/xing1.jpg" Radius="30" Target="_blank" X="47" Y="162" />
                <asp:CircleHotSpot HotSpotMode="Navigate" NavigateUrl="~/Images/xing2.jpg" Radius="30" Target="_blank" X="208" Y="126" />
            </asp:ImageMap>
        </p>
        <p>
            <asp:Image ID="Image1" runat="server" Height="147px" ImageUrl="~/Images/xing1.jpg" Width="171px" />
        </p>
        <p>
            <asp:Image ID="Image2" runat="server" Height="162px" ImageUrl="~/Images/xing2.jpg" Width="172px" />
        </p>
        <p>
            &nbsp;</p>
    
    </div>
    </form>
</body>
</html>
