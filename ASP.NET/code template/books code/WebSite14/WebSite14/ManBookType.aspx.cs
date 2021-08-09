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
	/// ManBookType ��ժҪ˵����
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

protected void Add_Click(object sender, System.EventArgs e)
{
	AdminDB admin = new AdminDB();
	try
	{
		admin.AddNewCategory(CategoryName.Text.Trim());
		MyError.Text = "��ӳɹ���";
		BindList();
	}
	catch
	{
		MyError.Text = "�����ˣ�";
	}
}

protected void Delete_Click(object sender, System.EventArgs e)
{
	AdminDB admin = new AdminDB();
	try
	{
		admin.DeleteCategory(int.Parse(ListCat.SelectedValue));
		MyError.Text = "ɾ���ɹ���";
		BindList();
	}
	catch
	{
		MyError.Text = "�����ˣ�";
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
