<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.ManUser" CodeFile="ManUser.aspx.cs" %>
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
		<table cellSpacing="0" cellPadding="0" width="100%" border="0" runat="server">
			<tr>
				<td valign="top" colSpan="0"><eBookShop:Left id="BookCategory" runat="server"></eBookShop:Left></td>
				<td align="left" valign="top" width="700">
					<table align="center" width="100%" border="0">
						<tr valign="bottom">
							<td align="center">
								<FORM id="Form2" method="post" runat="server">
									<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" align="left" border="0">
										<TR>
											<TD colSpan="3">
												<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR>
														<TD class="ContentHead">用户列表
															<BR>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD noWrap><FONT face="宋体"></FONT></TD>
											<TD noWrap>
												<asp:GridView id="GridUsers" runat="server" Width="686px" DataKeyField="UserID" BorderColor="#CC9966"
													cellpadding="4" Font-Name="Verdana" Font-Size="8pt" ShowFooter="True" HeaderStyle-CssClass="CartListHead"
													FooterStyle-CssClass="cartlistfooter" ItemStyle-CssClass="CartListItem" AlternatingRowStyle-CssClass="CartListItemAlt"
													AutoGenerateColumns="False" AllowPaging="True" Font-Names="Verdana" BackColor="White" BorderStyle="None"
													BorderWidth="1px" onpageindexchanging="GridUsers_PageIndexChanged" onrowcancelingedit="GridUsers_CancelCommand" 
                                                    onrowediting="GridUsers_EditCommand" onrowupdating="GridUsers_UpdateCommand">
													<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
													<AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
													<RowStyle ForeColor="#330099" CssClass="CartListItem" BackColor="White"></RowStyle>
													<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="CartListHead" BackColor="#990000"></HeaderStyle>
													<FooterStyle ForeColor="#330099" CssClass="cartlistfooter" BackColor="#FFFFCC"></FooterStyle>
													<Columns>
													
														<asp:CommandField ButtonType="Link" UpdateText="更新" CancelText="取消" EditText="编辑">
										
															<ItemStyle Wrap="False"></ItemStyle>
														</asp:CommandField>
														<asp:BoundField DataField="userID" ReadOnly="True" HeaderText="用户ID">
															<HeaderStyle Wrap="False"></HeaderStyle>
															<ItemStyle Wrap="False"></ItemStyle>
															<FooterStyle Wrap="False"></FooterStyle>
														</asp:BoundField>
														<asp:BoundField DataField="userName" ReadOnly="True" HeaderText="用户登录名">
															<HeaderStyle Wrap="False"></HeaderStyle>
															<ItemStyle Wrap="False"></ItemStyle>
															<FooterStyle Wrap="False"></FooterStyle>
														</asp:BoundField>
														<asp:BoundField DataField="userrealName" ReadOnly="True" HeaderText="真实姓名">
															<HeaderStyle Wrap="False"></HeaderStyle>
															<ItemStyle Wrap="False"></ItemStyle>
															<FooterStyle Wrap="False"></FooterStyle>
														</asp:BoundField>
														<asp:TemplateField HeaderText="角色">
															<HeaderStyle Wrap="False"></HeaderStyle>
															<ItemStyle Wrap="False"></ItemStyle>
															<ItemTemplate>
																<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.UserRole") %>'>
																</asp:Label>
															</ItemTemplate>
															<FooterStyle Wrap="False"></FooterStyle>
															<EditItemTemplate>
																<asp:TextBox id=Role runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.UserRole") %>'>
																</asp:TextBox>
																<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="Role" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
															</EditItemTemplate>
														</asp:TemplateField>
														<asp:BoundField DataField="Email" ReadOnly="True" HeaderText="Email">
															<HeaderStyle Wrap="False"></HeaderStyle>
															<ItemStyle Wrap="False"></ItemStyle>
															<FooterStyle Wrap="False"></FooterStyle>
														</asp:BoundField>
													</Columns>
													<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
												</asp:GridView></TD>
											<TD noWrap></TD>
										</TR>
										<TR>
											<TD noWrap></TD>
											<TD noWrap><FONT face="宋体"></FONT></TD>
											<TD noWrap></TD>
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
