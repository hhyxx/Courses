using System;
using System.Data;
using System.Data.SqlClient;

namespace eBookShop
{
	public class ProductDetails
	{
		public int productId;
		public string productName;
		//
		public string Author;
		public string Translator;
		public string Press;
		public decimal productPrice;
		public string intro;
		public int categoryId;
		public byte [] cover;
	}

	/// <summary>
	/// Product 的摘要说明。
	/// </summary>
	public class Product
	{
		public Product()
		{
		}

		/// <summary>
		/// 获取商品类型列表
		/// </summary>
		/// <returns>商品类型列表</returns>
		public static SqlDataReader GetCategoryList()
		{
			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, 
				CommandType.StoredProcedure, "GetCategoryList");
		}

		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
//		public static SqlDataReader GetNewProductsList()
//		{
//			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, 
//				CommandType.StoredProcedure, "GetNewBookList");
//		}
		public static DataRow GetBookDetail(int BookId )
		{
			string strSql;
			DataSet myDs;
			strSql="select e_BookCategory.CategoryName as CategoryName,e_BookInfo.Productid,e_BookInfo.Productname,author,Productprice,e_BookInfo.CategoryId,intro,press,translator,image=case when(not Cover is null) then ' <img src=BookCover.aspx?ProductId='+cast(e_BookInfo.ProductId as varchar(10))+' Border=1 width=80 height=120>' else ' <img src=img/pic.jpg border=1 width=80 height=120>' end from e_BookInfo join e_BookCategory on e_BookInfo.CategoryId=e_BookCategory.CategoryId where e_BookInfo.ProductId="+BookId;
			//strSql="select ProductId,productName,Author,Translator,Press,ProductPrice,CategoryId,Intro='&nbsp;&nbsp;'+SUBSTRING(Intro,0,100)+'......',image=case when(not Cover is null) then ' <img src=BookCover.aspx?ProductId='+cast(ProductId as varchar(10))+' Border=1 width=70 height=100>' else ' <img src=img/pic.jpg border=1 width=70 height=100>' end from e_BookInfo where CategoryId="+BookTypeId;
			
			myDs= SqlAccess.ExecuteDataset(SqlAccess.CONN_STRING, 
				CommandType.Text, strSql);
			return myDs.Tables[0].Rows[0];
		}

