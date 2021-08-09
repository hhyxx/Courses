using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace eBookShop.自定义控件
{



	/// <summary>
	///		Header 的摘要说明。
	/// </summary>
	public partial class Header : System.Web.UI.UserControl
	{

		



		protected void Page_Load(object sender, System.EventArgs e)
		{
			InitialHead();
		}


		void InitialHead()
		{
			Home.Visible=true;
			//是否是匿名用户
			if (SqlAccess.UserRole==null) 
			{
				Logout.Visible = false;				
				Login.Visible = true;
	
				BookType.Visible=false;
				BookInfo.Visible=false;
				BookAdd.Visible=false;
				Order.Visible=false;
				UserInfo.Visible=false;
				Sales.Visible=false;

				ChangeInfo.Visible=false;
				Pwd.Visible=false;
				MyShopCart.Visible=false;
				MyOrder.Visible=false;
			} 
			else 
			{	
				Login.Visible = false;
				Logout.Visible = true;

				if(SqlAccess.UserRole=="管理员")
				{
					BookType.Visible=true;
					BookInfo.Visible=true;
					BookAdd.Visible=true;
					Order.Visible=true;
					UserInfo.Visible=true;
					Sales.Visible=true;
					ChangeInfo.Visible=true;
					Pwd.Visible=true;

					MyShopCart.Visible=false;
					MyOrder.Visible=false;
				}
				else
				{
					ChangeInfo.Visible=true;
					Pwd.Visible=true;
					MyShopCart.Visible=true;
					MyOrder.Visible=true;

					BookType.Visible=false;
					BookInfo.Visible=false;
					BookAdd.Visible=false;
					Order.Visible=false;
					UserInfo.Visible=false;
					Sales.Visible=false;
				}
				
			}
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
		///		设计器支持所需的方法 - 不要使用代码编辑器
		///		修改此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{

		}
		#endregion
	}
}
