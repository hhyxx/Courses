<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.ManBookInfo" CodeFile="ManBookInfo.aspx.cs" %>
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
								<FORM id="Form2" runat="server">
									<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="300" border="0">
										<TR>
											<TD noWrap align="center" bgColor="#ffcc66" colSpan="3"><FONT face="宋体">新增图书</FONT></TD>
										</TR>
										<TR>
											<TD noWrap align="center" bgColor="#ffcc66" colSpan="3">
												<asp:Label id="MyError" runat="server" ForeColor="#C00000"></asp:Label></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">图书名称：</FONT></TD>
											<TD noWrap width="247">
												<asp:TextBox id="ProductName" runat="server" Width="238px"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ProductName"></asp:RequiredFieldValidator></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">作者：</FONT></TD>
											<TD noWrap width="247"><FONT face="宋体">
													<asp:TextBox id="Author" runat="server" Width="240px"></asp:TextBox></FONT></TD>
											<TD noWrap></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">译者：</FONT></TD>
											<TD noWrap width="247"><FONT face="宋体">
													<asp:TextBox id="Translator" runat="server" Width="240px"></asp:TextBox></FONT></TD>
											<TD noWrap></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">出版社：</FONT></TD>
											<TD noWrap width="247">
												<asp:TextBox id="Press" runat="server" Width="240px"></asp:TextBox></TD>
											<TD noWrap></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">价格：</FONT></TD>
											<TD noWrap width="247">
												<asp:TextBox id="Price" runat="server" Width="240px"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="Price"></asp:RequiredFieldValidator></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">介绍：</FONT></TD>
											<TD noWrap width="247">
												<asp:TextBox id="Intro" runat="server" TextMode="MultiLine" Height="88px" MaxLength="500" Rows="40"
													Width="240px"></asp:TextBox></TD>
											<TD noWrap>
												<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="Intro"></asp:RequiredFieldValidator></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">封面：</FONT></TD>
											<TD noWrap width="247">
												<P><INPUT class="edline" id="File1" type="file" size="20" name="File1" runat="server"></P>
												<FONT face="宋体">
													<P>
														<asp:button id="Post" runat="server" Text="确定" Width="52px" onclick="Post_Click"></asp:button></P>
												</FONT>
											</TD>
											<TD noWrap>
												<asp:image id="img_BookImg" runat="server" Height="134px" Width="106px" ImageUrl="img/pic.jpg"
													BorderWidth="1"></asp:image></TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体">图书类型：</FONT></TD>
											<TD noWrap width="247"><FONT face="宋体">
													<asp:DropDownList id="ListCat" runat="server" Width="240px"></asp:DropDownList></FONT></TD>
											<TD noWrap></TD>
										</TR>
										<TR>
											<TD noWrap align="center" colSpan="3"><FONT face="宋体">
													<asp:Button id="Add" runat="server" Width="56px" Text="添加" onclick="Add_Click"></asp:Button></FONT></TD>
										</TR>
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
