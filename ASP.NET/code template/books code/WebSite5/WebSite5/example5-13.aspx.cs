using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5
{
    public partial class example5_13 : System.Web.UI.Page
    {
        void Page_Load(object src, EventArgs e)
        {
            // generate textbox controls
            int numtexts = int.Parse(DropDownList1.SelectedItem.Value);
            for (int i = 1; i <= numtexts; i++)
            {
                myPanel.Controls.Add(new LiteralControl("<p>"));
                TextBox t = new TextBox();
                t.Text = "TextBox" + i.ToString();
                t.ID = "TextBox" + i.ToString();
                myPanel.Controls.Add(t);
            }
        }
        protected void CheckBoxChangeFont_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxChangeFont.Checked)
            {
                this.myPanel.Font.Italic = true;
                this.myPanel.ForeColor = System.Drawing.Color.Red;
                Literal1.Text = "当前所显示字型是“斜体”，颜色是“红色”";
            }
            else
            {
                this.myPanel.Font.Italic = false;
                this.myPanel.ForeColor = System.Drawing.Color.Blue;
                Literal1.Text = "当前所显示字型是“默认字体”，颜色是“蓝色”";
            }
        }
        protected void CheckBoxChangeBkGround_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxChangeBkGround.Checked)
            {
                this.myPanel.BackColor = System.Drawing.Color.Bisque;//Bisque橘黄色
                Literal2.Text = "当前所显示背景颜色是“Bisque橘黄色”。";
            }
            else
            {
                this.myPanel.BackColor = System.Drawing.Color.Beige;//Beige 米黄色
                Literal2.Text = "当前所显示背景颜色是“Beige 米黄色”。";
            }
        }   

    }
}