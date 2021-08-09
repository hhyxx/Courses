namespace eBookShop.用户控件
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
    using System.Web.UI;

	/// <summary>
	///		Left 的摘要说明。
	/// </summary>
	public partial class Left : System.Web.UI.UserControl
	{

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 设置目录的选定项
			string selectionID = Request.Params["selection"];

			if ( selectionID != null)
			{
				GridView1.SelectedIndex = Int32.Parse(selectionID);
			}
			//将数据源绑定至DataList控件
			GridView1.DataSource = Product.GetCategoryList();
			GridView1.DataBind ();
		}
        //public override void VerifyRenderingInServerForm(Control control)
        //{
        //} 
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
