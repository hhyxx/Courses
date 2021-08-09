
//（1）把字符串“C”、“C++”、“Java”分三行写入文本文件A.txt；
//（2）从A.txt中读出字符串，分行输出；
//（3）编写main方法，测试上述代码的功能。


package case1;
import java.io.*;
public class Main{
   public static void main(String args[]) {
      File file=new File("A.txt");
      String content[]={"C","C++","JAVA"};
       try{
           FileWriter in1=new FileWriter(file);
           BufferedWriter in2= new BufferedWriter(in1);
           for(String item : content) {
               in2.write(item);
               in2.newLine();
           }
           in2.close();
           in1.close();
           FileReader out1=new FileReader(file);
           BufferedReader out2= new BufferedReader(out1);
           
           String s=null;
           while((s=out2.readLine())!=null) {
             System.out.println(s);
           }
           
           out1.close();
           out2.close();
         }
       
      catch(IOException e) {
         System.out.println(e);
      }
       
   }
}
