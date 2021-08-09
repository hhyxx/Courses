using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite9
 {
     
    public partial class SingleValueBinding : System.Web.UI.Page
    {
        //在页面代码中将通过绑定表达式直接引用该成员
        public String SingleValueBindingStr = "单值绑定";       
        protected void Page_Load(object sender, EventArgs e)
        {
            //页面的数据绑定方法，对于绑定表达式来说是关键的一步
            Page.DataBind();
            //通过在后台设置服务器控件属性来绑定数据
            //this.Label1.Text = this.SingleValueBindingStr + "1";
            this.TextBox1.Text = this.SingleValueBindingStr + "2";
            this.TextBox2.Text = this.SingleValueBindingStr + "3";
        }
    }
}