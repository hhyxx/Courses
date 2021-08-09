using System;
using System.Data;
using System.Data.SqlClient;

namespace eBookShop
{
	/// <summary>
	/// ShopCart 的摘要说明。
	/// </summary>
	public class ShopCart
	{
		public ShopCart()
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
		}
		public void AddItem(string cartId, int productId, int quantity)
		{

			SqlParameter[] para = {
									  new SqlParameter("@cartId", cartId),
									  new SqlParameter("@productId", productId),
									  new SqlParameter("@quantity", quantity)
								  };
			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, 
				"ShoppingCartAddItem", para);
		}

		public SqlDataReader GetItems(string cartId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@cartId", cartId)
								  };

			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, CommandType.StoredProcedure, 
				"ShoppingCartList", para);
		}

		public void MigrateCart(string originalCartId, string newCartId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@originalCartId", originalCartId),
									  new SqlParameter("@newCartId", newCartId)
								  };
			
			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure,
				"ShoppingCartMigrate", para);
		}


		public void UpdateItem(string cartId, int productId, int quantity)
		{
			if (quantity < 0)
			{
				throw new Exception("Quantity can't be negative");
			}
			
			SqlParameter[] para = {
									  new SqlParameter("@cartId", cartId),
									  new SqlParameter("@productId", productId),
									  new SqlParameter("@quantity", quantity)
								  };

			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, 
				"ShoppingCartUpdate", para);
		}

		public void RemoveItem( string cartId, int productId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@cartId", cartId),
									  new SqlParameter("@productId", productId)
								  };
			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, 
				"ShoppingCartRemoveItem", para);
		}

		public int GetItemCount(string cartId)
		{
			object m_DBNull = Convert.DBNull;
			SqlParameter[] para = {
									  new SqlParameter("@cartId", cartId),
									  new SqlParameter("@ItemCount", SqlDbType.Int, 4, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, 
					"ShoppingCartItemCount", para);
			}
			catch
			{
				throw;
			}

			return Convert.ToInt32(para[1].Value);
		}

		public decimal GetTotal(string cartId)
		{
			//输出参数初始化
			object m_DBNull = Convert.DBNull;

			SqlParameter[] para = {
									  new SqlParameter("@cartId", cartId),
									  new SqlParameter("@TotalCost", SqlDbType.Money, 8, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure,
					"ShoppingCartTotal", para);
			}
			catch
			{
				throw;
			}

			return Convert.ToDecimal(para[1].Value);
		}

		public void EmptyCart(string cartId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@cartId", cartId)
								  };

			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, 
				"ShoppingCartEmpty", para);
		}

		public String GetShoppingCartId() 
		{

			// 获得HTTP请求的HttpContext实例
			System.Web.HttpContext context = System.Web.HttpContext.Current;
			

			// 如果用户已通过验证，则返回其用户编号作为CartId
			if (context.User.Identity.Name != "") 
			{
				return context.User.Identity.Name;
			}

			// 如果请求用户为匿名，则创建临时的CartId
			if (context.Request.Cookies["eshop_CartID"] != null) 
			{
				return context.Request.Cookies["eshop_CartID"].Value;
			}
			else 
			{
				// 生成GUID
				Guid tempCartId = Guid.NewGuid();

				// 将GUID保存到Cookie
				context.Response.Cookies["eshop_CartID"].Value = tempCartId.ToString();

				// 返回临时CartId
				return tempCartId.ToString();
			}

		}
	}
}
