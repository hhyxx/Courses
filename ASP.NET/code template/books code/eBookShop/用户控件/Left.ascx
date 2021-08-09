<%@ Control Language="c#" Inherits="eBookShop.用户控件.Left" CodeFile="Left.ascx.cs" %>
<FONT face="宋体">
	<TABLE id="Table1" style="WIDTH: 216px; HEIGHT: 267px" height="267" cellSpacing="0" cellPadding="0"
		width="216" bgColor="orange" border="0" runat="server">
		<TR>
			<TD style="WIDTH: 264px" vAlign="top">
				<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" bgColor="#ffa500" border="0" runat="server">
					<TR>
						<TD vAlign="top" align="center">
							<TABLE id="Table3" height="100%" cellSpacing="0" cellPadding="0" width="95%" bgColor="#ffa500"
								background="img/titlebg.gif" border="0">
								<TR>
									<TD vAlign="baseline" width="17"></TD>
									<TD vAlign="baseline" align="center"><B><FONT color="#0033ff">图书分类</FONT></B></TD>
									<TD vAlign="baseline" width="17"></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD height="10"></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="center">
						<asp:GridView id="GridView1" runat="server" Width="90%" ShowHeader="False" BorderWidth="0px" BorderStyle="None"
								CellPadding="0" AutoGenerateColumns="False">
								<HeaderStyle CssClass="tttable"></HeaderStyle>
								<Columns>
									<asp:HyperLinkField Text="&lt;img src=img/dir_pointer_g.gif border=0&gt;">
										<HeaderStyle Width="150px"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
									</asp:HyperLinkField>
									<asp:HyperLinkField Target="main" DataNavigateUrlFields="CategoryId" DataNavigateUrlFormatString="../BookByType.aspx?BookType={0} "
										DataTextField="CategoryName" HeaderText="The Type Of Book">
										<HeaderStyle HorizontalAlign="Center" Width="180px"></HeaderStyle>
									</asp:HyperLinkField>
								</Columns>
							</asp:GridView></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
</FONT>
