<%@ Control Language="c#" Inherits="eBookShop.用户控件.NewBook" CodeFile="NewBook.ascx.cs" %>
<TABLE id="Table5" cellSpacing="0" cellPadding="0" width="100%" border="0">
	<TR>
		<TD height="15"></TD>
	</TR>
	<TR>
		<TD>
			<TABLE id="Table8" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD noWrap width="1%"><IMG alt="" src="img/point.gif"><font color="#cd0104"><b>&nbsp;最新图书</b></font></TD>
					<TD background="img/titlemd2.gif"><FONT face="宋体"></FONT></TD>
				</TR>
			</TABLE>
			<FONT face="宋体">&nbsp;
				<asp:datalist id="DLNewBook" runat="server" Width="513px" Height="240px" BorderColor="Maroon"
					BorderStyle="Double" CaptionAlign="Top" RepeatColumns="2" ShowFooter="False" ShowHeader="False">
					<ItemTemplate>
						<FONT face="宋体">
							<TABLE id="Table11" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR>
									<TD>
										<TABLE id="Table12" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD vAlign="center" align="middle"><a href='BookInfo.aspx?BookId=<%# DataBinder.Eval(Container.DataItem,"ProductId")%>'><%# DataBinder.Eval(Container.DataItem,"Image")%></a></TD>
												<td width="10"></td>
												<TD>
													<TABLE id="Table13" cellSpacing="0" cellPadding="0" width="100%" border="0">
														<TR>
															<TD><a href='BookInfo.aspx?BookId=<%# DataBinder.Eval(Container.DataItem,"ProductId")%>'>
																	<b>
																		<%# DataBinder.Eval(Container.DataItem,"ProductName")%>
																	</b></a>
															</TD>
														</TR>
														<TR>
															<TD height="10"></TD>
														</TR>
														<TR>
															<TD><%# DataBinder.Eval(Container.DataItem,"Intro")%></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<tr>
									<td height="10">
									</td>
								</tr>
								<TR>
									<TD background="img/bg11(1).gif" height="1"></TD>
								</TR>
								<tr>
									<td height="10">
									</td>
								</tr>
							</TABLE>
						</FONT>
					</ItemTemplate>
					<AlternatingItemTemplate>
						<FONT face="宋体"></FONT>
					</AlternatingItemTemplate>
				</asp:datalist></FONT>
		</TD>
	</TR>
	<tr>
		<td height="10"><FONT face="宋体"></FONT></td>
	</tr>
	<TR>
		<TD vAlign="top"><FONT face="宋体"></FONT></TD>
	</TR>
	<TR>
		<TD vAlign="top"></TD>
	</TR>
</TABLE>
