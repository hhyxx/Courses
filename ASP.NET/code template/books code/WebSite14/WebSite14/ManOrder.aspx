<%@ Page language="c#" Inherits="eBookShop.ManOrder" CodeFile="ManOrder.aspx.cs" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="�û��ؼ�/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="�û��ؼ�/Left.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�������</title>
	</HEAD>
	<body>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td colSpan="0"><ebookshop:header id="Header" runat="server"></ebookshop:header></td>
			</tr>
		</table>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td vAlign="top" colSpan="0"><ebookshop:left id="BookCategory" runat="server"></ebookshop:left></td>
				<td vAlign="top" align="left" width="700">
					<table width="100%" align="center" border="0">
						<tr vAlign="bottom">
							<td align="center">
								<FORM id="Form3" method="post" runat="server">
									<TABLE id="Table1" style="WIDTH: 552px; HEIGHT: 276px" cellSpacing="1" cellPadding="1"
										width="552" align="left" border="0">
										<TR>
											<TD colSpan="3" height="30">
												<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR>
														<TD class="ContentHead">������&nbsp;
														</TD>
													</TR>
												</TABLE>
												<asp:label id="Message" runat="server" ForeColor="#C00000"></asp:label></TD>
										</TR>
										<TR>
											<TD align="center" colSpan="3" height="36"><FONT face="����">
                                                <asp:GridView id="GridView1" runat="server" Font-Size="10pt" CellPadding="4" 
                                                    Width="544px" AllowPaging="True"
														AllowSorting="True" CssClass="td" Height="168px" BorderColor="Maroon" AutoGenerateColumns="False" 
                                                    DataKeyField="OrderId" BackColor="White" BorderStyle="None"
														BorderWidth="1px" onpageindexchanging="GridView1_PageIndexChanged" onrowediting="GridView1_EditCommand">
														<FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
														<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
														<RowStyle ForeColor="#330099" BackColor="White"></RowStyle>
														<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="tttable" BackColor="#990000"></HeaderStyle>
														<Columns>
															<asp:HyperLinkField Text="OrderId" DataNavigateUrlFields="OrderId" DataNavigateUrlFormatString="ManOrderItem.aspx?orderId={0}"
																DataTextField="OrderId" HeaderText="��������" NavigateUrl="OrderId"></asp:HyperLinkField>
															<asp:BoundField DataField="OrderDate" HeaderText="����ʱ��"></asp:BoundField>
															<asp:BoundField DataField="UserId" HeaderText="�û�����"></asp:BoundField>
															<asp:BoundField DataField="Status" HeaderText="״̬"></asp:BoundField>
												
															<asp:ButtonField Text="&lt;img src=img/Deal.gif border=0 alt=Deal /&gt;" HeaderText="����" CommandName="Edit"></asp:ButtonField>
														</Columns>
														<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
													</asp:GridView></FONT></TD>
										</TR>
										<TR>
											<TD noWrap colSpan="3"><FONT face="����"></FONT></TD>
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
