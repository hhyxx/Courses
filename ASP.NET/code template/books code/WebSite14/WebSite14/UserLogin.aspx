<%@ Register TagPrefix="eBookShop" TagName="Left" Src="�û��ؼ�/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="�û��ؼ�/Header.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.Migrated_Login" CodeFile="UserLogin.aspx.cs" %>
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
																			<TD colSpan="3" align="center"><span style="FONT-SIZE:x-small;COLOR:white"><FONT face="����" size="4"><b>�û���¼</b></FONT></span></TD>
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
																						<td><font>��¼����</font><asp:TextBox ID="LoginName" Runat="server" BorderStyle="Groove" Width="136px"></asp:TextBox>
																						</td>
																					</TR>
																					<tr>
																						<td align="center"><asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="LoginName" ErrorMessage="�������¼��"
																								Display="Dynamic"></asp:RequiredFieldValidator></td>
																					</tr>
																					<tr>
																						<td>
																							<font>��&nbsp;&nbsp;&nbsp; �룺</font><asp:TextBox ID="Password" Runat="server" BorderStyle="Groove" Width="136px" TextMode="Password"></asp:TextBox>
																						</td>
																					</tr>
																					<tr>
																						<td align="center"><asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="����������"
																								Display="Dynamic"></asp:RequiredFieldValidator></td>
																					</tr>
																					<TR>
																						<TD align="center">
																							<asp:CheckBox id="CheckCookie" runat="server" Text="��ס��"></asp:CheckBox></TD>
																					</TR>
																					<tr align="center">
																						<td align="center"><asp:Button ID="Submit" Runat="server" BorderStyle="Ridge" Text="��¼" Width="56px" BackColor="#ffcc66" onclick="Submit_Click" /></td>
																					</tr>
																					<tr align="center">
																						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="UserGetPassword.aspx">��������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																							<a href="UserRegister.aspx">ע�����û�</a>
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
