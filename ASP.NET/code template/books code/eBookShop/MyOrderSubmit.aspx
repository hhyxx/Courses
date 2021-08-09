<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.BookCheckOut" CodeFile="MyOrderSubmit.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>网上书店</title>
	</HEAD>
	<body>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td colSpan="0"><ebookshop:header id="Header" runat="server"></ebookshop:header></td>
			</tr>
		</table>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0" runat="server">
			<tr>
				<td valign="top" colSpan="0"><eBookShop:Left id="BookCategory" runat="server"></eBookShop:Left></td>
				<td align="left" valign="top" width="700">
					<table align="center" width="100%" border="0">
						<TBODY>
							<tr valign="bottom">
								<form id="Form1" method="post" runat="server">
									<td align="center">
										<font color="red">
											<asp:Label id="Message" runat="server">请确认您提交的购物记录是否正确</asp:Label>
										</font>
										<asp:panel id="DetailsPanel" runat="server">
											<IMG height="1" src="images/1x1.gif" width="50" align="left">
											<TABLE height="100%" cellSpacing="0" cellPadding="0" width="550" border="0">
												<TR vAlign="top">
													<TD width="550"><SPAN class="NormalBold">
<asp:GridView id="MyGridView" runat="server" width="90%" AutoGenerateColumns="False" AlternatingRowStyle-CssClass="CartListItemAlt"
																ItemStyle-CssClass="CartListItem"
																FooterStyle-CssClass="cartlistfooter"
																HeaderStyle-CssClass="CartListHead"
																ShowFooter="True" Font-Size="8pt"
																Font-Name="Verdana" cellpadding="4"
																BorderColor="#CC9966" BorderStyle="None"
																BorderWidth="1px" BackColor="White"
																Font-Names="Verdana">
																<FooterStyle ForeColor="#330099" CssClass="cartlistfooter" BackColor="#FFFFCC"></FooterStyle>
																<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
																<AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
																<RowStyle ForeColor="#330099" CssClass="CartListItem" BackColor="White"></RowStyle>
																<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="CartListHead" BackColor="#990000"></HeaderStyle>
																<Columns>
																	<asp:BoundField DataField="ProductID" HeaderText="图书编号"></asp:BoundField>
																	<asp:BoundField DataField="ProductName" HeaderText="图书名称"></asp:BoundField>
																	<asp:BoundField DataField="ProductPrice" HeaderText="价格" DataFormatString="{0:c}"></asp:BoundField>
																	<asp:BoundField DataField="Quantity" HeaderText="数量"></asp:BoundField>
																	<asp:BoundField DataField="ExtendedAmount" HeaderText="小计" DataFormatString="{0:c}"></asp:BoundField>
																</Columns>
																<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
															</asp:GridView>总计: </SPAN>
														<asp:Label id="TotalLbl" runat="server"></asp:Label><BR>
														<BR>
														<asp:Button id="SubmitBtn" runat="server" Text="提交" Width="56px" onclick="SubmitBtn_Click"></asp:Button><BR>
													</TD>
												</TR>
											</TABLE>
										</asp:panel>
									</td>
								</form>
							</tr>
						</TBODY>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
