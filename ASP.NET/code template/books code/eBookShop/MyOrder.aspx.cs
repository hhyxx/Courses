//===========================================================================
// ���ļ�����Ϊ ASP.NET 2.0 Web ��Ŀת����һ�����޸ĵġ�
// �����Ѹ��ģ��Ҹ����Ѹ�Ϊ��
//// �ļ���App_Code\Migrated\Stub_MyOrder_aspx_cs.cs���еĳ������̳С�
// ������������ʱ������ Web Ӧ�ó����е�������Ϳ���ʹ�øó������󶨺ͷ��� 
// ��������ҳ��
// ����������ҳ��MyOrder.aspx��Ҳ�Ѹ�Ϊ�����µ�������
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
	/// MyOrder ��ժҪ˵����
	/// </summary>
	public partial class Migrated_MyOrder : MyOrder
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
//				ShowMenu();
			}

			string userID = User.Identity.Name;

			Orders orderHistory = new Orders();
			
			MyList.DataSource = orderHistory.GetOrderList(userID);
			MyList.DataBind();

			if (MyList.Rows.Count == 0)
			{
				MyList.Visible = false;
				MyError.Text = "��û�ж�����¼";
			}
		}
        public override void VerifyRenderingInServerForm(Control control)
        {
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
