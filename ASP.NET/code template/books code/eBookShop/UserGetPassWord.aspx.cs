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
	/// GetPassWord ��ժҪ˵����
	/// </summary>
	public partial class GetPassWord : System.Web.UI.Page
	{
		protected System.Web.UI.HtmlControls.HtmlForm Form4;
	
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
	int result  = user.GetBackPassword(LoginName.Text.Trim(), Question.Text.Trim(),
		Answer.Text.Trim(), Email.Text);
	if (result == 1)
	{
		Message.Text = "���������ѷ��ͣ��뵽�������";
		//user.ChangePassword(
	}
	else
	{
		Message.Text = "����������Ϣ����";
	}
}
	}
}
