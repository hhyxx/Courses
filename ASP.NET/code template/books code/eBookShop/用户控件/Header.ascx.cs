using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace eBookShop.�Զ���ؼ�
{



	/// <summary>
	///		Header ��ժҪ˵����
	/// </summary>
	public partial class Header : System.Web.UI.UserControl
	{

		



		protected void Page_Load(object sender, System.EventArgs e)
		{
			InitialHead();
		}


		void InitialHead()
		{
			Home.Visible=true;
			//�Ƿ��������û�
			if (SqlAccess.UserRole==null) 
			{
				Logout.Visible = false;				
				Login.Visible = true;
	
				BookType.Visible=false;
				BookInfo.Visible=false;
				BookAdd.Visible=false;
				Order.Visible=false;
				UserInfo.Visible=false;
				Sales.Visible=false;

				ChangeInfo.Visible=false;
				Pwd.Visible=false;
				MyShopCart.Visible=false;
				MyOrder.Visible=false;
			} 
			else 
			{	
				Login.Visible = false;
				Logout.Visible = true;

				if(SqlAccess.UserRole=="����Ա")
				{
					BookType.Visible=true;
					BookInfo.Visible=true;
					BookAdd.Visible=true;
					Order.Visible=true;
					UserInfo.Visible=true;
					Sales.Visible=true;
					ChangeInfo.Visible=true;
					Pwd.Visible=true;

					MyShopCart.Visible=false;
					MyOrder.Visible=false;
				}
				else
				{
					ChangeInfo.Visible=true;
					Pwd.Visible=true;
					MyShopCart.Visible=true;
					MyOrder.Visible=true;

					BookType.Visible=false;
					BookInfo.Visible=false;
					BookAdd.Visible=false;
					Order.Visible=false;
					UserInfo.Visible=false;
					Sales.Visible=false;
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
		///		�����֧������ķ��� - ��Ҫʹ�ô���༭��
		///		�޸Ĵ˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{

		}
		#endregion
	}
}
