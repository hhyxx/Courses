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
	/// BookAddToCart ��ժҪ˵����
	/// </summary>
	public partial class BookAddToCart : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (Request["BookId"] != null)
			{
				ShopCart cart = new eBookShop.ShopCart();
				//��ȡCartId
				string cartId = cart.GetShoppingCartId();
				//���ﳵ���ĳ����Ʒ������Ϊ1
				cart.AddItem(cartId, int.Parse(Request["BookId"]), 1);
			}
			//��ת�����ﳵҳ��
			Response.Redirect("MyShopCart.aspx");
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
