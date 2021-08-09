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
	/// BookCheckOut ��ժҪ˵����
	/// </summary>
	public partial class BookCheckOut : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				//�õ�cartID 
				ShopCart cart = new ShopCart();
				string cartID = cart.GetShoppingCartId();
				//�󶨹��ﳵ��Ϣ��GridView
				MyGridView.DataSource = cart.GetItems(cartID);
				MyGridView.DataBind();
				//�õ����ﳵ�ܻ���
				TotalLbl.Text = String.Format( "{0:c}", cart.GetTotal(cartID));
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
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
		protected void SubmitBtn_Click(object sender, System.EventArgs e)
		{
			ShopCart cart = new ShopCart();
			string cartID = cart.GetShoppingCartId();
			decimal totalCost = cart.GetTotal(cartID);

			string userID = User.Identity.Name;

			if (cartID!=null && userID!=null)
			{
				Orders order = new Orders();

				int orderID = order.PlaceOrder(userID, cartID);

				Message.Text = "���Ķ�����Ϊ"+orderID;

				SubmitBtn.Visible = false;

			}
		}


	}
}
