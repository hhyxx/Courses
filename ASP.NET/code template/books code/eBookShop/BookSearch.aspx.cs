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
	public partial class BookSearch : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			BindList();
		}

		void BindList()
		{
			ListCat.DataSource = Product.GetCategoryList();
			ListCat.DataTextField = "CategoryName";
			ListCat.DataValueField = "CategoryId";
			ListCat.DataBind();
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

		protected void SearchBtn_Click(object sender, System.EventArgs e)
		{
			string Name = this.txtName.Text;
			string Author = this.txtAuthor.Text.Trim();
			string Translator = this.txtTranslator.Text.Trim();
			string Publisher = this.txtPublisher.Text.Trim();
			string TypeId = this.ListCat.Items[this.ListCat.SelectedIndex].Value;

			string str = "";

			if(int.Parse(TypeId)>=0)
			{
				str += " And CategoryId=" + TypeId;
			}
			if(Author.Length>0)
			{
				str += " And Author Like '%" + Author + "%'";
			}
			if(Name.Length>0)
			{
				str += " And ProductName Like '%" + Name + "%'";
			}
			if(Translator.Length>0)
			{
				str += " And Translator Like '%" + Translator + "%'";
			}
			if(Publisher.Length>0)
			{
				str += " And Press Like '%" + Publisher + "%'"; 
			}
			Response.Redirect("BookSearchResult.aspx?Condition=" + str);
		}
	}
}
