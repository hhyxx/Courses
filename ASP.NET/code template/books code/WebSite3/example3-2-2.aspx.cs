using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class example3_2_2 : System.Web.UI.Page
{

  protected void Page_Load(object sender, EventArgs e)
    {
    	// 获得查询字符串集合，通过不同属性作为下标的数组
        Response.Write(Request.QueryString); 
        Response.Write("<br/>"); // 换行符
        Response.Write(Request.QueryString["username"]);
        // 获取username 的值
    }

}