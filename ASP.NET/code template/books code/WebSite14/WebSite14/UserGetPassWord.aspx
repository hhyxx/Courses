<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.GetPassWord" CodeFile="UserGetPassWord.aspx.cs" %>
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
					<table align="left" width="100%" border="0">
						<tr valign="top">
							<td align="left">
								<table align="center" width="100%" border="0">
									<tr valign="midddle">
										<td align="center">
											<TABLE id="Table1" align="center" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TBODY>
													<TR>
														<TD align="center" valign="middle">
															<div id="PanelEx1" width="80%">
																<div id="PanelEx1" style="BORDER-RIGHT:#ffcc66 2px solid; BORDER-TOP:#ffcc66 2px solid; BORDER-LEFT:#ffcc66 2px solid; WIDTH:320px; BORDER-BOTTOM:#ffcc66 2px solid; HEIGHT:120px">
																	<TABLE id="TitleTable001" style="Z-INDEX: 102;WIDTH: 316px;HEIGHT: 17px" cellSpacing="1"
																		cellPadding="1" width="316" bgColor="#ffcc66" border="0">
																		<TR>
																			<TD colSpan="3" align="center"><span style="FONT-SIZE:x-small;COLOR:white"><FONT face="宋体" size="4"><b>找回密码</b></FONT></span></TD>
																		</TR>
																	</TABLE>
																	<SPAN id="PanelEx1_Label1">
																		<form id="Form1" method="post" runat="server">
																			<table id="table3" width="70%" align="center">
																				<TBODY align="right">
																					<tr>
																						<td align="center"><asp:Label ID="Message" Runat="server" BorderColor="red" ForeColor="Red" /></td>
																						<TD align="center"></TD>
																					</tr>
																					<TR>
																						<td align="left"><font>用户名：</font><asp:TextBox ID="LoginName" Runat="server" BorderStyle="Groove" Width="136px"></asp:TextBox>
																						</td>
																						<TD align="left"><FONT face="宋体">
																								<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" Width="48px" Display="Dynamic" ErrorMessage="*"
																									ControlToValidate="LoginName"></asp:RequiredFieldValidator></FONT></TD>
																					</TR>
																					<tr>
																						<td nowrap align="left">
																							<font>提示问题：</font><asp:TextBox ID="Question" Runat="server" BorderStyle="Groove" Width="120px"></asp:TextBox>
																						</td>
																						<TD noWrap align="left"><FONT face="宋体">
																								<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="Question"></asp:RequiredFieldValidator></FONT></TD>
																					</tr>
																					<tr>
																						<td nowrap align="left">
																							<font>问题答案：</font><asp:TextBox ID="Answer" Runat="server" BorderStyle="Groove" Width="120px"></asp:TextBox>
																						</td>
																						<TD noWrap align="left">
																							<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="Answer"></asp:RequiredFieldValidator></TD>
																					</tr>
																					<tr>
																						<td nowrap align="left">
																							<font>Email：</font><asp:TextBox ID="Email" Runat="server" BorderStyle="Groove" Width="152px"></asp:TextBox>
																						</td>
																						<TD noWrap align="left">
																							<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="Email"></asp:RequiredFieldValidator>
																							<asp:RegularExpressionValidator id="ValidateEmail" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="Email"
																								ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></TD>
																					</tr>
																					<tr align="center">
																						<td align="center"><asp:Button ID="Submit" Runat="server" BorderStyle="Ridge" Text="提交" Width="56px" BackColor="#ffcc66" onclick="Submit_Click" /></td>
																						<TD align="center"></TD>
																					</tr>
																				</TBODY>
																			</table>
																	</SPAN>
																</div>
															</div>
														</TD>
													</TR>
													<TR>
														<TD vAlign="middle" align="center"></TD>
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
