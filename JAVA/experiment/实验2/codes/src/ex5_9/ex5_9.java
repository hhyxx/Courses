package ex5_9;

public class ex5_9 {
	   public static void main(String args[]) {
	      people  people=new people(); 
	      anthropoid monkey=people;        
	      
	      monkey.crySpeak("子类重写的方法：I love this game");   
	      
	      System.out.println(monkey.m) ;         
	      System.out.println(people.m) ;        
	      people zhang=(people)monkey;          
	      zhang.computer(55,33);                
	      zhang.m='T';         
	      monkey.m_set(1.11);
	   
	      System.out.println("通过get方法获得monkey属性：" + monkey.m_get()) ;   
	      zhang.p_set('p');
	      System.out.println("通过get方法获得people属性：" + zhang.p_get()) ;   
	      System.out.println(monkey.m) ;   
	      System.out.println(zhang.m) ; 
	    }
	}
