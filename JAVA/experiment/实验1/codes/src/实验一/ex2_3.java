	package 实验一;  
	import java.util.Scanner;  
	public class ex2_3 {  
	    public static void main(String args[]) {  
	        
	        System.out.println("程序输出内容：");  
	        System.out.println("输入若干数，每输入一个回车确认");  
	        System.out.println("最后输入0结束输入");  
	        Scanner in = new Scanner(System.in);  
	        double sum=0;  
	        int m=0;  
	        double x = in.nextDouble();  
	        while(x!=0) {  
	            m++;  
	            sum+=x;  
	            x=in.nextDouble();  
	        }  
	        System.out.println(m+"个数和为"+sum);  
	        System.out.println(m+"个数的平均值为"+sum/m);  
	        in.close();  
	    }  
	}  
