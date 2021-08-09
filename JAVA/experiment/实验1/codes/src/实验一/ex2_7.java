	package 实验一;  
	import java.util.Arrays;  
	public class ex2_7 {  
	    public static void main(String args[]) {  
	        
	        System.out.println("程序输出内容：");  
	        
	        int a[]={12,34,9,23,45,6,45,90,123,19,34};  
	        Arrays.sort(a);  
	        System.out.println(Arrays.toString(a));  
	        int n=45;  
	        //二分查找找到了就返回下标找不到就返回-1
	        int idx=Arrays.binarySearch(a,n);  
	        if(idx>=0)   
	            System.out.println(n+"和数组中索引为"+idx+"元素值相同");  
	        else   
	            System.out.println(n+"不和数组任何元素值相同");  
	    }  
	}  
