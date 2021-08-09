package ex5_4;

class A {
    double f(float x,float y) {
       return x + y;
    }
    public int g(int x,int y) {
       return x + y;
    }
}
class B extends A {
    double f(float x,float y) {
       return x * y;
    }  
}
public class ex5_4 {
    public static void main(String args[]) {
      B b = new B();
      double result = b.f(5,6);        
      System.out.println("调用重写方法得到的结果是:"+result);   
      int m = b.g(3,5);        
      System.out.println("调用继承方法得到的结果:"+m);  
    } 
}  
