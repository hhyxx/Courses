<%@ Page language="c#" Inherits="eBookShop.Migrated_BookInfo" CodeFile="BookInfo.aspx.cs" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>网上书店</title>
		<meta content="True" name="vs_snapToGrid">
		<meta content="True" name="vs_showGrid">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td colSpan="0"><ebookshop:header id="Header" runat="server"></ebookshop:header></td>
			</tr>
		</table>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td align="left" colSpan="0"><ebookshop:left id="BookCategory" runat="server"></ebookshop:left></td>
				<TD><FONT face="宋体"><STRONG>
							<TABLE id="Table4" style="WIDTH: 518px; HEIGHT: 10px" cellSpacing="0" cellPadding="0" width="518"
								border="0">
								<TR>
									<TD style="WIDTH: 928px"><STRONG>图书名称:
											<asp:label id="lb_BookName" runat="server" Width="348px">Label</asp:label></STRONG></TD>
									<TD style="WIDTH: 128px"><STRONG></STRONG></TD>
								</TR>
							</TABLE>
						</STRONG></FONT>
					<TABLE style="WIDTH: 557px; HEIGHT: 323px" cellSpacing="0" cellPadding="0" width="557"
						border="0">
						<TBODY>
							<TR>
								<TD height="10"><FONT face="宋体"></FONT></TD>
							</TR>
							<TR>
								<TD background="img/bg11.gif"></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 196px">
									<TABLE id="Table3" height="150" cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<TD style="WIDTH: 443px; HEIGHT: 200px" vAlign="middle" align="center" width="443"><asp:label id="lb_Image" runat="server">Label</asp:label></TD>
											<TD style="HEIGHT: 200px">
												<TABLE id="Table9" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR>
														<TD style="HEIGHT: 40px"><STRONG>种&nbsp;&nbsp; 类:&nbsp; </STRONG>&nbsp;
															<asp:label id="lb_BookType" runat="server" Width="248px">Label</asp:label></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 40px"><STRONG>作&nbsp;&nbsp;&nbsp;者:</STRONG>&nbsp;
															<asp:label id="lb_Author" runat="server" Width="300px">Label</asp:label></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 40px"><STRONG>译&nbsp;&nbsp; 者:</STRONG>&nbsp;
															<asp:label id="lb_Translator" runat="server" Width="300px">Label</asp:label></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 40px"><STRONG><B>出版社:</B></STRONG>&nbsp;
															<asp:label id="lb_Press" runat="server" Width="277px">Label</asp:label></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 40px"><STRONG>价&nbsp;&nbsp; 格:</STRONG>&nbsp;
															<asp:label id="lb_Price" runat="server" Width="300px">Label</asp:label></TD>
													</TR>
												</TABLE>
											</TD>
											<TD style="HEIGHT: 200px" width="100">
												<TABLE id="Table10" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR>
														<TD vAlign="middle" align="right"><FONT face="宋体">
																<p><A href='BookAddToCart.aspx?BookId=<%= Request["BookId"] %>' ><IMG style="WIDTH: 32px; HEIGHT: 34px" height="34" src="img/gm.gif" width="32" align="left"
																			border="0">购 买</A></p>
															</FONT>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD background="img/bg11.gif"><FONT face="宋体"></FONT><FONT face="宋体"></FONT></TD>
							</TR>
							<TR>
								<TD height="10"><FONT face="宋体"></FONT></TD>
							</TR>
							<TR>
								<TD><STRONG>描述:</STRONG></TD>
							</TR>
							<asp:label id="lb_Description" runat="server" Width="640px" Height="8px" Visible="False">Label</asp:label>
					&nbsp;
				</TD>
			</tr>
			</FONT></TD></TR></table>
		<TEXTAREA id="Textarea1" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; OVERFLOW-Y: visible; FONT-SIZE: 16px; BORDER-LEFT: 0px; WIDTH: 557px; LINE-HEIGHT: 18px; BORDER-BOTTOM: 0px; FONT-FAMILY: Arial,Arial,Sans-serif; HEIGHT: 74px"
			name="ta_Description" rows="4" readOnly cols="67" runat="server"></TEXTAREA></TD></TR>&nbsp;</TD></TR></FONT></TD></TR></TBODY></TABLE>
	</body>
</HTML>
