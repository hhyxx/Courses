<%@ Page language="c#" Inherits="eBookShop.Register" CodeFile="UserRegister.aspx.cs" %>
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
																<TD align="center" colSpan="3"><SPAN style="FONT-SIZE: x-small; COLOR: white"><FONT face="����" size="4"><B>�û�ע��</B></FONT></SPAN></TD>
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
																			<TD><FONT size="+0"> ��¼����</FONT>
																				<asp:TextBox id="LoginName" Runat="server" Width="330px" BorderStyle="Groove"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD align="center">
																				<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="LoginName" ErrorMessage="�������û���"
																					Display="Dynamic"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR>
																			<TD><FONT size="+0">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �룺</FONT>
																				<asp:TextBox id="Password" Runat="server" Width="314px" BorderStyle="Groove" TextMode="Password"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD align="center">
																				<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="����������"
																					Display="Dynamic"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR>
																			<TD><FONT size="+0">ȷ�����룺</FONT>
																				<asp:TextBox id="AnotherPassword" Runat="server" Width="314px" BorderStyle="Groove" TextMode="Password"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD align="center">
																				<asp:RequiredFieldValidator id="Requiredfieldvalidator3" runat="server" ControlToValidate="AnotherPassword"
																					ErrorMessage="��ȷ������" Display="Dynamic" Width="98px"></asp:RequiredFieldValidator>
																				<asp:CompareValidator id="CompareValidator1" runat="server" ControlToValidate="AnotherPassword" ErrorMessage="�������벻ͬ"
																					Display="Dynamic" ControlToCompare="Password"></asp:CompareValidator></TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT size="+0">������ʾ���⣺</FONT>
																				<asp:TextBox id="Question" Runat="server" Width="281px" BorderStyle="Groove"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD noWrap>
																				<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="Question" ErrorMessage="������������ʾ����"
																					Display="Dynamic" Width="88px"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT size="+0">��ʾ����𰸣�</FONT>
																				<asp:TextBox id="Answer" Runat="server" Width="280px" BorderStyle="Groove"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT face="����">
																					<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ControlToValidate="Answer" ErrorMessage="������������ʾ�����"
																						Display="Dynamic"></asp:RequiredFieldValidator></FONT></TD>
																		</TR>
																		<TR>
																			<TD noWrap height="27"><FONT size="+0">ȷ��һ�飺</FONT>
																				<asp:TextBox id="AnotherAnswer" Runat="server" Width="314px" BorderStyle="Groove"></asp:TextBox>
																			</TD>
																		</TR>
																		<TR>
																			<TD noWrap>
																				<asp:CompareValidator id="CompareValidator2" runat="server" ControlToValidate="AnotherAnswer" ErrorMessage="�������벻ͬ"
																					Display="Dynamic" ControlToCompare="Answer"></asp:CompareValidator></TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT face="����"><FONT size="+0">��ʵ������</FONT>
																					<asp:TextBox id="UserRealName" Runat="server" BorderStyle="Groove" Width="314px"></asp:TextBox></FONT></TD>
																		</TR>
																		<TR>
																			<TD noWrap>
																				<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" Width="88px" Display="Dynamic" ErrorMessage="��������ʵ����"
																					ControlToValidate="UserRealName"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR>
																			<TD noWrap><FONT face="����"><FONT face="����"><FONT size="+0">Email��ַ��</FONT>
																						<asp:TextBox id="Email" Runat="server" BorderStyle="Groove" Width="306px"></asp:TextBox></FONT></FONT></TD>
																		</TR>
																		<TR>
																			<TD noWrap>
																				<asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server" Width="88px" Display="Dynamic" ErrorMessage="������Email��ַ"
																					ControlToValidate="Email"></asp:RequiredFieldValidator></TD>
																		</TR>
																		<TR align="center">
																			<TD align="center">
																				<asp:Button id="Submit" Runat="server" Text="ע��" Width="56px" BorderStyle="Ridge" BackColor="#ffcc66" onclick="Submit_Click"></asp:Button></TD>
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
