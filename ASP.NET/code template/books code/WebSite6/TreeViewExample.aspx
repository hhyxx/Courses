<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeViewExample.aspx.cs" Inherits="TreeViewExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       <asp:TreeView ID="TreeView1" runat="server"  Target ="_blank"  Height ="376px" 
            Width ="165px" ShowLines="True">
            <Nodes>
               <asp:TreeNode Text="2008级班级管理" Value="2008级班级管理">
                   <asp:TreeNode Text="08信息管理系" Value="08信息管理系">
                        <asp:TreeNode Text="信管08-1班" Value="信管08-1班" NavigateUrl="~/InformationManage_class1.aspx" >
                        </asp:TreeNode>
                        <asp:TreeNode Text="信管08-2班" Value="信管08-2班" NavigateUrl="~/InformationManage_class2.aspx" >
                        </asp:TreeNode>
                        <asp:TreeNode Text="信管08-3班" Value="信管08-3班"                             NavigateUrl="~/InformationManage_class3.aspx">
</asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="08外语系" Value="08外语系">
                        <asp:TreeNode Text="外语08-1班" Value="外语08-1班"                             NavigateUrl="~/ForeignLanguage_class1.aspx">
</asp:TreeNode>
                        <asp:TreeNode Text="外语08-2班" Value="外语08-2班"                             NavigateUrl="~/ForeignLanguage_class2.aspx">
</asp:TreeNode>
                        <asp:TreeNode Text="外语08-3班" Value="外语08-3班"                             NavigateUrl="~/ForeignLanguage_class3.aspx">
</asp:TreeNode>
                    </asp:TreeNode>
                </asp:TreeNode>
               <asp:TreeNode Text="2007级班级管理" Value="2007级班级管理">
                  <asp:TreeNode Text="07信息管理系" Value="07信息管理系">
</asp:TreeNode>
                  <asp:TreeNode Text="07外语系" Value="07外语系">
</asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
 </asp:TreeView>

    
    </div>
    </form>
</body>
</html>
