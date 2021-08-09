<%@ Page language="c#" Inherits="eBookShop.MyOrderItem" CodeFile="MyOrderItem.aspx.cs" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="�û��ؼ�/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="�û��ؼ�/Left.ascx" %>
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
								<TABLE id="detailsTable" height="100%" cellSpacing="0" cellPadding="0" width="550" border="0"
									runat="server" EnableViewState="false">
									<TR vAlign="top">
										<TD class="Normal" width="100%"><BR>
											<B>���Ķ�������: </B>
											<asp:Label id="lblOrderNumber" runat="server" EnableViewState="false"></asp:Label><BR>
											<B>��������Ϊ: </B>
											<asp:Label id="lblOrderDate" runat="server" EnableViewState="false"></asp:Label><BR>
											<BR>
											<asp:GridView id="GridControl1" runat="server" BackColor="White" BorderWidth="1px" BorderStyle="None"
												Font-Names="Verdana" AutoGenerateColumns="False" AlternatingRowStyle-CssClass="CartListItemAlt"
												ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead"
												ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="4" BorderColor="#CC9966"
												width="100%">
												<FooterStyle ForeColor="#330099" CssClass="cartlistfooter" BackColor="#FFFFCC"></FooterStyle>
												<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
												<AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
												<RowStyle ForeColor="#330099" CssClass="CartListItem" BackColor="White"></RowStyle>
												<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="CartListHead" BackColor="#990000"></HeaderStyle>
												<Columns>
													<asp:BoundField DataField="ProductID" HeaderText="ͼ����"></asp:BoundField>
													<asp:BoundField DataField="ProductName" HeaderText="ͼ������"></asp:BoundField>
													<asp:BoundField DataField="UnitCost" HeaderText="�۸�" DataFormatString="{0:c}"></asp:BoundField>
													<asp:BoundField DataField="Quantity" HeaderText="����"></asp:BoundField>
													<asp:BoundField DataField="ExtendedAmount" HeaderText="С��" DataFormatString="{0:c}"></asp:BoundField>
												</Columns>
												<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
											</asp:GridView><BR>
											<B>�ܼ�: </B>
											<asp:Label id="lblTotal" runat="server" EnableViewState="false"></asp:Label></TD>
									</TR>
								</TABLE>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
