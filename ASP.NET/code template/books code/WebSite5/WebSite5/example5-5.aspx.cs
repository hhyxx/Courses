using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5
{
    public partial class example5_5 : System.Web.UI.Page
    {
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownList1.SelectedItem.Text.Trim())
            {
                case "宝马":
                    ListBox1.Items.Clear();
                    ListBox1.Items.Add("轿车-宝马3系");
                    ListBox1.Items.Add("SUV-宝马X5");
                    ListBox1.Items.Add("跑车-宝马i8 ");
                    break;
                case "奔驰":
                    ListBox1.Items.Clear();
                    ListBox1.Items.Add("轿车-奔驰C级");
                    ListBox1.Items.Add("SUV-奔驰GLK级");
                    ListBox1.Items.Add("MPV-奔驰R级");
                    break;
                case "丰田":
                    ListBox1.Items.Clear();
                    ListBox1.Items.Add("轿车-卡罗拉");
                    ListBox1.Items.Add("MPV-逸致");
                    ListBox1.Items.Add("SUV-汉兰达");
                    break;
                case "一汽":
                    ListBox1.Items.Clear();
                    ListBox1.Items.Add("轿车-夏利N7");
                    ListBox1.Items.Add("SUV-骏派D60");
                    ListBox1.Items.Add("MPV-森雅M80");
                    break;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string msg = "您选择的爱车是：";
            foreach (ListItem li in ListBox1.Items)
            {
                if (li.Selected == true)
                {
                    msg += "<br />" + li.Text;
                }
            }
            Label1.Text = msg;
        }
    }
}