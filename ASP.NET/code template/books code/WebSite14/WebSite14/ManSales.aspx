<%@ Page language="c#" Inherits="eBookShop.manSales" CodeFile="ManSales.aspx.cs" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>网上书店</title>
	</HEAD>
	<body>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td colSpan="0"><eBookShop:header id="Header" runat="server"></eBookShop:header></td>
			</tr>
		</table>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td valign="top" colSpan="0"><eBookShop:Left id="BookCategory" runat="server"></eBookShop:Left></td>
				<td align="left" valign="top" width="700">
					<table align="center" width="100%" border="0">
						<tr valign="bottom">
							<td align="center">
								<FORM id="Form3" method="post" runat="server">
									<TABLE id="Table1" style="WIDTH: 552px; HEIGHT: 276px" cellSpacing="1" cellPadding="1"
										width="552" align="left" border="0">
										<TR>
											<TD colSpan="3">
												<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR>
														<TD class="ContentHead">查询销售信息
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD noWrap width="302">
												<asp:DropDownList id="Year" runat="server"></asp:DropDownList><FONT face="宋体">年</FONT>
												<asp:DropDownList id="Month" runat="server"></asp:DropDownList><FONT face="宋体">月</FONT>
												<asp:DropDownList id="Day" runat="server"></asp:DropDownList><FONT face="宋体">日</FONT></TD>
										</TR>
										<TR>
											<TD noWrap colSpan="2"><FONT face="宋体">
													<asp:Button id="QueryMonth" runat="server" Text="查询月销售情况" onclick="QueryMonth_Click"></asp:Button>
													<asp:Button id="QueryDay" runat="server" Text="查询日销售情况" onclick="QueryDay_Click"></asp:Button></FONT></TD>
											<TD></FONT><FONT face="宋体"></FONT></TD>
										</TR>
										<TR>
											<TD noWrap colSpan="3"><FONT face="宋体">
													<asp:GridView id="GridSails" runat="server" width="90%" BorderColor="#CC9966" cellpadding="4"
														Font-Name="Verdana" Font-Size="8pt" ShowFooter="True" HeaderStyle-CssClass="CartListHead"
														FooterStyle-CssClass="cartlistfooter" ItemStyle-CssClass="CartListItem" AlternatingRowStyle-CssClass="CartListItemAlt"
														AutoGenerateColumns="False" DataKeyField="productID" Font-Names="Verdana" BackColor="White"
														BorderStyle="None" BorderWidth="1px">
														<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
														<AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
														<RowStyle ForeColor="#330099" CssClass="CartListItem" BackColor="White"></RowStyle>
														<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="CartListHead" BackColor="#990000"></HeaderStyle>
														<FooterStyle ForeColor="#330099" CssClass="cartlistfooter" BackColor="#FFFFCC"></FooterStyle>
														<Columns>
															<asp:BoundField DataField="productId" HeaderText="图书编号">
																<HeaderStyle Wrap="False"></HeaderStyle>
																<ItemStyle Wrap="False"></ItemStyle>
																<FooterStyle Wrap="False"></FooterStyle>
															</asp:BoundField>
															<asp:BoundField DataField="productName" HeaderText="图书名称">
																<HeaderStyle Wrap="False"></HeaderStyle>
																<ItemStyle Wrap="False"></ItemStyle>
																<FooterStyle Wrap="False"></FooterStyle>
															</asp:BoundField>
															<asp:BoundField DataField="orderCount" HeaderText="相关订单数">
																<HeaderStyle Wrap="False"></HeaderStyle>
																<ItemStyle Wrap="False"></ItemStyle>
																<FooterStyle Wrap="False"></FooterStyle>
															</asp:BoundField>
															<asp:BoundField DataField="quantity" HeaderText="售出数量">
																<HeaderStyle Wrap="False"></HeaderStyle>
																<ItemStyle Wrap="False"></ItemStyle>
																<FooterStyle Wrap="False"></FooterStyle>
															</asp:BoundField>
															<asp:BoundField DataField="money" HeaderText="销售收入">
																<HeaderStyle Wrap="False"></HeaderStyle>
																<ItemStyle Wrap="False"></ItemStyle>
																<FooterStyle Wrap="False"></FooterStyle>
															</asp:BoundField>
														</Columns>
														<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
													</asp:GridView></FONT></TD>
										</TR>
									</TABLE>
								</FORM>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
