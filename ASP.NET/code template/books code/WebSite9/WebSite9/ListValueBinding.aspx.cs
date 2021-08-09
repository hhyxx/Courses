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