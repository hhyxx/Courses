//===========================================================================
// ���ļ�����Ϊ ASP.NET 2.0 Web ��Ŀת����һ�����޸ĵġ�
// �����Ѹ��ģ��Ҹ����Ѹ�Ϊ��
//// �ļ���App_Code\Migrated\Stub_BookInfo_aspx_cs.cs���еĳ������̳С�
// ������������ʱ������ Web Ӧ�ó����е�������Ϳ���ʹ�øó������󶨺ͷ��� 
// ��������ҳ��
// ����������ҳ��BookInfo.aspx��Ҳ�Ѹ�Ϊ�����µ�������
// �йش˴���ģʽ�ĸ�����Ϣ����ο� http://go.microsoft.com/fwlink/?LinkId=46995 
//===========================================================================
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace eBookShop
{
	/// <summary>
	/// BookInfo ��ժҪ˵����
	/// </summary>
	public partial class Migrated_BookInfo : BookInfo
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			//ҳ���һ�μ���ʱ
			if (!Page.IsPostBack)
			{
				ShowProductInfo();
			}
			
		}

		void ShowProductInfo()
		{
			//��ȡGet��ʽ���ݵ�ProductId������ֵ
			int productId = int.Parse(Request["BookId"]);
			//��ȡĳ����Ʒ����ϸ��Ϣ
			DataRow myDr;
			myDr = Product.GetBookDetail(productId);
			//��Ʒ�Ƿ����
			if (myDr == null)
			{
				lb_BookName.Text = "û�������Ʒ";
			}
			else
			{

				//��ʾ��Ʒ��ϸ��Ϣ
				lb_BookName.Text = myDr["ProductName"].ToString();
				lb_BookType.Text=myDr["CategoryName"].ToString();
				lb_Image.Text=myDr["image"].ToString ();

				lb_Author.Text=myDr["Author"].ToString();
				lb_Translator.Text=myDr["Translator"].ToString();
				lb_Press.Text=myDr["Press"].ToString();
				lb_Price.Text=myDr["ProductPrice"].ToString();
				Textarea1.Value =myDr["Intro"].ToString();

//				lb_Author.Text=myDr.Author;
//				lb_Translator.Text=myDr.Translator;
//				lb_Press.Text=myDr.Press ;
//				lb_Price.Text = myDr.productPrice.ToString();
//				Textarea1.Value = myDr.intro;
				//lb_Image.Text=pro.cover;
//				lblClickCount.Text = pro.clickCount.ToString();
			}
		}

		#region Web ������������ɵĴ���
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

		private void lb_Buy_Click(object sender, System.EventArgs e)
		{
		
		}
	}
}
