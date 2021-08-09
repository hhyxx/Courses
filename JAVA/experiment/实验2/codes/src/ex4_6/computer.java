package ex4_6;

public class computer {
	//不明确给出参数的个数，只给出参数的类型
   public double getResult(double a,int ... x) { 
      double result=0;
      int sum=0;
      for(int i=0;i<x.length;i++) {
         sum=sum+x[i]; 
      }
      result=a*sum;
      return result; 
   }
}


  
