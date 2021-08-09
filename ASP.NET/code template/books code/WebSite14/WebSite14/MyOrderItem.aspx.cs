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
	/// MyOrderItem ��ժҪ˵����
	/// </summary>
	public partial class MyOrderItem : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				ShowMenu();
			}
			
			//�����Ҫ��ѯ�Ķ�����
			int orderID = int.Parse(Request.QueryString["orderID"]);
			// ����û�ID
			
			string userID = User.Identity.Name;
			///�����ݿ��ö�����ϸ��Ϣ
			Orders orderHistory = new Orders();
			OrderDetails orderDetail = orderHistory.GetOrderDetails(orderID, userID);

			if (orderDetail != null)
			{
				GridControl1.DataSource = orderDetail.OrderItems;
				GridControl1.DataBind();
				//��ʾ��������Ϣ
				lblTotal.Text = String.Format( "{0:c}", orderDetail.OrderTotal);
				lblOrderNumber.Text = orderID.ToString();
				lblOrderDate.Text = orderDetail.OrderDate.ToShortDateString();
			}
			else
			{
				MyError.Text = "���������ڣ�";
				detailsTable.Visible =false;
			}
		}

		void ShowMenu()
		{
			//						
			if(SqlAccess.UserRole==null)
			{
				Response.Redirect("UserLogin.aspx");
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
