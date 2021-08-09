using System;
using System.Data;
using System.Data.SqlClient;

namespace eBookShop
{
	public class OrderDetails 
	{

		public DateTime  OrderDate;
		public decimal   OrderTotal;
		public DataSet   OrderItems;

	}
	/// <summary>
	/// Orders 的摘要说明。
	/// </summary>
	public class Orders
	{
		public Orders()
		{
		
		}

		public DataSet GetAllOrder()
		{
			
			return SqlAccess .ExecuteDataset(SqlAccess .CONN_STRING, CommandType.StoredProcedure,
				"GetAllOrder");
		}

		public DataSet GetUnDealOrder()
		{
			
			return SqlAccess .ExecuteDataset(SqlAccess .CONN_STRING, CommandType.StoredProcedure,
				"GetUnDealOrder");
		}

		public SqlDataReader GetOrderList(string userId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@userId", userId)
								  };

			return SqlAccess .ExecuteReader(SqlAccess .CONN_STRING, CommandType.StoredProcedure,
				"GetOrdersList", para);
		}

		public OrderDetails GetOrderDetails(int orderId, string userId)
		{
			// Create Instance of Connection and Command Object
			SqlConnection myConnection = new SqlConnection(SqlAccess .CONN_STRING);
			SqlDataAdapter myCommand = new SqlDataAdapter("GetOrdersDetail", myConnection);

			// Mark the Command as a SPROC
			myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

			// Add Parameters to SPROC
			SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
			parameterOrderID.Value = orderId;
			myCommand.SelectCommand.Parameters.Add(parameterOrderID);

			SqlParameter parameterCustomerID = new SqlParameter("@userID", SqlDbType.Int, 4);
			parameterCustomerID.Value = Int32.Parse(userId);
			myCommand.SelectCommand.Parameters.Add(parameterCustomerID);

			SqlParameter parameterOrderDate = new SqlParameter("@OrderDate", SqlDbType.DateTime, 8);
			parameterOrderDate.Direction = ParameterDirection.Output;
			myCommand.SelectCommand.Parameters.Add(parameterOrderDate);

			

			SqlParameter parameterOrderTotal = new SqlParameter("@OrderTotal", SqlDbType.Money, 8);
			parameterOrderTotal.Direction = ParameterDirection.Output;
			myCommand.SelectCommand.Parameters.Add(parameterOrderTotal);

			// Create and Fill the DataSet
			DataSet myDataSet = new DataSet();
			myCommand.Fill(myDataSet, "OrderItems");
            

			// Create and Populate OrderDetails Struct using
			// Output Params from the SPROC, as well as the
			// populated dataset from the SqlDataAdapter

			OrderDetails myOrderDetails = new OrderDetails();

			myOrderDetails.OrderDate= (DateTime)parameterOrderDate.Value;
				
			myOrderDetails.OrderTotal = (decimal)parameterOrderTotal.Value;
			myOrderDetails.OrderItems = myDataSet;

			// Return the DataSet
			return myOrderDetails;
		}

		public OrderDetails GetOrderDetails(int orderId)
		{
			// Create Instance of Connection and Command Object
			SqlConnection myConnection = new SqlConnection(SqlAccess.CONN_STRING);
			SqlDataAdapter myCommand = new SqlDataAdapter("GetOrdersDetailMan", myConnection);

			// Mark the Command as a SPROC
			myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

			// Add Parameters to SPROC
			SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
			parameterOrderID.Value = orderId;
			myCommand.SelectCommand.Parameters.Add(parameterOrderID);

//			SqlParameter parameterCustomerID = new SqlParameter("@userID", SqlDbType.Int, 4);
//			parameterCustomerID.Value = Int32.Parse(userId);
//			myCommand.SelectCommand.Parameters.Add(parameterCustomerID);

			SqlParameter parameterOrderDate = new SqlParameter("@OrderDate", SqlDbType.DateTime, 8);
			parameterOrderDate.Direction = ParameterDirection.Output;
			myCommand.SelectCommand.Parameters.Add(parameterOrderDate);

			

			SqlParameter parameterOrderTotal = new SqlParameter("@OrderTotal", SqlDbType.Money, 8);
			parameterOrderTotal.Direction = ParameterDirection.Output;
			myCommand.SelectCommand.Parameters.Add(parameterOrderTotal);

			// Create and Fill the DataSet
			DataSet myDataSet = new DataSet();
			myCommand.Fill(myDataSet, "OrderItems");
            

			// Create and Populate OrderDetails Struct using
			// Output Params from the SPROC, as well as the
			// populated dataset from the SqlDataAdapter

			OrderDetails myOrderDetails = new OrderDetails();

			myOrderDetails.OrderDate= (DateTime)parameterOrderDate.Value;
				
			myOrderDetails.OrderTotal = (decimal)parameterOrderTotal.Value;
			myOrderDetails.OrderItems = myDataSet;

			// Return the DataSet
			return myOrderDetails;
		}

		public int PlaceOrder(string userId, string cartId)
		{
			object m_DBNull = Convert.DBNull;

			SqlParameter[] para = {
									  new SqlParameter("@userId", userId),
									  new SqlParameter("@cartId", cartId),
									  new SqlParameter("@orderDate", System.DateTime.Now),
									  new SqlParameter("@orderId", SqlDbType.Int, 4, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			try
			{
				SqlAccess .ExecuteNonQuery(SqlAccess .CONN_STRING, CommandType.StoredProcedure, "OrdersAdd",
					para);
			}
			catch
			{
				throw;
			}

			return Convert.ToInt32(para[3].Value);
		}


		public void DealOrder(string orderId)
		{

			SqlParameter[] para = {
									  new SqlParameter("@orderId", orderId),									  
								  };
			try
			{
				SqlAccess .ExecuteNonQuery(SqlAccess .CONN_STRING, CommandType.StoredProcedure, "DealOrder",
					para);
			}
			catch
			{
				throw;
			}

		}


		public int PayOrder(string userId, decimal totalcost)
		{
			object m_DBNull = Convert.DBNull;

			SqlParameter[] para = {
									  new SqlParameter("@userId", userId),
									  new SqlParameter("@totalcost", totalcost),
									  new SqlParameter("@result", SqlDbType.Int, 4, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			try
			{
				SqlAccess .ExecuteNonQuery(SqlAccess .CONN_STRING, CommandType.StoredProcedure, "PayOrder",para);
			}
			catch
			{
				throw;
			}

			return Convert.ToInt32(para[2].Value);
		}
	}
}
