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
	/// ManBookType 的摘要说明。
	/// </summary>
	public partial class ManBookType : System.Web.UI.Page
	{
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				BindList();
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

protected void Add_Click(object sender, System.EventArgs e)
{
	AdminDB admin = new AdminDB();
	try
	{
		admin.AddNewCategory(CategoryName.Text.Trim());
		MyError.Text = "添加成功！";
		BindList();
	}
	catch
	{
		MyError.Text = "出错了！";
	}
}

protected void Delete_Click(object sender, System.EventArgs e)
{
	AdminDB admin = new AdminDB();
	try
	{
		admin.DeleteCategory(int.Parse(ListCat.SelectedValue));
		MyError.Text = "删除成功！";
		BindList();
	}
	catch
	{
		MyError.Text = "出错了！";
	}
}
		void BindList()
		{
			ListCat.DataSource = Product.GetCategoryList();
			ListCat.DataTextField = "CategoryName";
			ListCat.DataValueField = "CategoryId";
			ListCat.DataBind();
		}
	}
}
