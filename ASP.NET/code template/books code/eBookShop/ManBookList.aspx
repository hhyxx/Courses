<%@ Register TagPrefix="eBookShop" TagName="Header" Src="用户控件/Header.ascx" %>
<%@ Register TagPrefix="eBookShop" TagName="Left" Src="用户控件/Left.ascx" %>
<%@ Page language="c#" Inherits="eBookShop.ManBookList" CodeFile="ManBookList.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>网上书店</title>
	</HEAD>
	<body>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td colSpan="0"><ebookshop:header id="Header" runat="server"></ebookshop:header></td>
			</tr>
		</table>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td vAlign="top" colSpan="0"><ebookshop:left id="BookCategory" runat="server"></ebookshop:left></td>
				<td vAlign="top" align="left" width="700">
					<table height="632" width="691" align="center" border="0">
						<tr vAlign="bottom">
							<td align="center">
								<form id="Form1" method="post" runat="server">
									<P><FONT face="宋体">图书列表</FONT></P>
									<P><asp:label id="Message" runat="server" ForeColor="Red"></asp:label></P>
									<asp:GridView id="GridProduct" runat="server" Font-Names="Verdana" AllowPaging="True" DataKeyField="productID"
										AutoGenerateColumns="False" AlternatingRowStyle-CssClass="CartListItemAlt" ItemStyle-CssClass="CartListItem"
										FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead" ShowFooter="True"
										Font-Size="8pt" Font-Name="Verdana" cellpadding="1" BorderColor="#CC9966" width="1014px" BackColor="White"
										BorderStyle="None" BorderWidth="1px" Height="484px">
										<FooterStyle ForeColor="#330099" CssClass="cartlistfooter" BackColor="#FFFFCC"></FooterStyle>
										<SelectedRowStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedRowStyle>
										<AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
										<RowStyle ForeColor="#330099" CssClass="CartListItem" BackColor="White"></RowStyle>
										<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" CssClass="CartListHead" BackColor="#990000"></HeaderStyle>
										<Columns>
											<asp:BoundField DataField="productId" HeaderText="编号">
												<HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
												<FooterStyle Wrap="False"></FooterStyle>
											</asp:BoundField>
											<asp:TemplateField HeaderText="图书名称">
												<HeaderStyle Wrap="False" Width="60px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
												<ItemTemplate>
													<asp:TextBox id=ProductName runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductName") %>'>
													</asp:TextBox>
												</ItemTemplate>
												<FooterStyle Wrap="False"></FooterStyle>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="作者">
												<HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
												<ItemTemplate>
													<asp:TextBox id="Author" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Author") %>'>
													</asp:TextBox>
												</ItemTemplate>
												<FooterStyle Wrap="False"></FooterStyle>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="译者">
												<HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
												<ItemTemplate>
													<asp:TextBox id="Translator" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Translator") %>'>
													</asp:TextBox>
												</ItemTemplate>
												<FooterStyle Wrap="False"></FooterStyle>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="出版社">
												<HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
												<ItemTemplate>
													<asp:TextBox id="Press" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Press") %>'>
													</asp:TextBox>
												</ItemTemplate>
												<FooterStyle Wrap="False"></FooterStyle>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="价格">
												<HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
												<ItemTemplate>
													<asp:TextBox id="Price" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductPrice") %>'>
													</asp:TextBox>
												</ItemTemplate>
												<FooterStyle Wrap="False"></FooterStyle>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="介绍">
												<HeaderStyle Wrap="False" Width="100px"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
												<ItemTemplate>
													<asp:TextBox id=Intro runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Intro") %>' TextMode="MultiLine" MaxLength="500">
													</asp:TextBox>
												</ItemTemplate>
												<FooterStyle Wrap="False"></FooterStyle>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="删除">
												<ItemTemplate>
													<center>
														<asp:CheckBox id="Remove" runat="server" />
													</center>
												</ItemTemplate>
											</asp:TemplateField>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
									</asp:GridView><asp:button id="Submit" Text="修改" Width="53px" Runat="server" onclick="Submit_Click"></asp:button></form>
								</FORM></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
