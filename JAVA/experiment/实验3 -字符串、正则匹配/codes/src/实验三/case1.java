package 实验三;

import java.util.ArrayList;

public class case1 {
	public static void main(String args[]) {
		String str="3|Four Rooms (1995)|01-Jan-1995||http://us.imdb.com(1995)|0|0|0|0|0|1|0|0";
		
		String regex1="\\|";
		
		
		String result1[]=str.split(regex1); //按照符号 ' | ' 分割字符串
		System.out.println("分隔后的字符串为：");
		
		for(String it :result1) {
			if(it!=null && it.length()!=0)
				System.out.println(it);
		}
		
		String regex2="[^a-zA-Z]"; //非字母符号
		String result2[]=str.split(regex2);
		System.out.println("模板中的单词为：");
		for(String it :result2) {
			if(it!=null && it.length()!=0)
				System.out.println(it);
		}
		
		
		
		String s = "3|Four Rooms (1995)|01-Jan-1995||http://us.imdb.com(1995)|0|0|0|0|0|1|0|0";
		String p = "1995";
		ArrayList<Integer> ans = new ArrayList<Integer>();
		int idx = 0;
		while(idx != -1) {
			idx = str.indexOf(p,idx);
			if(idx == -1) break;
			ans.add(idx);
			idx++;
		}
		
		System.out.println("子串出现的起始下标分别：");
		for(Integer it:ans) {
			System.out.println(it);
		}
	}
}
