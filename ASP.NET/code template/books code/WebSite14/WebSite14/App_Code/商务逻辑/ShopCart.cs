using System;
using System.Data;
using System.Data.SqlClient;

namespace eBookShop
{
	/// <summary>
	/// ShopCart ��ժҪ˵����
	/// </summary>
	public class ShopCart
	{
		public ShopCart()
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
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
			//���������ʼ��
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

			// ���HTTP�����HttpContextʵ��
			System.Web.HttpContext context = System.Web.HttpContext.Current;
			

			// ����û���ͨ����֤���򷵻����û������ΪCartId
			if (context.User.Identity.Name != "") 
			{
				return context.User.Identity.Name;
			}

			// ��������û�Ϊ�������򴴽���ʱ��CartId
			if (context.Request.Cookies["eshop_CartID"] != null) 
			{
				return context.Request.Cookies["eshop_CartID"].Value;
			}
			else 
			{
				// ����GUID
				Guid tempCartId = Guid.NewGuid();

				// ��GUID���浽Cookie
				context.Response.Cookies["eshop_CartID"].Value = tempCartId.ToString();

				// ������ʱCartId
				return tempCartId.ToString();
			}

		}
	}
}
