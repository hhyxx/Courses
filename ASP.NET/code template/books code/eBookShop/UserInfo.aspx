<%@ Page language="c#" Inherits="eBookShop.Migrated_UserInfo" CodeFile="UserInfo.aspx.cs" %>
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
								<form id="Form1" method="post" runat="server">
									<TABLE id="Table1" borderColor="#ffcc66" height="212" cellSpacing="1" cellPadding="1" width="402"
										border="2">
										<TR bgColor="#ffcc66">
											<TD noWrap colSpan="3"><FONT face="����">��д�û�����</FONT>
												<asp:label id="Message" runat="server" ForeColor="Red"></asp:label></TD>
										</TR>
										<TR>
											<TD noWrap width="118" height="37"><FONT face="����">��ʵ������</FONT></TD>
											<TD noWrap height="37"><asp:textbox id="RealName" runat="server"></asp:textbox></TD>
										</TR>
										<TR>
											<TD noWrap width="118"><FONT face="����">���⣺</FONT></TD>
											<TD noWrap>
												<asp:textbox id="Question" runat="server"></asp:textbox></TD>
										</TR>
										<TR>
											<TD noWrap width="118"><FONT face="����">�𰸣�</FONT></TD>
											<TD noWrap>
												<asp:textbox id="Answer" runat="server"></asp:textbox></TD>
										<TR>
											<TD noWrap width="118"><FONT face="����">Email��</FONT></TD>
											<TD noWrap><asp:textbox id="Email" Runat="server"></asp:textbox></TD>
										<TR>
											<TD noWrap align="center" colSpan="3">
												<asp:Button id="Submit" runat="server" Width="56px" Text="�ύ" onclick="Submit_Click"></asp:Button></TD>
										</TR>
									</TABLE>
								</form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
