<%@ Register TagPrefix="eBookShop" TagName="Header" Src="�û��ؼ�/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="�û��ؼ�/Left.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.BookSearch" CodeFile="BookSearch.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�������</title>
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
					<table align="left" width="100%" border="0">
						<TBODY>
							<tr valign="top">
								<td align="left" colSpan="2">
									<BLOCKQUOTE>
										<P><FONT face="����">
												<FORM id="Form2" runat="server">
													<TABLE id="Table1" style="WIDTH: 432px; HEIGHT: 124px" borderColor="#ccccff" cellSpacing="0"
														cellPadding="0" width="432" bgColor="#f2f8ff" border="1">
														<TR>
															<TD align="center" width="134" bgColor="#cc6600" colSpan="2" height="13">
																<asp:label id="Label1" runat="server" Width="424px" Height="6px" Font-Size="Large">��������ѯ</asp:label></TD>
														</TR>
														<TR bgColor="#f2f8ff">
															<TD width="135" bgColor="#ffffcc"><FONT size="2"> ͼ������:</FONT>
															</TD>
															<TD bgColor="#ffffcc">
																<asp:textbox id="txtName" runat="server" Width="272px" Wrap="False" BorderStyle="Groove" ToolTip="������������ͼ������"></asp:textbox></TD>
														</TR>
														<TR>
															<TD width="135" bgColor="#ffffcc"><FONT color="#000000" size="2">���ߣ�</FONT></TD>
															<TD bgColor="#ffffcc">
																<asp:textbox id="txtAuthor" runat="server" Width="272px" Wrap="False" BorderStyle="Groove" ToolTip="����������������"></asp:textbox></TD>
														</TR>
														<TR>
															<TD width="135" bgColor="#ffffcc"><FONT size="2">����:</FONT></TD>
															<TD bgColor="#ffffcc">
																<asp:textbox id="txtTranslator" runat="server" Width="272px" BorderStyle="Groove" ToolTip="����������������"
																	MaxLength="50"></asp:textbox></TD>
														</TR>
														<TR>
															<TD width="135" bgColor="#ffffcc"><FONT size="2">�����磺</FONT></TD>
															<TD bgColor="#ffffcc">
																<asp:textbox id="txtPublisher" runat="server" Width="272px" BorderStyle="Groove" ToolTip="�����������������"
																	MaxLength="50"></asp:textbox></TD>
														</TR>
														<TR>
															<TD width="135" bgColor="#ffffcc"><FONT size="2"> ͼ������:</FONT></TD>
															<TD align="left" bgColor="#ffffcc">
																<asp:dropdownlist id="ListCat" runat="server" Width="272px"></asp:dropdownlist></TD>
														</TR>
														<TR bgColor="#f2f8ff">
															<TD align="center" width="135" bgColor="#ffffcc" height="18"></TD>
															<TD align="center" width="134" bgColor="#ffffcc" colSpan="2" height="18">
																<P align="center">
																	<asp:button id="SearchBtn" runat="server" Width="60px" Text="����" onclick="SearchBtn_Click"></asp:button>
																</P>
															</TD>
														</TR>
														<TR bgColor="#ffffff">
															<TD width="134" bgColor="#cc6600" colSpan="2">&nbsp;
																<asp:label id="lblInfo" runat="server" Width="272px" Font-Size="Large" Visible="False" ForeColor="Black"></asp:label></TD>
														</TR>
													</TABLE>
												</FORM>
											</FONT>
										</P>
									</BLOCKQUOTE>
								</td>
							</tr>
						</TBODY>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
