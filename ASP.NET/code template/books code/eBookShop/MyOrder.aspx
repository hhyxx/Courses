<%@ Page language="c#" Inherits="eBookShop.Migrated_MyOrder" CodeFile="MyOrder.aspx.cs" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>网上书店</title>
	</HEAD>
	<body>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0" runat="server">
			<tr>
				<td colSpan="2"><eBookShop:Header id="Header1" runat="server"></eBookShop:Header></td>
			</tr>
			<tr>
				<td valign="top" width="145">
					<span id="LogOutArea" runat="server">
						<eBookShop:Left id="Menu1" runat="server" />
					</span>
				</td>
				<td align="left" valign="top" width="700">
					<table align="center" width="100%" border="0">
						<tr valign="bottom">
							<td align="center">
								<font color="red">
									<asp:Label id="MyError" class="ErrorText" runat="Server" />
								</font>
								<table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
									<tr valign="top">
										<td width="100%">
											<asp:GridView id="MyList" width="90%" BorderColor="#CC9966" cellpadding="4" Font-Name="Verdana"
												Font-Size="8pt" ShowFooter="True" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="cartlistfooter"
												ItemStyle-CssClass="CartListItem" AlternatingRowStyle-CssClass="CartListItemAlt" AutoGenerateColumns="False"
												runat="server" Font-Names="Verdana" BorderStyle="None" BorderWidth="1px" BackColor="White">
												<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
												<AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
												<RowStyle ForeColor="#330099" CssClass="CartListItem" BackColor="White"></RowStyle>
												<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="CartListHead" BackColor="#990000"></HeaderStyle>
												<FooterStyle ForeColor="#330099" CssClass="cartlistfooter" BackColor="#FFFFCC"></FooterStyle>
												<Columns>
													<asp:BoundField DataField="OrderID" HeaderText="订单号"></asp:BoundField>
													<asp:BoundField DataField="OrderDate" HeaderText="订单时间" DataFormatString="{0:d}"></asp:BoundField>
													<asp:BoundField DataField="OrderTotal" HeaderText="订单总额" DataFormatString="{0:c}"></asp:BoundField>
													<asp:HyperLinkField Text="查询" DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="MyOrderItem.aspx?OrderID={0}"
														HeaderText="查询详细信息">
														<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
														<ItemStyle HorizontalAlign="Center"></ItemStyle>
														<FooterStyle HorizontalAlign="Center"></FooterStyle>
													</asp:HyperLinkField>
												</Columns>
												<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
											</asp:GridView>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
