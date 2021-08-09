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
	/// BookCheckOut 的摘要说明。
	/// </summary>
	public partial class BookCheckOut : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				//得到cartID 
				ShopCart cart = new ShopCart();
				string cartID = cart.GetShoppingCartId();
				//绑定购物车信息到GridView
				MyGridView.DataSource = cart.GetItems(cartID);
				MyGridView.DataBind();
				//得到购物车总花费
				TotalLbl.Text = String.Format( "{0:c}", cart.GetTotal(cartID));
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
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
		protected void SubmitBtn_Click(object sender, System.EventArgs e)
		{
			ShopCart cart = new ShopCart();
			string cartID = cart.GetShoppingCartId();
			decimal totalCost = cart.GetTotal(cartID);

			string userID = User.Identity.Name;

			if (cartID!=null && userID!=null)
			{
				Orders order = new Orders();

				int orderID = order.PlaceOrder(userID, cartID);

				Message.Text = "您的订单号为"+orderID;

				SubmitBtn.Visible = false;

			}
		}


	}
}
