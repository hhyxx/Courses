using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//�������ݿ�������ƿռ�
using System.Data.SqlClient;
using System.Configuration;


namespace WebSite8
{
    public partial class command_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //����Command����
            SqlCommand sqlcommand = new SqlCommand();
            //��sqlcommand��Connection���Ը�ֵ
            sqlcommand.Connection = sqlconn;
            //������
            sqlconn.Open();
            //SQL���ֵ

            sqlcommand.CommandText = "select * from student";
            //����DataReader���󣬲����ز�ѯ���
            SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
            //���б�����ѯ���


            // �±��0��ʼ��ÿ�ζ�ȡ���ݿ��б��һ��
            while (sqldatareader.Read())
            {
                Label1.Text += sqldatareader.GetString(0) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(1) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(2) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetDateTime(3) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(4) + "&nbsp;&nbsp;";
                Label1.Text += sqldatareader.GetString(5) + "&nbsp;&nbsp;<br>";
            };
            sqlcommand = null; // �ÿ�
            sqlconn.Close();
            sqlconn = null; // �ÿ�
        }

    }
}