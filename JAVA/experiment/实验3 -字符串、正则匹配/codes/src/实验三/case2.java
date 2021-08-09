package 实验三;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class case2 {
	public static void main(String args[]) {
		String str="2020-05-01 08:30:36";
		
		try {
			
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(str);
			SimpleDateFormat m1=new SimpleDateFormat("yyyy年 MM月 dd日 HH 时 mm分 ss秒");
			
			String ans=m1.format(date);
			System.out.println("转化后的日期为：");
			System.out.println(ans);
			Calendar calendar = Calendar.getInstance();  
			calendar.setFirstDayOfWeek(Calendar.MONDAY);  
			calendar.setTime(date);  
			System.out.println("当前是第"+calendar.get(Calendar.WEEK_OF_YEAR)+"周");  
			System.out.println("当前是第"+calendar.get(Calendar.DAY_OF_YEAR)+"天");  
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
	}
}
