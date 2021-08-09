<%@ Register TagPrefix="eBookShop" TagName="NewBook" Src="用户控件/NewBook.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Page language="c#" Inherits="eBookShop._Default" CodeFile="Default.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>网上书店</title>
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
				<td style="WIDTH: 158px" vAlign="top" colSpan="0"><ebookshop:left id="BookCategory" runat="server"></ebookshop:left></td>
				<TD vAlign="top"><asp:datalist id="dl_BookByType" runat="server" Height="406px" RepeatColumns="2" Width="625px"
						ShowHeader="False" ShowFooter="False">
						<ItemTemplate>
							<FONT face="宋体">
								<TABLE id="Table3" cellSpacing="0" cellPadding="0" width="350" height="160">
									<TR>
										<td width="8"></td>
										<TD vAlign="center" align="middle" width="100"><a href='BookInfo.aspx?BookId=<%# DataBinder.Eval(Container.DataItem,"ProductId")%>'><%# DataBinder.Eval(Container.DataItem,"Image")%></a></TD>
										<TD width="200">
											<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="100%" border="0" height="100">
												<TR>
													<TD width="100%">
														<span style="DISPLAY: inline; WIDTH: 100%;"><a href='BookInfo.aspx?bookid=<%# DataBinder.Eval(Container.DataItem,"ProductId")%>'>
																<b>
																	<%# DataBinder.Eval(Container.DataItem,"ProductName")%>
																</b></a></span>
													</TD>
												</TR>
												<TR>
													<TD width="100%">
														<span style="DISPLAY: inline; WIDTH: 100%; "><b>作者:</b><%# DataBinder.Eval(Container.DataItem,"Author")%></span>
													</TD>
												</TR>
												<TR>
													<TD width="100%">
														<span style="DISPLAY: inline; WIDTH: 100%; "><b>出版社:</b><%# DataBinder.Eval(Container.DataItem,"Press")%></span>
													</TD>
												</TR>
												<TR>
													<TD width="100%">
														<span style="DISPLAY: inline; WIDTH: 100%; "><b>价格:</b>$<%# DataBinder.Eval(Container.DataItem,"ProductPrice")%></span>
													</TD>
												</TR>
												<TR>
													<TD width="100%">
														<span style="DISPLAY: inline; WIDTH: 100%; "><b><a href='BookAddToCart.aspx?bookid=<%# DataBinder.Eval(Container.DataItem,"ProductId")%>&Backurl=BookByType.aspx?BookType=<%# DataBinder.Eval(Container.DataItem,"CategoryId")%>'>
																	<font color="#ff0000">加入购物车</font></a> </b></span>
													</TD>
												</TR>
											</TABLE>
										</TD>
									</TR>
								</TABLE>
							</FONT>
						</ItemTemplate>
					</asp:datalist></TD>
			</tr>
		</table>
	</body>
</HTML>
