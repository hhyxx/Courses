using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5
{
    public partial class example5_6 : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "选择结果：";
            Label1.Text = "";
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    //Label1.Text += CheckBoxList1.Items[i].Text + " <br/> ";
                    str += CheckBoxList1.Items[i].Text + "、";
                }
            }

            if (str.EndsWith("、") == true) str = str.Substring(0, str.Length - 1);
            Label1.Text = str;

            if (str == "选择结果：")
            {
                string scriptString = "alert('请作出选择！');";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "warning!",
                     scriptString, true);
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = str;
            }
        }

        
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            this.CheckBoxList1.BackColor =
                CheckBox1.Checked ? System.Drawing.Color.Beige : System.Drawing.Color.Azure;
            CheckBoxList1.RepeatDirection =
                 CheckBox1.Checked ? RepeatDirection.Horizontal : RepeatDirection.Vertical;
        }
        
        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked)
            {
                this.CheckBoxList1.ForeColor = System.Drawing.Color.Red;
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                this.CheckBoxList1.ForeColor = System.Drawing.Color.Black;
                Label1.ForeColor = System.Drawing.Color.Black;
            }
        }

    }
}