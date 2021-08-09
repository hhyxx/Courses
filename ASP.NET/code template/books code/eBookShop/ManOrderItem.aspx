<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.ManOrderItem" CodeFile="ManOrderItem.aspx.cs" %>
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
					<table align="center" width="100%" border="0" runat="server">
						<tr valign="bottom">
							<td align="center">
								<font color="red">
									<asp:Label id="MyError" class="ErrorText" runat="Server" />
								</font>
								<table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
									<tr valign="top">
										<td width="100%">
											<P><B>订单号是: </B>
												<asp:Label id="lblOrderNumber" runat="server" EnableViewState="false"></asp:Label><BR>
												<B>订单日期为: </B>
												<asp:Label id="lblOrderDate" runat="server" EnableViewState="false"></asp:Label></P>
											<asp:GridView id="GridControl1" runat="server" BackColor="White" BorderWidth="1px" BorderStyle="None"
												Font-Names="Verdana" AutoGenerateColumns="False" AlternatingRowStyle-CssClass="CartListItemAlt"
												ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead"
												ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="4" BorderColor="#CC9966"
												width="550px" Height="168px">
												<FooterStyle ForeColor="#330099" CssClass="cartlistfooter" BackColor="#FFFFCC"></FooterStyle>
												<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
												<AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
												<RowStyle ForeColor="#330099" CssClass="CartListItem" BackColor="White"></RowStyle>
												<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="CartListHead" BackColor="#990000"></HeaderStyle>
												<Columns>
													<asp:BoundField DataField="ProductID" HeaderText="图书编号"></asp:BoundField>
													<asp:BoundField DataField="ProductName" HeaderText="图书名称"></asp:BoundField>
													<asp:BoundField DataField="UnitCost" HeaderText="价格" DataFormatString="{0:c}"></asp:BoundField>
													<asp:BoundField DataField="Quantity" HeaderText="数量"></asp:BoundField>
													<asp:BoundField DataField="ExtendedAmount" HeaderText="小计" DataFormatString="{0:c}"></asp:BoundField>
												</Columns>
												<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
											</asp:GridView><BR>
											<B>总计: </B>
											<asp:Label id="lblTotal" runat="server" EnableViewState="false"></asp:Label>
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
