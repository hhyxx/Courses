<%@ Page language="c#" Inherits="eBookShop.ManBookType" CodeFile="ManBookType.aspx.cs" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="�û��ؼ�/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="�û��ؼ�/Header.ascx" %>
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
					<table align="center" width="100%" border="0">
						<tr valign="bottom">
							<td align="center"><FONT face="����">
									<FORM id="Form2" runat="server">
										<P>&nbsp;</P>
										<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="0">
											<TR>
												<TD noWrap align="center" bgColor="#ffcc66" colSpan="3">
													<asp:Label id="MyError" runat="server" ForeColor="#C00000"></asp:Label></TD>
											</TR>
											<TR>
												<TD noWrap align="center" bgColor="#ffcc66" colSpan="3"><FONT face="����">����ͼ������</FONT></TD>
											</TR>
											<TR>
												<TD noWrap><FONT face="����">ͼ���������ƣ�</FONT></TD>
												<TD noWrap>
													<asp:TextBox id="CategoryName" runat="server"></asp:TextBox></TD>
												<TD noWrap>
													<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="CategoryName" ErrorMessage="*"></asp:RequiredFieldValidator></TD>
											</TR>
											<TR>
												<TD noWrap align="center" colSpan="3"><FONT face="����">
														<asp:Button id="Add" runat="server" Text="���" Width="56px" onclick="Add_Click"></asp:Button></FONT></TD>
											</TR>
											<TR>
												<TD noWrap align="center" bgColor="#ffcc66" colSpan="3"><FONT face="����">ɾ��ͼ������</FONT></TD>
											</TR>
											<TR>
												<TD noWrap align="center" colSpan="3"><FONT face="����">
														<asp:DropDownList id="ListCat" runat="server"></asp:DropDownList></FONT></TD>
											</TR>
											<TR>
												<TD noWrap align="center" colSpan="3"><FONT face="����">
														<asp:Button id="Delete" runat="server" Text="ɾ��" Width="56px" CausesValidation="False" onclick="Delete_Click"></asp:Button></FONT></TD>
											</TR>
										</TABLE>
									</FORM>
								</FONT>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
