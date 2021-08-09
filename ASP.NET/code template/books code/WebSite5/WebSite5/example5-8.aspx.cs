using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5
{
    public partial class example5_8 : System.Web.UI.Page
    {
        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            string str1, str2, str3 = "";
            if (TextBox1.Text == "")
            {
                string scriptString = "alert('用户名不能为空！'); ";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "warning", scriptString, true);
            }
            else
            {
                str1 = TextBox1.Text;
                if (RadioButtonMale.Checked)
                { str2 = "男"; }
                else
                { str2 = "女"; }
                str3 = this.myList.SelectedItem.Text;
                string scriptContent = "alert('您提供的信息是：姓名：" + str1 +
                     "  性别：" + str2 + " 选择的行星图片是：" + str3 + " '); ";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", scriptContent, true);
            }
        }
        void Page_Load(object src, EventArgs e)
        {
            if (!Page.IsCallback)
            {
                if (myList.SelectedIndex > -1)
                {
                    msg.Text = myList.SelectedItem.Text;
                    Image.ImageUrl = "~/Images/" + myList.SelectedItem.Value;
                    Image.AlternateText = myList.SelectedItem.Text;
                }
            }

        }
    }
}