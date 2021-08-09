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
	/// UserChangePW 的摘要说明。
	/// </summary>
	public partial class UserChangePW : System.Web.UI.Page
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
			User user = new User();
			int result = user.ChangePassword(OldPwd.Text.Trim(), NewPwd.Text.Trim(), int.Parse(User.Identity.Name));

			if (result == 1)
			{
				Message.Text = "密码修改成功！";
			}
			else
			{
				Message.Text = "密码输入与原密码不匹配！";
			}
		}
	}
}
