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
	/// manSales ��ժҪ˵����
	/// </summary>
	public partial class manSales : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				BindDate();
				//�󶨵����¼
				BindGrid(DateTime.Now.Year.ToString(), DateTime.Now.Month.ToString(), DateTime.Now.Day.ToString());
				//��ʾΪ��ǰ����
				Year.SelectedValue = DateTime.Now.Year.ToString();
				Month.SelectedValue =  DateTime.Now.Month.ToString();
				Day.SelectedValue = DateTime.Now.Day.ToString();
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
		protected void QueryMonth_Click(object sender, System.EventArgs e)
		{
			BindGrid(Year.SelectedValue, Month.SelectedValue, "0");

		}

		protected void QueryDay_Click(object sender, System.EventArgs e)
		{
			BindGrid(Year.SelectedValue, Month.SelectedValue, Day.SelectedValue);

		}

		void BindGrid(string year, string month, string day)
		{
			GridSails.DataSource = new AdminDB().GetSails(year, month, day);
			GridSails.DataBind();
		}

		void BindDate()
		{
			//����
			for (int i=2000; i<2020; i++)
			{
				ListItem item = new ListItem(Convert.ToString(i),Convert.ToString(i));
				Year.Items.Add(item);
			}
			//����
			for (int i = 1 ; i<13 ; i++)
			{
				ListItem item1 =  new ListItem(Convert.ToString(i),Convert.ToString(i));
				Month.Items.Add(item1);
			}
			//����
			for (int i=1; i<32; i++)
			{
				ListItem item2 =  new ListItem(Convert.ToString(i),Convert.ToString(i));
				Day.Items.Add(item2);
			}
		}
	}
}
