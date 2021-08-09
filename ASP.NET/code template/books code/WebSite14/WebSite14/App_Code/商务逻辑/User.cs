using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mail;

namespace eBookShop
{

	public class UserInfoCl
	{
		public string username;
		public string userRealName;
		public string question;
		public string answer;
		public string email;

		
	}

	public class User
	{
		public User()
		{

		}


		public int Login(string userName, string userPwd)
		{
			SqlParameter[] signInPara = {
											new SqlParameter("@userName", userName),
											new SqlParameter("@userPwd", userPwd)
										};
			//返回userId的值，如果不存在记录，返回为0
			return Convert.ToInt32(SqlAccess.ExecuteScalar(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "SignIn", signInPara));
		}

		public string GetUserRole(int userID)
		{
			SqlParameter[] signInPara = {
											new SqlParameter("@userId", userID),
										};
			//返回userId的值，如果不存在记录，返回为0
			return Convert.ToString (SqlAccess.ExecuteScalar(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetUserRole", signInPara));
		}

		public int ChangePassword (string oldPassword, string newPassword, int userId)
		{
			object m_DBNull = Convert.DBNull;

			SqlParameter[] para = {
									  new SqlParameter("@userId", userId),
									  new SqlParameter("@oldPassword", oldPassword),
									  new SqlParameter("@newPassword", newPassword),
									  new SqlParameter("@result", SqlDbType.Int, 8, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			try
			{
				SqlAccess .ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "ChangePassword", para);
			}
			catch
			{
				throw;
			}

			return Convert.ToInt32(para[3].Value);
		}

		public int GetBackPassword(string userName, string question, string answer, string email)
		{
			object m_DBNull = Convert.DBNull;
			//获得新的随机密码
			string newPassword = MakePassword(6);
			//定义存储过程参数 
			SqlParameter[] para = {
									  new SqlParameter("@userName", userName),
									  new SqlParameter("@question", question),
									  new SqlParameter("@answer", answer),
									  new SqlParameter("@newPassword", newPassword),

									  new SqlParameter("@result", SqlDbType.Int, 8, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			
			//执行存储过程
			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure,
					"GetBackPwd", para);
			}
			catch
			{
				throw new Exception("邮件无法发送！");
			}
			//获得输出参数的值
			int result = Convert.ToInt32(para[4].Value);
			//如果密码保护资料填写正确
			if (result == 1)
			{
				//从Web.config获取发信人地址、邮件标题、邮件用户名和密码以及SmtpServer

//				string sender = System.Configuration.ConfigurationSettings.AppSettings["mainSender"];
				try
				{

					MailMessage mail = new MailMessage(); 

					mail.To = email;
					mail.From = "bao@163.com" ;
					mail.Subject = "您在eBookShop的密码已找回";
					mail.BodyFormat = MailFormat.Text ;
					mail.Body = "您在eBookShop的密码已找回,新密码为"+newPassword  ;

					SmtpMail.Send(mail) ;

				}
				catch(Exception ex)
				{
					throw new Exception(ex.Message);
				}
			}

			return result;
		}

		public int AddNewUser(string userName, string password, string question, string answer,string userrealname,string email,string role)
		{
			object m_DBNull = Convert.DBNull;

			SqlParameter[] para = {
									  new SqlParameter("@userName", userName),
									  new SqlParameter("@Password", password),
									  new SqlParameter("@question", question),
									  new SqlParameter("@answer", answer),

									  new SqlParameter("@userrealname", userrealname),
									  new SqlParameter("@email", email),
									  new SqlParameter("@role", role),
									  new SqlParameter("@result", SqlDbType.Int, 8, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };

			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure,
					"AddNewUser", para);
			}
			catch
			{
				throw;
			}

			return Convert.ToInt32(para[7].Value);
		}


		public UserInfoCl GetUserInfo(string userId)
		{
			SqlParameter[] para = {
									  new SqlParameter("@userId", int.Parse(userId))
								  };
			
			SqlDataReader dr =SqlAccess.ExecuteReader(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "GetUserInfo", para);

			dr.Read();

			UserInfoCl userInfo = new UserInfoCl();
			userInfo.username = dr["UserName"].ToString();
			userInfo.userRealName = dr["UserRealName"].ToString();
			userInfo.question  = dr["Question"].ToString();
			userInfo.answer  = dr["Answer"].ToString();
			userInfo.email = dr["email"].ToString();


			return userInfo;
		}
			

		public int ChangeProfile(string userId, string userRealName, string question, string answer, string email)
		{

			SqlParameter[] para = {
									  new SqlParameter("@userId", int.Parse(userId)),
									  new SqlParameter("@userRealName", userRealName),
									  new SqlParameter("@question", question),
									  new SqlParameter("@answer", answer),
									  new SqlParameter("@email", email)
								  };

			return SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure, 
				"EditUserInfo", para);
		}

		
		//随机生成密码
		private static string MakePassword(int pwdLength)
		{
			//声明要返回的字符串
			string tmpstr = "";
			//密码中包含的字符数组
			string pwdchars="abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			//数组索引随机数
			int iRandNum;
			//随机数生成器
			Random rnd = new Random();
			for(int i=0;i<pwdLength;i++)
			{
				//Random类的Next方法生成一个指定范围的随机数
				iRandNum = rnd.Next(pwdchars.Length);
				//tmpstr随机添加一个字符
				tmpstr += pwdchars[iRandNum];
			}
			return tmpstr;
		}
		
	}
}
