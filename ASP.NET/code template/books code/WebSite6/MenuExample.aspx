<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MenuExample.aspx.cs" Inherits="MenuExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       <asp:Menu ID="Menu1" runat="server"  
            EnableViewState="False" 
            DynamicHorizontalOffset="2" 
            DynamicVerticalOffset="5" 
            Target="_blank"
            Font-Names="Verdana" 
            Font-Size="Medium" 
            ForeColor="#FF3300" 
            BackColor="#99CCFF"          
            StaticSubMenuIndent="10px" Orientation="Horizontal" > 
           <StaticHoverStyle BackColor="#FFCCCC" ForeColor="white" />
           <StaticSelectedStyle   BackColor="#FFCC66"/>
           <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding ="2px" />
           <DynamicHoverStyle BackColor ="#990000" ForeColor ="White" />
           <DynamicMenuStyle BackColor ="#FFFBD6"  BorderColor ="#00C0C0"
            BorderStyle ="Solid" BorderWidth ="1px"
            HorizontalPadding ="10px" VerticalPadding ="2px" />
           <DynamicSelectedStyle BackColor ="#FFCC66" />
           <DynamicMenuItemStyle HorizontalPadding ="5px" ItemSpacing= "2px" />           
            <Items>
              <asp:MenuItem Text="学校介绍" NavigateUrl="~/MenuOne.aspx" >
              </asp:MenuItem>
              <asp:MenuItem Text="机构设置" Value="机构设置" >
                 <asp:MenuItem Text="人事处" NavigateUrl="~/MenuTwo1.aspx" Value="人事处" ></asp:MenuItem>
                 <asp:MenuItem Text="教务处" NavigateUrl="~/MenuTwo2.aspx" Value="教务处" ></asp:MenuItem>
                 <asp:MenuItem Text="学生处" NavigateUrl="~/MenuTwo3.aspx" Value="学生处"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="新闻" Value="新闻" >
                    <asp:MenuItem Text="动态信息" NavigateUrl="~/MenuThree1.aspx" Value="动态信息" ></asp:MenuItem>
                    <asp:MenuItem Text="学校公告" NavigateUrl="~/MenuThree2.aspx" Value="学校公告" ></asp:MenuItem>
                </asp:MenuItem>
            </Items>
       </asp:Menu>

    
    </div>
    </form>
</body>
</html>
