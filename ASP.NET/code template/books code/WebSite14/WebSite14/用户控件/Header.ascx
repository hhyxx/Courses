<%@ Reference Page="~/UserLogout.aspx" %>
<%@ Control Language="c#" Inherits="eBookShop.�Զ���ؼ�.Header" CodeFile="Header.ascx.cs" %>
<table cellspacing="0" cellpadding="0" width="100%" height="49" border="0">
</table>
<table cellspacing="0" cellpadding="0"  width="100%" height="38" background="Images/top_stripe2.gif"
	border="0" bgColor="#ffa500">
	<form id="search" method="get" action="Search.aspx">
		<TBODY>
			<tr>
				<td align="right" nowrap>
					<span id="Home" runat="server"><a href="Default.aspx">�� ҳ</a> </span><span id="Login" runat="server">
						<a href="UserLogin.aspx">�� ¼</a></span> <span id="ChangeInfo" runat="server"><a href="UserInfo.aspx">
							�޸���Ϣ</a></span><span id="Pwd" runat="server"><a href="UserChangePWD.aspx"> �޸�����</a></span>
					<span id="MyShopCart" runat="server"><a href="MyShopCart.aspx">�ҵĹ��ﳵ</a></span> <span id="MyOrder" runat="server">
						<a href="MyOrder.aspx">�ҵĶ���</a></span> <span id="BookType" runat="server"><a href="ManBookType.aspx">
							ͼ��������</a></span> <span id="BookAdd" runat="server"><a href="ManBookInfo.aspx">����ͼ��</a></span>
					<span id="BookInfo" runat="server"><a href="ManBookList.aspx">ͼ����Ϣ����</a></span> <span id="Order" runat="server">
						<a href="ManOrder.aspx">��������</a></span> <span id="UserInfo" runat="server"><a href="ManUser.aspx">
							�û���Ϣ����</a></span> <span id="Sales" runat="server"><a href="ManSales.aspx">������Ϣ��ѯ</a></span>&nbsp;<a href="BookSearch.aspx">�� 
						��</a>&nbsp;<span id="Logout" runat="server"> <a href="UserLogout.aspx">ע ��</a></span>
				</td>
			</tr>
		</TBODY>
	</form>
</table>
<table cellspacing="0" cellpadding="0" width="100%" height="35" background="Images/top_stripe3.gif"
	border="0">
	<tr>
		<span id="areaNoMenu"><FONT face="����"></FONT>
			<td valign="top"><FONT face="����"></FONT></td>
		</span>
	</tr>
</table>
