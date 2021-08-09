package 实验六;

import java.util.*;
public class case2 {
   public static void main(String args[]){
	   
      ArrayList<String> a=new ArrayList<String>();
      LinkedList<String> b=new LinkedList<String>();
      
      a.add("JAVA");
      a.add("真");
      a.add("有趣");
      a.add("!");
      for(int i=0;i<=5000;i++)
    	  a.add("c");
      b.add("JAVA");
      b.add("真");
      b.add("有趣");
      b.add("!");
      for(int i=0;i<=5000;i++)
    	  b.add("c");
      
      Iterator<String> iter=a.iterator();
      
      long starttime=System.currentTimeMillis();
      while(iter.hasNext()){
           String te=iter.next();
      }
      
      long endTime=System.currentTimeMillis();
      long result=endTime-starttime;
      
      System.out.println("ArrayList 迭代器遍历时间:"+result+"ms");
      
      starttime=System.currentTimeMillis();
      
      for(int i=0;i<a.size();i++){
          String te=a.get(i);
      }
      endTime=System.currentTimeMillis();
      result=endTime-starttime;
      
      System.out.println("ArrayList get方法遍历的时间为:"+result+"ms");
      
      
      Iterator<String> item=b.iterator();
      starttime=System.currentTimeMillis();
      while(iter.hasNext()){
           String te=item.next();
      }
      
      endTime=System.currentTimeMillis();
      result=endTime-starttime;
      
      System.out.println("LinkedList 迭代器遍历时间:"+result+"ms");
      
      starttime=System.currentTimeMillis();
      
      for(int i=0;i<b.size();i++){
          String te=b.get(i);
      }
      endTime=System.currentTimeMillis();
      result=endTime-starttime;
      
      System.out.println("LinkedList get方法遍历的时间为:"+result+"ms");
    }
}
