<%@ Register TagPrefix="eBookShop" TagName="Header" Src="�û��ؼ�/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="�û��ؼ�/Left.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.BookSearchResult" CodeFile="BookSearchResult.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�������</title>
	</HEAD>
	<body>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td colSpan="0" width="100%"><eBookShop:header id="Header" ></eBookShop:header></td>
			</tr>
		</table>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0" >
			<tr>
				<td valign="top" colSpan="0"><eBookShop:Left id="BookCategory" runat="server"></eBookShop:Left></td>
				<td align="left" valign="top" width="700">
					<table align="left" width="100%" border="0" >
						<FORM id="Form1" runat="server">
							<TBODY>
								<tr valign="top">
									<td align="left" colSpan="2">
										<BLOCKQUOTE>
											<P><FONT face="����">
													<asp:GridView id="GridView1" runat="server" Height="272px" AutoGenerateColumns="False" AllowSorting="True"
														BorderColor="#CC9966" AllowPaging="True" DataKeyField="ProductName" CssClass="td" Width="577px"
														BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="4">
														<FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
														<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
														<RowStyle ForeColor="#330099" BackColor="White"></RowStyle>
														<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="tttable" BackColor="#990000"></HeaderStyle>
														<Columns>
															<asp:HyperLinkField Text="ProductName" DataNavigateUrlFields="ProductName" DataNavigateUrlFormatString="BookInfo.aspx?bookid={0}"
																DataTextField="ProductName" SortExpression="ProductName" HeaderText="ͼ������" NavigateUrl="ProductName"></asp:HyperLinkField>
															<asp:BoundField DataField="CategoryId" SortExpression="CategoryId" HeaderText="ͼ������"></asp:BoundField>
															<asp:BoundField DataField="Author" SortExpression="Author" HeaderText="����"></asp:BoundField>
															<asp:BoundField DataField="Translator" SortExpression="Translator" HeaderText="����"></asp:BoundField>
															<asp:BoundField DataField="Press" SortExpression="Press" HeaderText="������"></asp:BoundField>
															<asp:BoundField DataField="ProductPrice" SortExpression="ProductPrice" HeaderText="�۸�"></asp:BoundField>
														</Columns>
														<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
													</asp:GridView></FONT></P>
										</BLOCKQUOTE>
									</td>
								</tr>
							</TBODY>
						</FORM>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
