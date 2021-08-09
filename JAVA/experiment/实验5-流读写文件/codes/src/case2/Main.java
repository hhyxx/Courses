//（1）输出C:\Windows\System32\drivers\etc目录下的文件数目；
//（2）统计并输出每个文件拥有文本的行数；
//（3）编写main方法，测试上述代码的功能。


package case2;
import java.io.*;

public class Main {
	public static void main(String args[]) {
		File list[]=new File("/Users/zzz123/Desktop").listFiles();
		int filecnt=0;
		for(File it : list) {
			if(it.isFile()) {
				filecnt++;
				 try{
					   int txtrcnt=0;
			           FileReader out1=new FileReader(it);
			           BufferedReader out2= new BufferedReader(out1);
			           
			           String s=null;
			           while((s=out2.readLine())!=null) {
			             txtrcnt++;
			           }
			           System.out.println(it.getName()+"文本有： "+txtrcnt+"行");
			           out1.close();
			           out2.close();
			         }
			       
			      catch(IOException e) {
			         System.out.println(e);
			      }
			}
		}
		System.out.println("");
		System.out.println("/Users/zzz123/Desktop地址下含有文件数目："+filecnt);
	}
}
