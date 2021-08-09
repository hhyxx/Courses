//===========================================================================
// 此文件是作为 ASP.NET 2.0 Web 项目转换的一部分修改的。
// 类名已更改，且该类已改为从
//// 文件“App_Code\Migrated\Stub_UserInfo_aspx_cs.cs”中的抽象基类继承。
// 这样，在运行时，您的 Web 应用程序中的其他类就可以使用该抽象基类绑定和访问 
// 代码隐藏页。
// 关联的内容页“UserInfo.aspx”也已改为引用新的类名。
// 有关此代码模式的更多信息，请参考 http://go.microsoft.com/fwlink/?LinkId=46995 
//===========================================================================
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
	/// UserInfo 的摘要说明。
	/// </summary>
	public partial class Migrated_UserInfo : UserInfo
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				GetUserInfo();
			}
		}

		void GetUserInfo()
		{
			User user = new User();
			UserInfoCl userInfo = user.GetUserInfo(User.Identity.Name);

			RealName.Text = userInfo.userRealName;
//			UserName.Text = userInfo.username ;
			Question.Text=userInfo.question;
			Answer.Text=userInfo.answer ;
			Email.Text = userInfo.email;
		
		}

void UpdateUserInfo()
{
	User user = new eBookShop.User();
	user.ChangeProfile(User.Identity.Name, RealName.Text,
		Question.Text,Answer.Text , Email.Text);
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
			try
			{

				UpdateUserInfo();
				Message.Text = "修改成功！";
			}
			catch
			{
				Message.Text = "发生未知的错误！";
			}
		}

	}
}
