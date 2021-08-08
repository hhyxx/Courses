package com.junit;
import org.junit.Assert;
import org.junit.*;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.*;
import java.util.*;
import com.hyx.Register;
import com.hyx.Register.Result;


class test {
	
	@BeforeClass // 最早
	public static void bfClass() {}
	@AfterClass // 最后
	public static void afClass() {}
	@Before // 每个测试方法执行前执行
	public void bf() {}
	@After // 每个测试方法执行后执行
	public void Af() {}
	
	
//	OK, UnameErr, PwdErr, PwdDiff
	
	@Test
	void test1() {
		String uname = "a";
		String pwd = "abc123";
		String repwd = "abc123";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.UnameErr, a);
	}
	
	@Test
	void test2() {
		String uname = "aaaaaaaaaaaaaaaaaaaaa";
		String pwd = "abc123";
		String repwd = "abc123";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.UnameErr, a);
	}
	
	@Test
	void test3() {
		String uname = "!!!!!!";
		String pwd = "abc123";
		String repwd = "abc123";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.UnameErr, a);
	}
	
	@Test
	void test4() {
		String uname = "hyx201811050392";
		String pwd = "abc123";
		String repwd = "abc123";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.OK, a);
	}
	
	
	
	@Test
	void test5() {
		String uname = "hyx201811050392";
		String pwd = "a";
		String repwd = "a";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.PwdErr, a);
	}
	
	@Test
	void test6() {
		String uname = "hyx201811050392";
		String pwd = "aaaaaaaaaaaaaaaa";
		String repwd = "aaaaaaaaaaaaaaaa";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.PwdErr, a);
	}
	@Test
	void test7() {
		String uname = "hyx201811050392";
		String pwd = "!!!!!!";
		String repwd = "!!!!!!";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.PwdErr, a);
	}
	@Test
	void test8() {
		String uname = "hyx201811050392";
		String pwd = "abc123";
		String repwd = "abc123";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.OK, a);
	}
	
	@Test
	void test9() {
		String uname = "hyx201811050392";
		String pwd = "abc123";
		String repwd = "123456";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.PwdDiff, a);
	}
	@Test
	void testX() {
		String uname = "hyx201811050392";
		String pwd = "abc123";
		String repwd = "abc123";
		Result a = Register.checkInput(uname, pwd, repwd);
		Assert.assertEquals(Result.OK, a);
	}
}
