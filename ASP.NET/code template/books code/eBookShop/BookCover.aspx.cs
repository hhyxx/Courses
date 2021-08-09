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
	/// BookCover ��ժҪ˵����
	/// </summary>
	public partial class BookCover : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			int id;
			DataView myDv;
			id=int.Parse(Request.QueryString["ProductId"].Trim());
			myDv=Product.GetBookCover(id);
			try
			{
				Response.ContentType="image/*";
				Response.BinaryWrite((byte[])myDv[0]["Cover"]);
			}
			catch
			{
				Response.Write("/img/pic.jpg");
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
	}
}
