package com.qst.pkg1;

public class Test {

	public static void main(String[] args) {

		MathInter mi = new MathInterImpl();
//		mi.add(1, 2);
		
		TimeTool tt = new TimeTool();
		
		StaticMathProxy proxy = new StaticMathProxy(mi,tt);
		proxy.add(1, 2);	

	}

}
