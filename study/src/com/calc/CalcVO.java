package com.calc;

public class CalcVO { 
	// VO는 ValueObject의 약자로써 일시적으로 데이터를 보관할 목적으로 사용되어 지는것 혹은 DTO
	private int num1, num2;
	private String oper;
	private String name;
	private String content;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}


	
	
	 // shift+alt 누르면서 sra누르면 겟셋가능
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String getOper() {
		return oper;
	}
	public void setOper(String oper) {
		this.oper = oper;
	}
	
	
	public String result() {
		String s = "";
		if(oper==null)
			return s;
		
		if(oper.equals("add"))
			s=Integer.toString(num1+num2);
		else if(oper.equals("sub"))
			s=Integer.toString(num1-num2);
		else if(oper.equals("mul"))
			s=Integer.toString(num1*num2);
		else if(oper.equals("div"))
			s=Integer.toString(num1/num2);
		
		return s;
	}
}




