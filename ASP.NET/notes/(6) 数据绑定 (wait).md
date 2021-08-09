# 1. 单值和列表控件的数据绑定



```html
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="53px" Width="150px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
</asp:DropDownList> 

<asp:CheckBoxList ID="CheckBoxList1" runat="server" Height="98px" Width="100%">
  <asp:ListItem>未绑定</asp:ListItem>
</asp:CheckBoxList>

<asp:BulletedList ID="BulletedList1" runat="server" Height="160px" Target="_blank" Width="73%" BulletStyle="Disc">
</asp:BulletedList>
```



```c#
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebSite9{
    public partial class ListValueBinding : System.Web.UI.Page{
        //定义三种数据源
        //定义并初始化字符串数组
        String[] DDLstr = new String[] { "张小兵", "李明", "陈飞" };
        Hashtable CBLhash = new Hashtable(3);  //定义哈希表
        ArrayList BLarray = new ArrayList();    //定义ArrayList
        protected void Page_Load(object sender, EventArgs e){
            if (!IsPostBack){
                //初始化哈希表DataSourceForCBL
                this.CBLhash.Add("徐明明", "男");
                this.CBLhash.Add("韩旭", "女");
                this.CBLhash.Add("陈静", "女");

                //初始化DataSourceForBL 新建类
                this.BLarray.Add(new KeyValueClass("百度", "http://www.baidu.com"));
                this.BLarray.Add(new KeyValueClass("CSDN", "http://www.CSDN.net"));

                //为DropDownList绑定数据
                this.DropDownList1.DataSource = this.DDLstr;
                this.DropDownList1.DataBind();

                //完成绑定后在DropDownList中第一个位置插入一个数据项
                this.DropDownList1.Items.Insert(0, "请选择");

                //为CheckBoxList绑定数据
                this.CheckBoxList1.DataSource = this.DataSourceForCBL;
                //由于哈希表中存储一个键值对的集合并希望在CheckBoxList
                //中处理键值对，因此设定数据源后还需设定DataTextField和DataValueField属性
                this.CheckBoxList1.DataTextField = "key";
                this.CheckBoxList1.DataValueField = "value";
                this.CheckBoxList1.DataBind();
                
                //为BulletedList绑定数据
                this.BulletedList1.DataSource = this.BLarray;
                this.BulletedList1.DataTextField = "Name";
                this.BulletedList1.DataValueField = "Url";
                this.BulletedList1.DataBind();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e){
            TextBox1.Text = ""; //清除上次显示内容
            //在文本框中显示所选列表项
            TextBox1.Text = DropDownList1.SelectedValue;
        }

        protected void Button1_Click(object sender, EventArgs e){
            TextBox2.Text = "";
            //循环遍历CheckBoxList中每个项，如果已选择在文本框中显示选中项显示文本和值
            foreach (ListItem li in CheckBoxList1.Items){
                if (li.Selected) TextBox2.Text += li.Text + ":" + li.Value + ",";
            }
        }
    }
}
```



```c#
/// <summary>
/// 帮助类KeyValueClass的定义，其对象存储一个WebSiteName：WebSiteUrl
/// 的键值对，被添加至作为数据源的ArrayList中
/// </summary>
using System;
public class KeyValueClass
{
    private String WebSiteName;
    private String WebSiteUrl;
    
    public String Name{
        get { return WebSiteName; }
        set { WebSiteName = value; }
    }
    public String Url{
        get { return WebSiteUrl; }
        set { WebSiteUrl = value; }
    }
    public KeyValueClass(String name, String url){
        this.WebSiteName = name;
        this.WebSiteUrl = url;
    }
}

```



# 2. GridView 控件



```html
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewBingding_1.aspx.cs" Inherits="WebSite9.GridViewBingding_1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:GridView ID="GridView1" runat="server"> </asp:GridView>
     <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br/>
    </div>
    </form>
</body>
</html>
```



```c#
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite9{
    public partial class GridViewBingding_1 : System.Web.UI.Page{
        protected void Page_Load(object sender, EventArgs e){
            //查询student数据库获取结果集ds
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            DataSet ds = new DataSet();
            using (SqlConnection sqlconn = new SqlConnection(sqlconnstr)){
                SqlDataAdapter sqld = new SqlDataAdapter("select * from student", sqlconn);
                sqld.Fill(ds, "tabstudent");
            }
            //以数据集中名为tabstudent的DataTable作为数据源，为控件绑定数据
            GridView1.DataSource = ds.Tables["tabstudent"].DefaultView;
            GridView1.DataBind();
            //label中显示运行状态
            Label1.Text = "查找成功";
        }
    }
}
```

