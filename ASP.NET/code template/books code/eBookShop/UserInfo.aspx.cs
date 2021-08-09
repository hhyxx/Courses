//===========================================================================
// ���ļ�����Ϊ ASP.NET 2.0 Web ��Ŀת����һ�����޸ĵġ�
// �����Ѹ��ģ��Ҹ����Ѹ�Ϊ��
//// �ļ���App_Code\Migrated\Stub_UserInfo_aspx_cs.cs���еĳ������̳С�
// ������������ʱ������ Web Ӧ�ó����е�������Ϳ���ʹ�øó������󶨺ͷ��� 
// ��������ҳ��
// ����������ҳ��UserInfo.aspx��Ҳ�Ѹ�Ϊ�����µ�������
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
	/// UserInfo ��ժҪ˵����
	/// </summary>
	public partial class Migrated_UserInfo : UserInfo
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				GetUserInfo();
			}
		}

		void GetUserInfo()
		{
			User user = new User();
			UserInfoCl userInfo = user.GetUserInfo(User.Identity.Name);

			RealName.Text = userInfo.userRealName;
//			UserName.Text = userInfo.username ;
			Question.Text=userInfo.question;
			Answer.Text=userInfo.answer ;
			Email.Text = userInfo.email;
		
		}

void UpdateUserInfo()
{
	User user = new eBookShop.User();
	user.ChangeProfile(User.Identity.Name, RealName.Text,
		Question.Text,Answer.Text , Email.Text);
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
			try
			{

				UpdateUserInfo();
				Message.Text = "�޸ĳɹ���";
			}
			catch
			{
				Message.Text = "����δ֪�Ĵ���";
			}
		}

	}
}
