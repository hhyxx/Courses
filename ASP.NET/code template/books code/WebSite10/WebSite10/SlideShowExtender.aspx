<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SlideShowExtender.aspx.cs" Inherits="WebSite10.SlideShowExtender" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
      <asp:Image ID="Image1" runat="server" 
                Height="300"
                Style="border: 1px solid black;width:auto" 
                ImageUrl="images/Blue hills.jpg"
                AlternateText="Blue Hills image" />
      <asp:Label runat="server" ID="imageDescription" ></asp:Label><br /><br />
      <asp:Button runat="Server" ID="prevButton" Text="前一个"  />
      <asp:Button runat="Server" ID="playButton" Text="开  始"  />
      <asp:Button runat="Server" ID="nextButton" Text="后一个"  />
           
      <cc1:SlideShowExtender  ID="slideshowextend1" runat="server" 
                TargetControlID="Image1"
                SlideShowServiceMethod="GetSlides" 
                AutoPlay="true" 
                ImageDescriptionLabelID="imageDescription"
                NextButtonID="nextButton" 
                PlayButtonText="开始" 
                StopButtonText="停止"
                PreviousButtonID="prevButton" 
                PlayButtonID="playButton" 
                Loop="true" PlayInterval="2000">
     </cc1:SlideShowExtender>

    </div>
    </form>
</body>
</html>
