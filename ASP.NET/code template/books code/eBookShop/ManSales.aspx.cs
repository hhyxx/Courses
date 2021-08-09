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
	/// manSales 的摘要说明。
	/// </summary>
	public partial class manSales : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				BindDate();
				//绑定当天记录
				BindGrid(DateTime.Now.Year.ToString(), DateTime.Now.Month.ToString(), DateTime.Now.Day.ToString());
				//显示为当前日期
				Year.SelectedValue = DateTime.Now.Year.ToString();
				Month.SelectedValue =  DateTime.Now.Month.ToString();
				Day.SelectedValue = DateTime.Now.Day.ToString();
			}
		}

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
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
			//绑定年
			for (int i=2000; i<2020; i++)
			{
				ListItem item = new ListItem(Convert.ToString(i),Convert.ToString(i));
				Year.Items.Add(item);
			}
			//绑定月
			for (int i = 1 ; i<13 ; i++)
			{
				ListItem item1 =  new ListItem(Convert.ToString(i),Convert.ToString(i));
				Month.Items.Add(item1);
			}
			//绑定日
			for (int i=1; i<32; i++)
			{
				ListItem item2 =  new ListItem(Convert.ToString(i),Convert.ToString(i));
				Day.Items.Add(item2);
			}
		}
	}
}
