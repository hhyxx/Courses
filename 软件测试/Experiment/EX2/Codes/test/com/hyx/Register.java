package com.hyx;

import java.util.*;
import java.util.regex.Pattern;

public class Register {
	public enum Result {
		OK, UnameErr, PwdErr, PwdDiff
	}
	
	public static boolean checkUnameType(String str) { // 用户名是数字和字母组成
		boolean isLogin = true;
		for (int i = 0; i < str.length(); i++) { // 循环遍历字符串
			if (!Character.isDigit(str.charAt(i))) { // 不是数字				
				if (!Character.isLetter(str.charAt(i))) {  
					isLogin = false;
					break;
				}
			}
		}
		return isLogin;
	}

	public static boolean checkPwdType(String str) {  // 正则表达式判断字符串是否为纯数字 
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(str).matches();
	}



	public static Result checkInput(String uname, String pwd, String repwd) {
		if (uname.length() >= 3 && uname.length() <= 20 && checkUnameType(uname)) {
			if (pwd.length() >= 5 && pwd.length() <= 15 && checkPwdType(uname)) {
				if (pwd.equals(repwd)) {
					System.out.println("注册成功！");
					return Result.OK;
				} else {
					System.out.println("两次密码输入不一致！");
					return Result.PwdDiff;
				}
			} else {
				System.out.println("密码格式不正确，请输入5~15位数字或字母！");
				return Result.PwdErr;
			}
		} else {
			System.out.println(uname.length());
			System.out.println("用户名格式不正确，请输入3~20位数字或字母！");
			System.out.println();
			return Result.UnameErr;
		}
	}
	
	
	public void getInput() {
		Scanner sc = new Scanner(System.in);
		System.out.println("欢迎注册！");
		boolean i = true;
		while (i) {
			System.out.println("请输入用户名：");
			String uname = sc.next();
			
			System.out.println("请输出密码：");
			String pwd = sc.next();	
			
			System.out.println("请再次输入密码：");
			String repwd = sc.next();
			
			
			Result a = checkInput(uname, pwd, repwd);
			if (a == Result.OK) {
				break;
			}
		}
	}
	public static void main(String arg[]) {
		Register user = new Register();
		user.getInput();
	}
}
