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
using System.IO;

namespace eBookShop
{
	/// <summary>
	/// ManBookInfo 的摘要说明。
	/// </summary>
	public partial class ManBookInfo : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				BindList();
				ViewState["PostFileName"]="";
			}
		}

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

		protected void Add_Click(object sender, System.EventArgs e)
		{
			int ImageSize=0;
			byte[] ImageBuffer;
			string FileName;
			FileInfo TpFile;
			FileStream fs=null;
			FileName=Server.MapPath("\\eBookShop\\CoverUp").ToString().Trim()+"\\"+ViewState["PostFileName"];
			TpFile=new FileInfo(FileName);
			ImageSize=(int)TpFile.Length;

			fs=new FileStream(FileName,FileMode.OpenOrCreate);
			BinaryReader r=new BinaryReader(fs);
			r.BaseStream.Seek(0,SeekOrigin.Begin);
			ImageBuffer=r.ReadBytes(ImageSize);

			AdminDB admin = new AdminDB();
			try
			{
				admin.AddNewProduct(ProductName.Text.Trim(),Author.Text.Trim(),Translator.Text.Trim(),Press.Text.Trim(), decimal.Parse(Price.Text.Trim()), Intro.Text, int.Parse(ListCat.SelectedValue),ImageBuffer);
				MyError.Text = "添加成功！";

							}
			catch
			{
				MyError.Text = "出错了";
			}
		}

		void BindList()
		{
			ListCat.DataSource = Product.GetCategoryList();
			ListCat.DataTextField = "CategoryName";
			ListCat.DataValueField = "CategoryId";
			ListCat.DataBind();
		}

		protected void Post_Click(object sender, System.EventArgs e)
		{
			string Path;
			string FileName;
			int Po;
			long FileSize;
			string fType;
			if(File1.PostedFile.FileName.Trim()!="")  //PostFile's Filename is not empty
			{
				try
				{
					Path=Server.MapPath("\\eBookShop\\CoverUp").ToString();
					FileName=File1.PostedFile.FileName.ToString();
					fType=File1.PostedFile.ContentType; 
					FileSize=File1.PostedFile.ContentLength;  
					if(fType.Substring(0,5)!="image")
					{
						MyError.Text ="文件类型不正确！";
						return;
					}
					Po=FileName.LastIndexOf((char)92);
					FileName=FileName.Substring(Po+1,FileName.Length -Po-1);
					ViewState["PostFileName"]=FileName;                //Remember PostFile's name
					File1.PostedFile.SaveAs(Path+"\\"+FileName); 
					img_BookImg.ImageUrl="CoverUp\\"+FileName;
				}
				catch
				{
					MyError.Text = "图片出错了";
				}
			}
		}
	}
}
