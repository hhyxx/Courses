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
	/// ManOrder 的摘要说明。
	/// </summary>
	public partial class ManOrder : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(!Page.IsPostBack)
			{				
				Bind();		
			}
		}
		private void Bind()
		{
			try
			{
				Orders  orders = new Orders ();
				DataSet ds =orders.GetAllOrder();
				//ds.Tables[0].DefaultView.Sort = ViewState["Sort"].ToString();
				this.GridView1.DataSource = ds.Tables[0].DefaultView;
				this.GridView1.DataBind();
				this.Message.Text = "您共有 " + ds.Tables[0].Rows.Count.ToString() + " 条订单。";
			}
			catch
			{
				this.Message.Text="发生错误。";
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
			this.GridView1.PageIndexChanging += new GridViewPageEventHandler(this.GridView1_PageIndexChanged);
            this.GridView1.RowEditing += new System.Web.UI.WebControls.GridViewEditEventHandler(this.GridView1_EditCommand);

		}
		#endregion

//		private void UnDeal_Click(object sender, System.EventArgs e)
//		{
//			try
//			{
//				Orders  orders = new Orders ();
//				DataSet ds =orders.GetUnDealOrder ();
//				//ds.Tables[0].DefaultView.Sort = ViewState["Sort"].ToString();
//				this.GridView1.DataSource = ds.Tables[0].DefaultView;
//				this.GridView1.DataBind();
//				this.Message.Text = "您共有 " + ds.Tables[0].Rows.Count.ToString() + " 条订单未处理。";
//			}
//			catch
//			{
//				this.Message.Text="发生错误。";
//			}	
//		}

//		private void All_Click(object sender, System.EventArgs e)
//		{
//			Bind();
//		}
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
        protected void GridView1_EditCommand(object source, GridViewEditEventArgs e)
		{
			try
			{				
				string oid = this.GridView1.DataKeys[e.NewEditIndex].ToString();
				Orders  orders = new Orders ();
				orders.DealOrder(oid);
				Bind();
			}
			catch
			{
                Message.Text = "发生错误";	//提示失败
			}
		}

//		private void GridView1_SortCommand(object source, System.Web.UI.WebControls.GridViewSortCommandEventArgs e)
//		{
//			if(ViewState["Sort"].ToString() == e.SortExpression)
//			{
//				ViewState["Sort"] += " desc";
//			}
//			else
//			{
//				ViewState["Sort"] = e.SortExpression;
//			}
//			Bind();
//		}

        protected void GridView1_PageIndexChanged(object source, GridViewPageEventArgs e)
		{
            
			this.GridView1.PageIndex = e.NewPageIndex;
			Bind();
		}


}
}
