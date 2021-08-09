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
	/// MyOrderItem 的摘要说明。
	/// </summary>
	public partial class MyOrderItem : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				ShowMenu();
			}
			
			//获得所要查询的订单号
			int orderID = int.Parse(Request.QueryString["orderID"]);
			// 获得用户ID
			
			string userID = User.Identity.Name;
			///从数据库获得订单详细信息
			Orders orderHistory = new Orders();
			OrderDetails orderDetail = orderHistory.GetOrderDetails(orderID, userID);

			if (orderDetail != null)
			{
				GridControl1.DataSource = orderDetail.OrderItems;
				GridControl1.DataBind();
				//显示订单的信息
				lblTotal.Text = String.Format( "{0:c}", orderDetail.OrderTotal);
				lblOrderNumber.Text = orderID.ToString();
				lblOrderDate.Text = orderDetail.OrderDate.ToShortDateString();
			}
			else
			{
				MyError.Text = "订单不存在！";
				detailsTable.Visible =false;
			}
		}

		void ShowMenu()
		{
			//						
			if(SqlAccess.UserRole==null)
			{
				Response.Redirect("UserLogin.aspx");
			}
		}
        public override void VerifyRenderingInServerForm(Control control)
        {
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
