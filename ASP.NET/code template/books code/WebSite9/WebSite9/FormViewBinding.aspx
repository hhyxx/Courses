<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormViewBinding.aspx.cs" Inherits="WebSite9.FormViewBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>  
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="no" 
DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4"   ForeColor="#333333" Width="231px">
<PagerSettings Mode="NextPreviousFirstLast" NextPageText="下一页&amp;gt;"                PreviousPageText="上一页&amp;lt;" />
<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
<EditItemTemplate>
  <table style="width:100%;">
    <tr>
      <td width="40%"><asp:Label ID="Label1" runat="server" Text="学号" Width="100%"></asp:Label> </td>
      <td width="60%"><asp:Label ID="noLabel1" runat="server" Text='<%# Eval("No") %>' /></td> 
   </tr>
   <tr>
      <td width="40%"><asp:Label ID="Label2" runat="server" Text="姓名" Width="100%"></asp:Label> </td>
      <td width="60%"><asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("Name") %>' /></td> 
   </tr>
   <tr>
       <td width="40%"><asp:Label ID="Label3" runat="server" Text="出生日期" Width="100%"></asp:Label> </td>
      <td width="60%"> <asp:TextBox ID="birthTextBox" runat="server" Text='<%# Bind("birthday") %>' /></td> 
 </tr>
   <tr>
      <td width="40%"><asp:Label ID="Label4" runat="server" Text="地址" Width="100%"></asp:Label> </td>
      <td width="60%"><asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("Adress") %>' /></td>
   </tr> 
   <tr>
       <td width="40%"> </td>
       <td width="60%" align="center">
         <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
       </td> 
  </tr>
    </table>
     </EditItemTemplate>
     <InsertItemTemplate>
       <table style="width:100%;"> 
         <tr>
           <td width="40%"><asp:Label ID="Label2" runat="server" Text="姓名" Width="100%"></asp:Label> </td>
           <td width="60%"><asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("Name") %>' /></td> 
        </tr>
        <tr>
           <td width="40%"><asp:Label ID="Label3" runat="server" Text="出生日期" Width="100%"></asp:Label> </td>
           <td width="60%"><asp:TextBox ID="birthTextBox" runat="server" Text='<%# Bind("birthday") %>' /></td> 
       </tr>
       <tr>
            <td width="40%"><asp:Label ID="Label4" runat="server" Text="地址" Width="100%"></asp:Label> </td>
            <td width="60%"><asp:TextBox ID="addressTextBox" runat="server" 
Text='<%# Bind("Adress") %>' /></td> 
      </tr> 
      <tr>
            <td width="40%"> </td>
            <td width="60%" align="center">
              <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"  CommandName="Insert" Text="插入" />
              <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </td> 
      </tr>
         </table>
         </InsertItemTemplate>
         <ItemTemplate>
           <table style="width:100%;">
              <tr>
                <td width="40%"><asp:Label ID="Label1" runat="server" Text="学号" Width="100%"></asp:Label> </td>
                <td width="60%"><asp:Label ID="noLabel" runat="server" Text='<%# Eval("No") %>' /></td> 
             </tr>
             <tr>
                <td width="40%"><asp:Label ID="Label2" runat="server" Text="姓名" Width="100%"></asp:Label> </td>
                <td width="60%"><asp:Label ID="nameLabel" runat="server" Text='<%# Bind("Name") %>' /></td> 
             </tr>
             <tr>
                <td width="40%"><asp:Label ID="Label3" runat="server" Text="出生日期" Width="100%"></asp:Label> </td>
                <td width="60%"><asp:Label ID="birthLabel" runat="server" Text='<%# Bind("birthday") %>' /></td> 
             </tr>
             <tr>
                 <td width="40%"><asp:Label ID="Label4" runat="server" Text="地址" Width="100%"></asp:Label> </td>
                <td width="60%"><asp:Label ID="addressLabel" runat="server" 
Text='<%# Bind("Adress") %>' /></td> 
            </tr> 
            <tr>
               <td width="40%"> </td>
               <td width="60%" align="right">
               <asp:LinkButton ID="NewButton" runat="server" CausesValidation="True"  CommandName="New" Text="新建" />
               <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="更新" />
               <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" />
               </td> 
            </tr>
         </table>
    </ItemTemplate>
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
     <HeaderTemplate>
          学生详细信息
     </HeaderTemplate>
</asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\MyDatabase.mdf;Integrated Security=True" DeleteCommand="DELETE FROM student WHERE (NO = @no)" InsertCommand="INSERT INTO student(Name, birthday, Adress) VALUES (@Name,@birthday,@Adress)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [student]" UpdateCommand="UPDATE student SET Name = @Name,birthday=@birthday,Adress=@Adress where No=@No">
            <DeleteParameters>
                <asp:Parameter DefaultValue="NO" Name="no" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="birthday" />
                <asp:Parameter Name="Adress" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="No" />
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="birthday" />
                <asp:Parameter Name="Adress" />
            </UpdateParameters>
        </asp:SqlDataSource>
</div>
    </form>
</body>
</html>
