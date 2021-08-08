package com.qst.pkg1;

public class StaticMathProxy implements MathInter {
	
	MathInter mathInter;
	TimeTool timeTool;
	
	public StaticMathProxy(MathInter mi, TimeTool tt) {
		this.mathInter = mi;
		this.timeTool = tt;				
	}

	@Override
	public int add(int i, int j) {
		timeTool.before();
		int r = mathInter.add(i, j);
		timeTool.after();
		return r;
	}

	@Override
	public int sub(int i, int j) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int multi(int i, int j) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int div(int i, int j) {
		// TODO Auto-generated method stub
		return 0;
	}

}
