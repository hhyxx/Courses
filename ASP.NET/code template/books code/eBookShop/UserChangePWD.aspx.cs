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
	/// UserChangePW ��ժҪ˵����
	/// </summary>
	public partial class UserChangePW : System.Web.UI.Page
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
			User user = new User();
			int result = user.ChangePassword(OldPwd.Text.Trim(), NewPwd.Text.Trim(), int.Parse(User.Identity.Name));

			if (result == 1)
			{
				Message.Text = "�����޸ĳɹ���";
			}
			else
			{
				Message.Text = "����������ԭ���벻ƥ�䣡";
			}
		}
	}
}
