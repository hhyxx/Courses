package ex5_3;

class People {
    public double x;
    
    public void setX(double x) {
       this.x=x;
    }
    public double getDoubleX() {
       return x;
    }
}
class Student extends People {
    int x;
    
    public int getX() {
       return x;
    }
}
public class ex5_3 {
  public static void main(String args[]) {

      Student stu=new Student();
     
      stu.x=98; 
      
      System.out.println("对象stu的x值是:"+stu.getX());
      stu.setX(98.98); 
      double m=stu.getDoubleX();
      System.out.println("对象stu隐藏的值x是:"+m);
  }  
}

