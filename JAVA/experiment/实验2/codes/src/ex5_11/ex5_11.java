package ex5_11;

abstract class A {
	   abstract int sum(int x,int y);
	   int sub(int x,int y) { 
	      return x-y;
	   }
	}
	class B extends A {
	   int sum(int x,int y) {   
	      return x+y;
	   }
	}
	public class ex5_11 {
	   public static void main(String args[]) {
	      B b=new B();
	      int sum=b.sum(30,20);           
	      int sub=b.sub(30,20);           
	      System.out.println("sum="+sum);
	      System.out.println("sum="+sub); 
	   }
	}
