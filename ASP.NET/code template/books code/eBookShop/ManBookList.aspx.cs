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
	/// ManBookList ��ժҪ˵����
	/// </summary>
	public partial class ManBookList : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				BindGrid();
			}
		}

		void BindGrid()
		{		
			AdminDB admin = new AdminDB();
			GridProduct.DataSource = admin.GetAllProduct();
			GridProduct.DataBind();
		}
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
		void UpdateProductInfo()
		{
			AdminDB admin = new AdminDB();

			for (int i=0; i< GridProduct.Rows.Count; i++)
			{
				int productId = Convert.ToInt32(GridProduct.DataKeys[i]);

				string productName = ((TextBox) GridProduct.Rows[i].FindControl("ProductName")).Text.Trim();

				decimal price = decimal.Parse(((TextBox) GridProduct.Rows[i].FindControl("Price")).Text.Trim());

				string intro = ((TextBox) GridProduct.Rows[i].FindControl("Intro")).Text;
				string author = ((TextBox) GridProduct.Rows[i].FindControl("Author")).Text;
				string translator = ((TextBox) GridProduct.Rows[i].FindControl("Translator")).Text;
				string press = ((TextBox) GridProduct.Rows[i].FindControl("Press")).Text;

				CheckBox remove = (CheckBox) GridProduct.Rows[i].FindControl("Remove");
				
				try
				{

					if (remove.Checked)
					{
						admin.DeleteProduct(productId);
					}

					else
					{
						admin.AlterProduct(productId, productName, price, intro,author,translator,press);
					}
                    Message.Text = "�����ɹ���";//��ʾ�ɹ�
				}
				catch
				{
					Message.Text = "��������";
				}
			}
		}
		private void GridProduct_PageIndexChanged(object source, System.Web.UI.WebControls.GridViewPageEventArgs e)
		{
			GridProduct.PageIndex = e.NewPageIndex;
			BindGrid();
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
			this.GridProduct.PageIndexChanging += new System.Web.UI.WebControls.GridViewPageEventHandler(this.GridProduct_PageIndexChanged);

		}
		#endregion

		protected void Submit_Click(object sender, System.EventArgs e)
		{
			UpdateProductInfo();
			BindGrid();
		}
	}
}
