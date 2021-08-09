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
	/// Register ��ժҪ˵����
	/// </summary>
	public partial class Register : System.Web.UI.Page
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
	//���ע����Ϣ
	string userName = LoginName.Text.Trim();
	string password = Password.Text.Trim();
	string question = Question.Text.Trim();
	string answer = Answer.Text.Trim();
	string userrealname=UserRealName.Text.Trim();
	string email=Email.Text.Trim();
	string role="�û�";
	//�õ�ԭ����CartId
	ShopCart cart = new ShopCart();
	string tempCartId = cart.GetShoppingCartId();
	//��ͼ������û�
	User user = new User();
	int userId = user.AddNewUser(userName, password, question, answer,userrealname,email,role);
	//�������ֵΪ-1�����ʾ�û�������
	if (userId == -1)
	{
		Message.Text = "�û����Ѵ��ڣ�";
	}
	else
	{
		//�����û�Ϊͨ����֤
		System.Web.Security.FormsAuthentication.SetAuthCookie(userId.ToString(),false);
		//Ǩ�ƹ��ﳵ��¼
		//���û��ض�����û��ʻ�ҳ��
		Response.Redirect("UserLogin.aspx");
	}
}
	}
}
