<%@ Page language="c#" Inherits="eBookShop.UserChangePW" CodeFile="UserChangePWD.aspx.cs" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
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
								<form id="Form1" runat="server" method="post">
									<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="2" bordercolor="#ffcc66">
										<TR bgcolor="#ffcc66">
											<TD noWrap colSpan="3"><FONT face="宋体">修改密码</FONT>
												<asp:Label id="Message" runat="server" ForeColor="Red"></asp:Label></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">请输入旧密码：</FONT></TD>
											<TD noWrap>
												<asp:TextBox id="OldPwd" runat="server" TextMode="Password"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="OldPwd"></asp:RequiredFieldValidator></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">请输入新密码：</FONT></TD>
											<TD noWrap>
												<asp:TextBox id="NewPwd" runat="server" TextMode="Password"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="NewPwd"></asp:RequiredFieldValidator></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">确认新密码：</FONT></TD>
											<TD noWrap>
												<asp:TextBox id="ConfirmNew" runat="server" TextMode="Password"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ConfirmNew"></asp:RequiredFieldValidator>
												<asp:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="两次密码不同" ControlToValidate="ConfirmNew"
													ControlToCompare="NewPwd"></asp:CompareValidator></TD>
										</TR>
										<TR>
											<TD noWrap colSpan="3" align="center">
												<asp:Button id="Submit" runat="server" Width="56px" Text="提交" onclick="Submit_Click"></asp:Button></TD>
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
