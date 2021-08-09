using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite5
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
      
            protected int currentColorIndex;
            protected string[] colors = { "Red", "Green", "Blue", "Yellow", };
            protected void Page_Load(object sender, EventArgs e)
            {//IsPostBack的值指示是正为响应客户端回发而加载用户控件，还是正第一次加载和访问、
                //用户控件。如果是正为响应客户端回发而加载用户控件，则为 true；否则为 false。
                if (IsPostBack)
                {
                    currentColorIndex = Int16.Parse(ViewState["currentColorIndex"].ToString());
                }
                else
                {
                    currentColorIndex = 0;
                    DisplayColor();
                }
            }
            private void DisplayColor()
            {
                TextBoxColor.Text = colors[currentColorIndex];
                //在文本框文字改变时字体的颜色也相应改变
                TextBoxColor.ForeColor = System.Drawing.Color.FromName(colors[currentColorIndex]);
                String strColor = colors[currentColorIndex];
                Response.Write("<body   bgColor=" + strColor + "></body>");//让网页背景改变颜色。
                //下面的代码演示如何以多种不同的字号显示相同的 HTML 文本。
                for (int i = 0; i < 10; i++)
                {
                    Response.Write("<font size=" + i + "> Hello World! </font>");
                }
                //下面的代码演示以多种不同的颜色显示相同的 HTML 文本。
                String strColor2 = colors[(currentColorIndex + 1) % 4];
                Response.Write("<font color=" + Color.FromName(strColor2).ToKnownColor() +
                     ">  岁月无情增中减，书香有味苦后甜 </font>");
                ViewState["currentColorIndex"] = currentColorIndex.ToString();
            }
            protected void BottonUp_Click(object sender, EventArgs e)
            {
                if (currentColorIndex == 0)
                {
                    currentColorIndex = colors.Length - 1;
                }
                else
                {
                    currentColorIndex -= 1;
                }
                DisplayColor();
            }
            protected void ButtonDown_Click(object sender, EventArgs e)
            {
                if (currentColorIndex == (colors.Length - 1))
                {
                    currentColorIndex = 0;
                }
                else
                {
                    currentColorIndex += 1;
                }
                DisplayColor();
            }
        }

    }
