//===========================================================================
// ���ļ�����Ϊ ASP.NET 2.0 Web ��Ŀת����һ�����޸ĵġ�
// �����Ѹ��ģ��Ҹ����Ѹ�Ϊ��
//// �ļ���App_Code\Migrated\Stub_UserLogin_aspx_cs.cs���еĳ������̳С�
// ������������ʱ������ Web Ӧ�ó����е�������Ϳ���ʹ�øó������󶨺ͷ��� 
// ��������ҳ��
// ����������ҳ��UserLogin.aspx��Ҳ�Ѹ�Ϊ�����µ�������
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
	/// SignIn ��ժҪ˵����
	/// </summary>
	public partial class Migrated_Login : Login
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
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

protected void Submit_Click(object sender, System.EventArgs e)
{
	User user = new eBookShop.User();
	int userId = user.Login (LoginName.Text,Password.Text);
	SqlAccess.UserRole=user.GetUserRole(userId);
	//�õ���ʱ�Ĺ��ﳵ���
	ShopCart  cart = new ShopCart ();
	string tempCartID = cart.GetShoppingCartId();
	if (userId == 0)
	{
		Message.Text = "�û������������";
	}
	else
	{
		//��δͨ����֤ʱ���û�������������ϢǨ�������û��ĸ��˼�¼��
		cart.MigrateCart(tempCartID, userId.ToString());
		System.Web.Security.FormsAuthentication.RedirectFromLoginPage(userId.ToString(), CheckCookie.Checked);
		//Response.Redirect("MyAccount.aspx");
	}
}
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
	}
}
