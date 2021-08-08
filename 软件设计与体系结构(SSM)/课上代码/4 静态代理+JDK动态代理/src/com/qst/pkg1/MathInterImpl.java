package com.qst.pkg1;

public class MathInterImpl implements MathInter {

	@Override
	public int add(int i, int j) {
		System.out.println(i+" + " + j + " = " + (i+j));
		return i+j;
	}

	@Override
	public int sub(int i, int j) {
		System.out.println(i+" - " + j + " = " + (i-j));
		return i-j;
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
