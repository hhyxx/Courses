package ex5_9;

public class people extends anthropoid {
	   char m='A';
	   int n=60;
	   void p_set(char x) {
		   this.m=x;
	   }
	   char p_get() {
		   return this.m;
	   }
	   void computer(int a,int b) {
	      int c=a+b;
	      System.out.println(a+"加"+b+"等于"+c); 
	   }
	   void crySpeak(String s) {
	      System.out.println(m+"**"+s+"**"+m); 
	   }  
	}
