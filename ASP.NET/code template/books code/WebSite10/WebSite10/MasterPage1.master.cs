using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite10
{
    public partial class MasterPage1 : System.Web.UI.MasterPage
    {
        protected void IncrementButton_Click(object sender, EventArgs e)
        {
            //找到内容页中的Calendar1对象
            Calendar cal = ((Calendar)ContentPlaceHolder1.FindControl("Calendar1"));
            //将Calendar1对象日期增加一天
            cal.SelectedDate = cal.SelectedDate.AddDays(1);
        }
        protected void DecrementButton_Click(object sender, EventArgs e)
        {
            //找到内容页中的Calendar1对象
            Calendar cal = ((Calendar)ContentPlaceHolder1.FindControl("Calendar1"));
            //将Calendar1对象日期减少一天
            cal.SelectedDate = cal.SelectedDate.AddDays(-1);
        }
    }
}