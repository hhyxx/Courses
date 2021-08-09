using System;
using System.Data;
using System.Data.SqlClient;

namespace eBookShop
{
	/// <summary>
	/// AdminDB 的摘要说明。
	/// </summary>
	public class AdminDB
	{
		public AdminDB()
		{
		}

		public int Login(string loginName, string password)
		{
			
			SqlParameter[] para = {
									  new SqlParameter("@loginName", loginName),
									  new SqlParameter("@loginpassword", password)
								  };
			return Convert.ToInt32(SqlAccess.ExecuteScalar(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "AdminLogin",
				para));
		}

		public string GetAdminRole(string adminId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@adminId", int.Parse(adminId))
								  };
			return SqlAccess.ExecuteScalar(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetAdminRole",
				para).ToString();
		}


		public int AddNewAdmin(string loginName, string loginPwd, int roleId)
		{
			
			object m_DBNull = Convert.DBNull;
			SqlParameter[] para = {
									  new SqlParameter("@loginName", loginName),
									  new SqlParameter("@password", loginPwd),
									  new SqlParameter("@roleId", roleId),
									  new SqlParameter("@result", SqlDbType.Int, 4, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "addNewAdmin",
					para);
			}
			catch
			{
				throw;
			}

			return Convert.ToInt32(para[3].Value);
		}


		public void DeleteAdmin(string adminId)
		{

			SqlParameter[] para = {
									  new SqlParameter("@adminId", int.Parse(adminId))
								  };

			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "DeleteAdmin",
					para);
			}
			catch
			{
				throw;
			}
		}


		public SqlDataReader GetAdminList(int roleId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@roleId", roleId)
								  };

			
			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetAdminList",
				para);
		}


		public static SqlDataReader GetAdminRoleList()
		{
			return SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetAdminRoles");
		}


		public int ChangePwd(string adminId, string oldPwd, string newPwd)
		{

			object m_DBNull = Convert.DBNull;
			SqlParameter[] para = {
									  new SqlParameter("@adminId", adminId),
									  new SqlParameter("@oldPassword", oldPwd),
									  new SqlParameter("@newpassword", newPwd),
									  new SqlParameter("@result", SqlDbType.Int, 4, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "ChangeAdminPassword",
					para);
			}
			catch
			{
				throw;
			}

			return Convert.ToInt32(para[3].Value);
		}


		public DataSet GetUserList()
		{
			
			return SqlAccess.ExecuteDataset(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetUserList");
		}


		public void  UpdateUserRole(string Role, string userId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@userID", int.Parse(userId)),
									  new SqlParameter("@Role", Role)
								  };
			
			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "UpdateUserRole",
					para);
			}
			catch
			{
				throw;
			}
		}


		public  DataSet GetSails(string year, string month, string day)
		{
			

			SqlParameter[] para = {
									  new SqlParameter("@year", int.Parse(year)),
									  new SqlParameter("@month", int.Parse(month)),
									  new SqlParameter("@day", int.Parse(day))
								  };

			return SqlAccess.ExecuteDataset(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetSails", para);

		}


		public DataSet GetAction(string adminId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@adminId", int.Parse(adminId))
								  };
			return SqlAccess.ExecuteDataset(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetAction", para);
		}


		public static void InsertAction(string action, DateTime actionDate, string adminId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@action", action),
									  new SqlParameter("@actiondate", actionDate),
									  new SqlParameter("@adminId", int.Parse(adminId))
								  };

			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "InsertAction", para);

		}

		
		public DataSet GetAllProduct()
		{

			return SqlAccess.ExecuteDataset(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetAllProduct");
		}

		public void AddNewProduct(string productName,string Author,string Translator,string Press, decimal price, string intro, int categoryId,byte [] cover)
		{
			SqlParameter[] para = {
									  new SqlParameter("@productName", productName),
									  new SqlParameter("@author", Author),
									  new SqlParameter("@translator", Translator),
									  new SqlParameter("@press", Press),
									  new SqlParameter("@productPrice", price),
									  new SqlParameter("@intro", intro),
									  new SqlParameter("@categoryId", categoryId),
									  new SqlParameter("@cover", cover)
								  };

			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "AddNewProduct", para);
		}


		public void AlterProduct(int productId, string productName, decimal price, string intro,string author,string translator,string press)
		{
			SqlParameter[] para = {
									  new SqlParameter("@productId", productId),
									  new SqlParameter("@productName", productName),
									  new SqlParameter("@productPrice", price),
									  new SqlParameter("@intro", intro),
									  new SqlParameter("@author", author),
									  new SqlParameter("@translator", translator),
									  new SqlParameter("@press", press)
								  };

			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "AlterProductInfo", para);
		}


		public void DeleteProduct(int productId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@productId", productId)
								  };
			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "DeleteProduct", para);
		}


		public void AddNewCategory(string categoryName)
		{
			SqlParameter[] para = {
									  new SqlParameter("@categoryName", categoryName)
								  };
			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "AddNewCategory", para);
		}


		public void DeleteCategory(int categoryId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@categoryId", categoryId)
								  };
			SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "DeleteCategory", para);
		}
		
			
	}
}
