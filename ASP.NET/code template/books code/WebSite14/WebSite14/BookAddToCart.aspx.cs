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
	/// BookAddToCart 的摘要说明。
	/// </summary>
	public partial class BookAddToCart : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (Request["BookId"] != null)
			{
				ShopCart cart = new eBookShop.ShopCart();
				//获取CartId
				string cartId = cart.GetShoppingCartId();
				//向购物车添加某种商品，数量为1
				cart.AddItem(cartId, int.Parse(Request["BookId"]), 1);
			}
			//跳转到购物车页面
			Response.Redirect("MyShopCart.aspx");
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
	}
}
