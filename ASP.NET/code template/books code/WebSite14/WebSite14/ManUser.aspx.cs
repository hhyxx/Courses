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
	/// ManUser 的摘要说明。
	/// </summary>
	public partial class ManUser : System.Web.UI.Page
	{
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
		protected System.Web.UI.HtmlControls.HtmlForm Form3;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				BindGrid();
				
			}
		}
		
		void BindGrid()
		{
			AdminDB admin = new AdminDB();
			GridUsers.DataSource = admin.GetUserList();
			GridUsers.DataBind();
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
            this.GridUsers.PageIndexChanging += new System.Web.UI.WebControls.GridViewPageEventHandler(this.GridUsers_PageIndexChanged);
            this.GridUsers.RowCancelingEdit += new System.Web.UI.WebControls.GridViewCancelEditEventHandler(this.GridUsers_CancelCommand);
            this.GridUsers.RowEditing += new System.Web.UI.WebControls.GridViewEditEventHandler(this.GridUsers_EditCommand);
            this.GridUsers.RowUpdating += new System.Web.UI.WebControls.GridViewUpdateEventHandler(this.GridUsers_UpdateCommand);

		}
		#endregion
        public override void VerifyRenderingInServerForm(Control control)
        {
        } 
        protected void GridUsers_PageIndexChanged(object source, System.Web.UI.WebControls.GridViewPageEventArgs e)
		{
			GridUsers.PageIndex = e.NewPageIndex;
			BindGrid();
		}



        protected void GridUsers_EditCommand(object source, System.Web.UI.WebControls.GridViewEditEventArgs e)
		{
			//设置当前行为编辑状态
			GridUsers.EditIndex =e.NewEditIndex;
			//绑定数据				
			BindGrid();
		}

        protected void GridUsers_CancelCommand(object source, GridViewCancelEditEventArgs e)
		{
			GridUsers.EditIndex = -1;
			BindGrid();
		}

        protected void GridUsers_UpdateCommand(object source, GridViewUpdateEventArgs e)
		{

            string role = ((TextBox)GridUsers.Rows[e.RowIndex].FindControl("Role")).Text.Trim();
			
			//获得要更改的用户的UserId
            int userId = Convert.ToInt32(GridUsers.DataKeys[e.RowIndex]);

			AdminDB admin = new AdminDB();
			admin.UpdateUserRole(role, userId.ToString());
			//退出编辑状态
			GridUsers.EditIndex = -1;
			//绑定
			BindGrid();
		}


}
}
