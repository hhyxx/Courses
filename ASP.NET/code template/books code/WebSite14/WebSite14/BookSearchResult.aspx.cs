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
	/// BookSearch ��ժҪ˵����
	/// </summary>
	public partial class BookSearchResult : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsPostBack)
			{
				Bind();
			}
		}
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
		private void Bind()
		{
			DataSet ds = Product.Search(Request["Condition"]);
			//lblInfo.Text = "Total results:" + ds.Tables[0].Rows.Count.ToString();
			this.GridView1.DataSource = ds.Tables[0].DefaultView;
			this.GridView1.DataBind();
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

		}
		#endregion
	}
}
