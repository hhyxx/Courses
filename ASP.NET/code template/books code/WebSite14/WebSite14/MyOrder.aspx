<%@ Page language="c#" Inherits="eBookShop.Migrated_MyOrder" CodeFile="MyOrder.aspx.cs" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="�û��ؼ�/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="�û��ؼ�/Header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�������</title>
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
													<asp:BoundField DataField="OrderID" HeaderText="������"></asp:BoundField>
													<asp:BoundField DataField="OrderDate" HeaderText="����ʱ��" DataFormatString="{0:d}"></asp:BoundField>
													<asp:BoundField DataField="OrderTotal" HeaderText="�����ܶ�" DataFormatString="{0:c}"></asp:BoundField>
													<asp:HyperLinkField Text="��ѯ" DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="MyOrderItem.aspx?OrderID={0}"
														HeaderText="��ѯ��ϸ��Ϣ">
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
