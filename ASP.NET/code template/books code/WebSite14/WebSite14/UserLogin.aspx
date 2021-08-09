<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.Migrated_Login" CodeFile="UserLogin.aspx.cs" %>
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
				<td valign="top" width="145"></td>
				<td align="left" valign="top" width="700">
					<table align="left" width="100%" border="0">
						<tr valign="top">
							<td align="left">
								<table align="center" width="100%" border="0">
									<tr valign="midddle">
										<td align="center">
											<TABLE id="Table1" align="center" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TBODY>
													<TR>
														<TD align="center" valign="top">
															<div id="PanelEx1" width="80%">
																<div id="PanelEx2" style="BORDER-RIGHT:#ffcc66 2px solid; BORDER-TOP:#ffcc66 2px solid; BORDER-LEFT:#ffcc66 2px solid; WIDTH:320px; BORDER-BOTTOM:#ffcc66 2px solid; HEIGHT:120px">
																	<TABLE id="TitleTable001" style="Z-INDEX: 102;WIDTH: 316px;HEIGHT: 17px" cellSpacing="1"
																		cellPadding="1" width="316" bgColor="#ffcc66" border="0">
																		<TR>
																			<TD colSpan="3" align="center"><span style="FONT-SIZE:x-small;COLOR:white"><FONT face="宋体" size="4"><b>用户登录</b></FONT></span></TD>
																		</TR>
																	</TABLE>
																	<SPAN id="PanelEx1_Label1">
																		<form id="Form1" method="post" runat="server">
																			<table id="table3" width="80%" align="center">
																				<TBODY>
																					<tr>
																						<td align="center"><asp:Label ID="Message" Runat="server" BorderColor="red" ForeColor="Red" /></td>
																					</tr>
																					<TR>
																						<td><font>登录名：</font><asp:TextBox ID="LoginName" Runat="server" BorderStyle="Groove" Width="136px"></asp:TextBox>
																						</td>
																					</TR>
																					<tr>
																						<td align="center"><asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="LoginName" ErrorMessage="请输入登录名"
																								Display="Dynamic"></asp:RequiredFieldValidator></td>
																					</tr>
																					<tr>
																						<td>
																							<font>密&nbsp;&nbsp;&nbsp; 码：</font><asp:TextBox ID="Password" Runat="server" BorderStyle="Groove" Width="136px" TextMode="Password"></asp:TextBox>
																						</td>
																					</tr>
																					<tr>
																						<td align="center"><asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="请输入密码"
																								Display="Dynamic"></asp:RequiredFieldValidator></td>
																					</tr>
																					<TR>
																						<TD align="center">
																							<asp:CheckBox id="CheckCookie" runat="server" Text="记住我"></asp:CheckBox></TD>
																					</TR>
																					<tr align="center">
																						<td align="center"><asp:Button ID="Submit" Runat="server" BorderStyle="Ridge" Text="登录" Width="56px" BackColor="#ffcc66" onclick="Submit_Click" /></td>
																					</tr>
																					<tr align="center">
																						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="UserGetPassword.aspx">忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																							<a href="UserRegister.aspx">注册新用户</a>
																						</td>
																					</tr>
																				</TBODY>
																			</table>
																	</SPAN>
																</div>
															</div>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</FORM>
	</body>
</HTML>
