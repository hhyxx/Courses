<%@ Page language="c#" Inherits="eBookShop.UserChangePW" CodeFile="UserChangePWD.aspx.cs" %>
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
							<td align="center">
								<form id="Form1" runat="server" method="post">
									<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="2" bordercolor="#ffcc66">
										<TR bgcolor="#ffcc66">
											<TD noWrap colSpan="3"><FONT face="����">�޸�����</FONT>
												<asp:Label id="Message" runat="server" ForeColor="Red"></asp:Label></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="����">����������룺</FONT></TD>
											<TD noWrap>
												<asp:TextBox id="OldPwd" runat="server" TextMode="Password"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="OldPwd"></asp:RequiredFieldValidator></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="����">�����������룺</FONT></TD>
											<TD noWrap>
												<asp:TextBox id="NewPwd" runat="server" TextMode="Password"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="NewPwd"></asp:RequiredFieldValidator></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="����">ȷ�������룺</FONT></TD>
											<TD noWrap>
												<asp:TextBox id="ConfirmNew" runat="server" TextMode="Password"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ConfirmNew"></asp:RequiredFieldValidator>
												<asp:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="�������벻ͬ" ControlToValidate="ConfirmNew"
													ControlToCompare="NewPwd"></asp:CompareValidator></TD>
										</TR>
										<TR>
											<TD noWrap colSpan="3" align="center">
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
