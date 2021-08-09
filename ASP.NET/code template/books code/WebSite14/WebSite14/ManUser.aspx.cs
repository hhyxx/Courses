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
	/// ManUser ��ժҪ˵����
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
			//���õ�ǰ��Ϊ�༭״̬
			GridUsers.EditIndex =e.NewEditIndex;
			//������				
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
			
			//���Ҫ���ĵ��û���UserId
            int userId = Convert.ToInt32(GridUsers.DataKeys[e.RowIndex]);

			AdminDB admin = new AdminDB();
			admin.UpdateUserRole(role, userId.ToString());
			//�˳��༭״̬
			GridUsers.EditIndex = -1;
			//��
			BindGrid();
		}


}
}
