<%@ Reference Page="~/UserLogout.aspx" %>
<%@ Control Language="c#" Inherits="eBookShop.自定义控件.Header" CodeFile="Header.ascx.cs" %>
<table cellspacing="0" cellpadding="0" width="100%" height="49" border="0">
</table>
<table cellspacing="0" cellpadding="0"  width="100%" height="38" background="Images/top_stripe2.gif"
	border="0" bgColor="#ffa500">
	<form id="search" method="get" action="Search.aspx">
		<TBODY>
			<tr>
				<td align="right" nowrap>
					<span id="Home" runat="server"><a href="Default.aspx">主 页</a> </span><span id="Login" runat="server">
						<a href="UserLogin.aspx">登 录</a></span> <span id="ChangeInfo" runat="server"><a href="UserInfo.aspx">
							修改信息</a></span><span id="Pwd" runat="server"><a href="UserChangePWD.aspx"> 修改密码</a></span>
					<span id="MyShopCart" runat="server"><a href="MyShopCart.aspx">我的购物车</a></span> <span id="MyOrder" runat="server">
						<a href="MyOrder.aspx">我的订单</a></span> <span id="BookType" runat="server"><a href="ManBookType.aspx">
							图书类别管理</a></span> <span id="BookAdd" runat="server"><a href="ManBookInfo.aspx">增加图书</a></span>
					<span id="BookInfo" runat="server"><a href="ManBookList.aspx">图书信息管理</a></span> <span id="Order" runat="server">
						<a href="ManOrder.aspx">订单管理</a></span> <span id="UserInfo" runat="server"><a href="ManUser.aspx">
							用户信息管理</a></span> <span id="Sales" runat="server"><a href="ManSales.aspx">销售信息查询</a></span>&nbsp;<a href="BookSearch.aspx">搜 
						索</a>&nbsp;<span id="Logout" runat="server"> <a href="UserLogout.aspx">注 销</a></span>
				</td>
			</tr>
		</TBODY>
	</form>
</table>
<table cellspacing="0" cellpadding="0" width="100%" height="35" background="Images/top_stripe3.gif"
	border="0">
	<tr>
		<span id="areaNoMenu"><FONT face="宋体"></FONT>
			<td valign="top"><FONT face="宋体"></FONT></td>
		</span>
	</tr>
</table>
