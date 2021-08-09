//===========================================================================
// ���ļ�����Ϊ ASP.NET 2.0 Web ��Ŀת����һ�����޸ĵġ�
// �����Ѹ��ģ��Ҹ����Ѹ�Ϊ��
//// �ļ���App_Code\Migrated\Stub_MyShopCart_aspx_cs.cs���еĳ������̳С�
// ������������ʱ������ Web Ӧ�ó����е�������Ϳ���ʹ�øó������󶨺ͷ��� 
// ��������ҳ��
// ����������ҳ��MyShopCart.aspx��Ҳ�Ѹ�Ϊ�����µ�������
// �йش˴���ģʽ�ĸ�����Ϣ����ο� http://go.microsoft.com/fwlink/?LinkId=46995 
//===========================================================================
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
	/// MyShopCart ��ժҪ˵����
	/// </summary>
	public partial class Migrated_MyShopCart : MyShopCart
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				ShowShopCart();
				ShowMenu();
			}
		}

		void ShowMenu()
		{
//						
			if(SqlAccess.UserRole==null)
			{
				Response.Redirect("UserLogin.aspx");
			}

			if (Request.IsAuthenticated == true)
						{
//							LogOutArea.Visible = false;
//							LogInArea.Visible = true;
						}
						else
						{
//							LogOutArea.Visible = true;
//							LogInArea.Visible = false;
						}
		}
		//********************************************************
		//
		//ShowShoppingCartList()������̬����
		//���Ĺ��ﳵ��Ϣ��GridView�ؼ�MyList
		//
		//********************************************************
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
		void ShowShopCart() 
		{

			ShopCart cart = new ShopCart();

			// �õ��û��Ĺ��ﳵID
			String cartID = cart.GetShoppingCartId();

			// ������ﳵ��û����Ʒ,GridView����
			if (cart.GetItemCount(cartID) == 0) 
			{
				DetailsPanel.Visible = false;
				MyError.Text = "���ﳵ��û����Ʒ��";
			}
			else 
			{

				// �󶨹��ﳵ��Ϣ��GridView
				MyList.DataSource = cart.GetItems(cartID);
				MyList.DataBind();

				//��ʾ�ܽ��
				lblTotal.Text = String.Format( "{0:c}", cart.GetTotal(cartID));
			}
		}

		//*******************************************************
		//
		// UpdateShoppingCartDatabase�������ݿͻ�������ĸ�����Ϣ
		// �ύ���ݿ⣬���Ĺ��ﳵ��Ϣ
		//
		//*******************************************************

		void UpdateShopCartDatabase() 
		{

			ShopCart cart = new ShopCart();

			// ����û���cartID
			String cartID = cart.GetShoppingCartId();

			// ����GridView��ÿһ��
			for (int i=0; i < MyList.Rows.Count; i++) 
			{
				// �ҵ�ĳ�е�������Ϣ��ɾ����Ϣ��
				TextBox quantityTxt = (TextBox) MyList.Rows[i].FindControl("Quantity");
				CheckBox remove = (CheckBox) MyList.Rows[i].FindControl("Remove");

				// ��������ֹ�û��ķǷ����룬��quanlityΪ������
				int quantity;
				try 
				{
					quantity = Int32.Parse(quantityTxt.Text);

					// ����������޸Ļ���Remove��ѡ��ѡ��
					if (quantity != Convert.ToInt32(MyList.DataKeys[i]) || remove.Checked == true) 
					{

                        Label lblBookID = (Label)MyList.Rows[i].FindControl("bookID");
						//����Ϊ0���û�ѡ��ɾ��
						if (quantity == 0 || remove.Checked == true) 
						{
							cart.RemoveItem(cartID, Int32.Parse(lblBookID.Text));
						}
						else 
						{
							cart.UpdateItem(cartID, Int32.Parse(lblBookID.Text),quantity);
						}
					}
				}
				catch 
				{
					MyError.Text = "�Բ�������������Ϣ����";
				}
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

		protected void UpdateBtn_Click(object sender, System.EventArgs e)
		{
			//���¹��ﳵ��¼����������ʾ��¼
			UpdateShopCartDatabase();
			ShowShopCart();
		}

		protected void CheckoutBtn_Click(object sender, System.EventArgs e)
		{
			//���¹��ﳵ��¼
			UpdateShopCartDatabase();

			//������ﳵ��Ϊ�գ���ת��CheckOutҳ��
			//���򣬸���������ʾ��Ϣ
			ShopCart cart = new ShopCart();
			//��ù��ﳵID
			string cartID = cart.GetShoppingCartId();
			//��鹺���¼�Ƿ�Ϊ0
			if (cart.GetItemCount(cartID) != 0)
			{
				Response.Redirect("MyOrderSubmit.aspx");
			}
			else
			{
				MyError.Text = "���ﳵΪ�գ������ύ��";
			}	
		}
	}	
}
