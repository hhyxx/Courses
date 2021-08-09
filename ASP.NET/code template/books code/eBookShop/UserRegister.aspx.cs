using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace eBookShop
{
	/// <summary>
	/// Register 的摘要说明。
	/// </summary>
	public partial class Register : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
		}

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

protected void Submit_Click(object sender, System.EventArgs e)
{
	//获得注册信息
	string userName = LoginName.Text.Trim();
	string password = Password.Text.Trim();
	string question = Question.Text.Trim();
	string answer = Answer.Text.Trim();
	string userrealname=UserRealName.Text.Trim();
	string email=Email.Text.Trim();
	string role="用户";
	//得到原来的CartId
	ShopCart cart = new ShopCart();
	string tempCartId = cart.GetShoppingCartId();
	//试图添加新用户
	User user = new User();
	int userId = user.AddNewUser(userName, password, question, answer,userrealname,email,role);
	//如果返回值为-1，则表示用户名存在
	if (userId == -1)
	{
		Message.Text = "用户名已存在！";
	}
	else
	{
		//设置用户为通过验证
		System.Web.Security.FormsAuthentication.SetAuthCookie(userId.ToString(),false);
		//迁移购物车记录
		//将用户重定向回用户帐户页面
		Response.Redirect("UserLogin.aspx");
	}
}
	}
}