		public static SqlDataReader GetBookByCategory(int BookTypeId )
		{
			string strSql;
			strSql="select ProductId,productName,Author,Translator,Press,ProductPrice,CategoryId,Intro='&nbsp;&nbsp;'+SUBSTRING(Intro,0,500)+'......',image=case when(not Cover is null) then ' <img src=BookCover.aspx?ProductId='+cast(ProductId as varchar(10))+' Border=1 width=70 height=100>' else ' <img src=img/pic.jpg border=1 width=70 height=100>' end from e_BookInfo where CategoryId="+BookTypeId;
			
			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, 
				CommandType.Text, strSql);
		}

		public static SqlDataReader GetNewProductsList()
		{
			string strSql;
			strSql="select top 8 ProductId,productName,Author,Translator,Press,ProductPrice,CategoryId,Intro='&nbsp;&nbsp;'+SUBSTRING(Intro,0,100)+'......',image=case when(not Cover is null) then ' <img src=BookCover.aspx?ProductId='+cast(ProductId as varchar(10))+' Border=1 width=70 height=100>' else ' <img src=img/pic.jpg border=1 width=70 height=100>' end from e_BookInfo order by ProductId DESC";
			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, 
				CommandType.Text, strSql);
		}
		
		/// <summary>
		/// Get Book Cover By BookId
		/// </summary>
		/// <param name="BookId">BookId</param>
		/// <returns></returns>
		/// 
		public static DataView GetBookCover(int BookId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@ProductId", BookId)
								  };
			DataSet myDs= SqlAccess.ExecuteDataset(SqlAccess.CONN_STRING, 
				CommandType.StoredProcedure, "GetBookCover", para);

			return myDs.Tables[0].DefaultView ;
		}
		public static DataSet Search(string strCondition)
		{
			string strSQL =  "Select * From e_BookInfo Where 1=1 " + strCondition + " Order by ProductId";
			return SqlAccess .ExecuteDataset(SqlAccess.CONN_STRING, CommandType.Text,strSQL);
		}

		public static SqlDataReader GetPopularProduct()
		{
			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, 
				CommandType.StoredProcedure, "GetPopularProduct");
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="categoryId"></param>
		/// <param name="pageSize"></param>
		/// <param name="pageIndex"></param>
		/// <returns></returns>
		public static SqlDataReader GetProductsByCategory(int categoryId, int pageSize, int pageIndex)
		{
			SqlParameter[] para = {
									  new SqlParameter("@CategoryId", categoryId),
									  new SqlParameter("@pageSize", pageSize),
									  new SqlParameter("@pageIndex", pageIndex)
								  };
			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, 
				CommandType.StoredProcedure, "GetProductByCategory", para);
		}

		public SqlDataReader GetProductsByCategory(int BookTypeId)
		{
			string strsql;
			SqlDataReader result;
			try
			{
				SqlConnection myCn=new SqlConnection(SqlAccess.CONN_STRING);
				strsql="select ProductId,ProductName,Author,ProductPrice,CategoryId ,Translator,Press,image=case when(not Cover is null) then ' <img src=img/pic.jpg border=1 width=80 height=120>' else ' <img src=img/pic.jpg border=1 width=80 height=120>' end from e_BookInfo where CategoryId="+BookTypeId;
				//strsql="select ProductId,ProductName,Author,ProductPrice,CategoryId ,Translator,Press,image=case when(not Cover is null) then ' <img src=BookCover.aspx?id='+cast(id as varchar(10))+' Border=1 width=80 height=120>' else ' <img src=img/pic.jpg border=1 width=80 height=120>' end from e_BookInfo where CategoryId="+BookTypeId;
				SqlCommand myCm=new SqlCommand(strsql,myCn);
				myCn.Open ();
				result=myCm.ExecuteReader(CommandBehavior.CloseConnection);
				return result;
			}
			catch(System.Data.SqlClient.SqlException er)
			{
				throw new Exception(er.Message);
			}
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="categoryId"></param>
		/// <returns></returns>
		public static int GetProductCountByCategory(int categoryId)
		{
			SqlParameter[] para={
									new SqlParameter("@categoryId", categoryId)
								};
			return Convert.ToInt32(
				SqlAccess.ExecuteScalar(SqlAccess.CONN_STRING,
				CommandType.StoredProcedure, "GetProductCountByCategory", para)
				);
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="keyword"></param>
		/// <param name="pageSize"></param>
		/// <param name="pageIndex"></param>
		/// <returns></returns>
		public static SqlDataReader SearchProducts (string keyword, int pageSize, int pageIndex)
		{
			SqlParameter[] para = {
									  new SqlParameter("@KeyWord", keyword),
									  new SqlParameter("@pageSize", pageSize),
									  new SqlParameter("@pageIndex", pageIndex)
								  };
			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING,
				CommandType.StoredProcedure, "SearchProducts", para);
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="keyword"></param>
		/// <returns></returns>
		public static int GetSearchResultCount(string keyword)
		{
			SqlParameter[] para={
									new SqlParameter("@keyword", keyword)
								};

			return Convert.ToInt32(
				SqlAccess.ExecuteScalar(SqlAccess.CONN_STRING, 
				CommandType.StoredProcedure, "GetSearchResultCount", para)
				);
		}

		public static ProductDetails GetProductInfo(int productId)
		{
			ProductDetails result = new ProductDetails();

			SqlParameter[] para={
									new SqlParameter("@productId", productId)
								};
			using(SqlDataReader dr = SqlAccess.ExecuteReader(
					  SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetProductInfo", para))
			{
				dr.Read();
				//给ProductDetails类的实例Result赋值
				result.productId = productId;
				result.productName = dr["productName"].ToString();
				result.Author=dr["Author"].ToString();
				result.Press=dr["Press"].ToString();
				result.Translator=dr["Translator"].ToString();
				result.productPrice = decimal.Parse(dr["productPrice"].ToString());
				result.intro = dr["Intro"].ToString();
				result.categoryId = int.Parse(dr["categoryId"].ToString());
//				result.clickCount = int.Parse(dr["clickCount"].ToString());
					
				
			}
			return result;
		}

	}
}
