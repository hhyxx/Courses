package ex4_6;

public class ex4_6 {
   public static void main(String args[]) {

      computer computer=new computer();
      double result=computer.getResult(1.0/3,10,20,30); 
      System.out.println("10,20,30 的平均数为:"+result);
      result=computer.getResult(1.0/6,66,12,5,89,2,51); 
      System.out.println("66,12,5,89,2,51 的平均数:"+result);
   }
}
