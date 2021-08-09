//===========================================================================
// 此文件是作为 ASP.NET 2.0 Web 项目转换的一部分修改的。
// 类名已更改，且该类已改为从
//// 文件“App_Code\Migrated\Stub_BookInfo_aspx_cs.cs”中的抽象基类继承。
// 这样，在运行时，您的 Web 应用程序中的其他类就可以使用该抽象基类绑定和访问 
// 代码隐藏页。
// 关联的内容页“BookInfo.aspx”也已改为引用新的类名。
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
	/// BookInfo 的摘要说明。
	/// </summary>
	public partial class Migrated_BookInfo : BookInfo
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			//页面第一次加载时
			if (!Page.IsPostBack)
			{
				ShowProductInfo();
			}
			
		}

		void ShowProductInfo()
		{
			//获取Get方式传递的ProductId参数的值
			int productId = int.Parse(Request["BookId"]);
			//获取某个商品的详细信息
			DataRow myDr;
			myDr = Product.GetBookDetail(productId);
			//商品是否存在
			if (myDr == null)
			{
				lb_BookName.Text = "没有这个商品";
			}
			else
			{

				//显示商品详细信息
				lb_BookName.Text = myDr["ProductName"].ToString();
				lb_BookType.Text=myDr["CategoryName"].ToString();
				lb_Image.Text=myDr["image"].ToString ();

				lb_Author.Text=myDr["Author"].ToString();
				lb_Translator.Text=myDr["Translator"].ToString();
				lb_Press.Text=myDr["Press"].ToString();
				lb_Price.Text=myDr["ProductPrice"].ToString();
				Textarea1.Value =myDr["Intro"].ToString();

//				lb_Author.Text=myDr.Author;
//				lb_Translator.Text=myDr.Translator;
//				lb_Press.Text=myDr.Press ;
//				lb_Price.Text = myDr.productPrice.ToString();
//				Textarea1.Value = myDr.intro;
				//lb_Image.Text=pro.cover;
//				lblClickCount.Text = pro.clickCount.ToString();
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
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

		private void lb_Buy_Click(object sender, System.EventArgs e)
		{
		
		}
	}
}
