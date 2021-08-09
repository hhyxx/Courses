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
			//����userId��ֵ����������ڼ�¼������Ϊ0
			return Convert.ToInt32(SqlAccess.ExecuteScalar(SqlAccess.CONN_STRING, CommandType.StoredProcedure, "SignIn", signInPara));
		}

		public string GetUserRole(int userID)
		{
			SqlParameter[] signInPara = {
											new SqlParameter("@userId", userID),
										};
			//����userId��ֵ����������ڼ�¼������Ϊ0
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
			//����µ��������
			string newPassword = MakePassword(6);
			//����洢���̲��� 
			SqlParameter[] para = {
									  new SqlParameter("@userName", userName),
									  new SqlParameter("@question", question),
									  new SqlParameter("@answer", answer),
									  new SqlParameter("@newPassword", newPassword),

									  new SqlParameter("@result", SqlDbType.Int, 8, ParameterDirection.Output,
									  true, 0, 0, "", DataRowVersion.Default, m_DBNull)
								  };
			
			//ִ�д洢����
			try
			{
				SqlAccess.ExecuteNonQuery(SqlAccess.CONN_STRING, CommandType.StoredProcedure,
					"GetBackPwd", para);
			}
			catch
			{
				throw new Exception("�ʼ��޷����ͣ�");
			}
			//������������ֵ
			int result = Convert.ToInt32(para[4].Value);
			//������뱣��������д��ȷ
			if (result == 1)
			{
				//��Web.config��ȡ�����˵�ַ���ʼ����⡢�ʼ��û����������Լ�SmtpServer

//				string sender = System.Configuration.ConfigurationSettings.AppSettings["mainSender"];
				try
				{

					MailMessage mail = new MailMessage(); 

					mail.To = email;
					mail.From = "bao@163.com" ;
					mail.Subject = "����eBookShop���������һ�";
					mail.BodyFormat = MailFormat.Text ;
					mail.Body = "����eBookShop���������һ�,������Ϊ"+newPassword  ;

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

		
		//�����������
		private static string MakePassword(int pwdLength)
		{
			//����Ҫ���ص��ַ���
			string tmpstr = "";
			//�����а������ַ�����
			string pwdchars="abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			//�������������
			int iRandNum;
			//�����������
			Random rnd = new Random();
			for(int i=0;i<pwdLength;i++)
			{
				//Random���Next��������һ��ָ����Χ�������
				iRandNum = rnd.Next(pwdchars.Length);
				//tmpstr������һ���ַ�
				tmpstr += pwdchars[iRandNum];
			}
			return tmpstr;
		}
		
	}
}
