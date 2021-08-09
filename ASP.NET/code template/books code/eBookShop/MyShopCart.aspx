<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.Migrated_MyShopCart" CodeFile="MyShopCart.aspx.cs" %>
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
											<asp:Label id="MyError" class="ErrorText" EnableViewState="false" runat="Server" />
										</font>
										<asp:panel id="DetailsPanel" runat="server">
											<IMG height="1" src="images/1x1.gif" width="50" align="left">
											<TABLE height="100%" cellSpacing="0" cellPadding="0" width="550" border="0">
												<TR vAlign="top">
													<TD width="550">
														<asp:GridView id="MyList" runat="server" Font-Names="Verdana" BackColor="White" BorderWidth="1px"
															BorderStyle="None" Width="90%" BorderColor="#CC9966" cellpadding="4" Font-Name="Verdana" Font-Size="8pt"
															ShowFooter="True" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="CartListFooter"
															ItemStyle-CssClass="CartListItem" AlternatingRowStyle-CssClass="CartListItemAlt" DataKeyField="Quantity"
															AutoGenerateColumns="False">
															<FooterStyle ForeColor="#330099" CssClass="CartListFooter" BackColor="#FFFFCC"></FooterStyle>
															<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
															<AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
															<RowStyle ForeColor="#330099" CssClass="CartListItem" BackColor="White"></RowStyle>
															<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="CartListHead" BackColor="#990000"></HeaderStyle>
															<Columns>
																<asp:TemplateField HeaderText="图书编号">
																	<ItemTemplate>
																		<asp:Label id="BookId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProductId") %>' />
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:HyperLinkField DataNavigateUrlFields="productID" DataNavigateUrlFormatString="BookInfo.aspx?BookId={0}"
																	DataTextField="productName" HeaderText="图书名称">
																	<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																</asp:HyperLinkField>
																<asp:BoundField DataField="ProductPrice" HeaderText="价格" DataFormatString="{0:c}"></asp:BoundField>
																<asp:TemplateField HeaderText="数量">
																	<ItemTemplate>
																		<asp:TextBox id=Quantity runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>' width="40px" MaxLength="3" Columns="4">
																		</asp:TextBox>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:BoundField DataField="ExtendedAmount" HeaderText="小计" DataFormatString="{0:c}"></asp:BoundField>
																<asp:TemplateField HeaderText="删除">
																	<ItemTemplate>
																		<center>
																			<asp:CheckBox id="Remove" runat="server" />
																		</center>
																	</ItemTemplate>
																</asp:TemplateField>
															</Columns>
															<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
														</asp:GridView><SPAN class="NormalBold">总计: 
                  </SPAN>
														<asp:Label class="NormalBold" id="lblTotal" runat="server" EnableViewState="false"></asp:Label><BR>
														<BR>
														<asp:button id="UpdateBtn" runat="server" Text="更新购物车" onclick="UpdateBtn_Click"></asp:button><IMG height="1" src="Images/1x1.gif" width="15">
														<asp:button id="CheckoutBtn" runat="server" Width="96px" Text="结算" onclick="CheckoutBtn_Click"></asp:button><BR>
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
