<%@ Page language="c#" Inherits="eBookShop.Register" CodeFile="UserRegister.aspx.cs" %>
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
				<td align="left" valign="top" width="100%">
					<table align="center" width="80%" border="0">
						<tr valign="bottom">
							<td align="center">
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
									<TBODY>
										<TR>
											<TD vAlign="middle" align="center" width="445">
												<DIV id="Div1" width="80%">
													<DIV id="PanelEx1" style="BORDER-RIGHT: #ffcc66 2px solid; BORDER-TOP: #ffcc66 2px solid; BORDER-LEFT: #ffcc66 2px solid; BORDER-BOTTOM: #ffcc66 2px solid">
														<TABLE id="TitleTable001" style="Z-INDEX: 102; WIDTH: 316px; HEIGHT: 17px" cellSpacing="1"
															cellPadding="1" width="100%" bgColor="#ffcc66" border="0">
															<TR>
																<TD align="center" colSpan="3"><SPAN style="FONT-SIZE: x-small; COLOR: white"><FONT face="宋体" size="4"><B>用户注册</B></FONT></SPAN></TD>
															</TR>
														</TABLE>
														<SPAN id="PanelEx1_Label1">
															<FORM id="Form2" method="post" runat="server">
																<TABLE id="table3" width="243" align="center" height="455">
																	<TBODY align="right">
																		<TR>
																			<TD align="center">
																				<asp:Label id="Message" ForeColor="Red" Runat="server" BorderColor="red"></asp:Label></TD>
																		</TR>
																		<TR>
																			<TD><FONT size="+0"> 登录名：</FONT>
																				<asp:TextBox id="LoginName" Runat="server" Width="330px" BorderStyle="Groove"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD align="center">
																				<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="LoginName" ErrorMessage="请输入用户名"
																					Display="Dynamic"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR>
																			<TD><FONT size="+0">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 码：</FONT>
																				<asp:TextBox id="Password" Runat="server" Width="314px" BorderStyle="Groove" TextMode="Password"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD align="center">
																				<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="请输入密码"
																					Display="Dynamic"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR>
																			<TD><FONT size="+0">确认密码：</FONT>
																				<asp:TextBox id="AnotherPassword" Runat="server" Width="314px" BorderStyle="Groove" TextMode="Password"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD align="center">
																				<asp:RequiredFieldValidator id="Requiredfieldvalidator3" runat="server" ControlToValidate="AnotherPassword"
																					ErrorMessage="请确认密码" Display="Dynamic" Width="98px"></asp:RequiredFieldValidator>
																				<asp:CompareValidator id="CompareValidator1" runat="server" ControlToValidate="AnotherPassword" ErrorMessage="两次输入不同"
																					Display="Dynamic" ControlToCompare="Password"></asp:CompareValidator></TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT size="+0">密码提示问题：</FONT>
																				<asp:TextBox id="Question" Runat="server" Width="281px" BorderStyle="Groove"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD noWrap>
																				<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="Question" ErrorMessage="请输入密码提示问题"
																					Display="Dynamic" Width="88px"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT size="+0">提示问题答案：</FONT>
																				<asp:TextBox id="Answer" Runat="server" Width="280px" BorderStyle="Groove"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT face="宋体">
																					<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ControlToValidate="Answer" ErrorMessage="请输入密码提示问题答案"
																						Display="Dynamic"></asp:RequiredFieldValidator></FONT></TD>
																		</TR>
																		<TR>
																			<TD noWrap height="27"><FONT size="+0">确认一遍：</FONT>
																				<asp:TextBox id="AnotherAnswer" Runat="server" Width="314px" BorderStyle="Groove"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD noWrap>
																				<asp:CompareValidator id="CompareValidator2" runat="server" ControlToValidate="AnotherAnswer" ErrorMessage="两次输入不同"
																					Display="Dynamic" ControlToCompare="Answer"></asp:CompareValidator></TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT face="宋体"><FONT size="+0">真实姓名：</FONT>
																					<asp:TextBox id="UserRealName" Runat="server" BorderStyle="Groove" Width="314px"></asp:TextBox></FONT></TD>
																		</TR>
																		<TR>
																			<TD noWrap>
																				<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" Width="88px" Display="Dynamic" ErrorMessage="请输入真实姓名"
																					ControlToValidate="UserRealName"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT face="宋体"><FONT face="宋体"><FONT size="+0">Email地址：</FONT>
																						<asp:TextBox id="Email" Runat="server" BorderStyle="Groove" Width="306px"></asp:TextBox></FONT></FONT></TD>
																		</TR>
																		<TR>
																			<TD noWrap>
																				<asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server" Width="88px" Display="Dynamic" ErrorMessage="请输入Email地址"
																					ControlToValidate="Email"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR align="center">
																			<TD align="center">
																				<asp:Button id="Submit" Runat="server" Text="注册" Width="56px" BorderStyle="Ridge" BackColor="#ffcc66" onclick="Submit_Click"></asp:Button></TD>
																		</TR>
																	</TBODY>
																</TABLE>
														</SPAN></DIV>
												</DIV>
											</TD>
										</TR>
										<TR>
											<TD vAlign="middle" align="center" width="445"></TD>
										</TR>
									</TBODY>
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
