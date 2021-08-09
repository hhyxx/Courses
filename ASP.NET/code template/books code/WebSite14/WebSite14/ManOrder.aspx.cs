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
	/// ManOrder ��ժҪ˵����
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
				this.Message.Text = "������ " + ds.Tables[0].Rows.Count.ToString() + " ��������";
			}
			catch
			{
				this.Message.Text="��������";
			}			
		}

		#region Web ������������ɵĴ���
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
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
//				this.Message.Text = "������ " + ds.Tables[0].Rows.Count.ToString() + " ������δ����";
//			}
//			catch
//			{
//				this.Message.Text="��������";
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
                Message.Text = "��������";	//��ʾʧ��
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
