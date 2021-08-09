using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class example3_3 : System.Web.UI.Page
{
	// 页面加载事件，当网页加载完成后的发生的事件
    protected void Page_Load(object sender, EventArgs e)
    {
        Application.Lock(); // 加锁 所有网站共用，只能独占性打开。
        Application["usercount"] = (Convert.ToInt32(Application["usercount"]) + 1).ToString();
        // 转换为数字后执行+1，然后转换为string
        Application.UnLock(); // 解锁 所有网站共用
        labContent.Text = Application["usercount"].ToString();
        // 输出当前用户数字符串
    }
    
}