//===========================================================================
// 此文件是作为 ASP.NET 2.0 Web 项目转换的一部分修改的。
// 类名已更改，且该类已改为从
//// 文件“App_Code\Migrated\Stub_MyShopCart_aspx_cs.cs”中的抽象基类继承。
// 这样，在运行时，您的 Web 应用程序中的其他类就可以使用该抽象基类绑定和访问 
// 代码隐藏页。
// 关联的内容页“MyShopCart.aspx”也已改为引用新的类名。
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
	/// MyShopCart 的摘要说明。
	/// </summary>
	public partial class Migrated_MyShopCart : MyShopCart
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				ShowShopCart();
				ShowMenu();
			}
		}

		void ShowMenu()
		{
//						
			if(SqlAccess.UserRole==null)
			{
				Response.Redirect("UserLogin.aspx");
			}

			if (Request.IsAuthenticated == true)
						{
//							LogOutArea.Visible = false;
//							LogInArea.Visible = true;
						}
						else
						{
//							LogOutArea.Visible = true;
//							LogInArea.Visible = false;
						}
		}
		//********************************************************
		//
		//ShowShoppingCartList()用来动态绑定用
		//户的购物车信息到GridView控件MyList
		//
		//********************************************************
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
		void ShowShopCart() 
		{

			ShopCart cart = new ShopCart();

			// 得到用户的购物车ID
			String cartID = cart.GetShoppingCartId();

			// 如果购物车内没有商品,GridView隐藏
			if (cart.GetItemCount(cartID) == 0) 
			{
				DetailsPanel.Visible = false;
				MyError.Text = "购物车内没有商品。";
			}
			else 
			{

				// 绑定购物车信息到GridView
				MyList.DataSource = cart.GetItems(cartID);
				MyList.DataBind();

				//显示总金额
				lblTotal.Text = String.Format( "{0:c}", cart.GetTotal(cartID));
			}
		}

		//*******************************************************
		//
		// UpdateShoppingCartDatabase方法根据客户端输入的更改信息
		// 提交数据库，更改购物车信息
		//
		//*******************************************************

		void UpdateShopCartDatabase() 
		{

			ShopCart cart = new ShopCart();

			// 获得用户的cartID
			String cartID = cart.GetShoppingCartId();

			// 遍历GridView的每一行
			for (int i=0; i < MyList.Rows.Count; i++) 
			{
				// 找到某行的数量信息和删除信息。
				TextBox quantityTxt = (TextBox) MyList.Rows[i].FindControl("Quantity");
				CheckBox remove = (CheckBox) MyList.Rows[i].FindControl("Remove");

				// 出错处理。防止用户的非法输入，如quanlity为负数等
				int quantity;
				try 
				{
					quantity = Int32.Parse(quantityTxt.Text);

					// 如果数量被修改或者Remove复选框被选中
					if (quantity != Convert.ToInt32(MyList.DataKeys[i]) || remove.Checked == true) 
					{

                        Label lblBookID = (Label)MyList.Rows[i].FindControl("bookID");
						//数量为0或用户选择删除
						if (quantity == 0 || remove.Checked == true) 
						{
							cart.RemoveItem(cartID, Int32.Parse(lblBookID.Text));
						}
						else 
						{
							cart.UpdateItem(cartID, Int32.Parse(lblBookID.Text),quantity);
						}
					}
				}
				catch 
				{
					MyError.Text = "对不起，您的输入信息有误！";
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
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

		protected void UpdateBtn_Click(object sender, System.EventArgs e)
		{
			//更新购物车记录，并重新显示记录
			UpdateShopCartDatabase();
			ShowShopCart();
		}

		protected void CheckoutBtn_Click(object sender, System.EventArgs e)
		{
			//更新购物车记录
			UpdateShopCartDatabase();

			//如果购物车不为空，跳转到CheckOut页面
			//否则，给出错误提示信息
			ShopCart cart = new ShopCart();
			//获得购物车ID
			string cartID = cart.GetShoppingCartId();
			//检查购物记录是否为0
			if (cart.GetItemCount(cartID) != 0)
			{
				Response.Redirect("MyOrderSubmit.aspx");
			}
			else
			{
				MyError.Text = "购物车为空，不能提交！";
			}	
		}
	}	
}
