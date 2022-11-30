package jspbook.ch03;

public class CalcBean {
	private int num1,num2;
	private String operator ="";
	private int result;
	
	public void calculate() {
		if(operator.equals("+")) {
			result = num1 + num2;
		}
		else if(operator.equals("-")) {
			result = num1 - num2;
		}
		else if(operator.equals("*")) {
			result = num1 * num2;
		}
		else if(operator.equals("/")) {
			result = num1 / num2;
		}
		
	}


	public void setNum1(String num1) {
		this.num1 = Integer.parseInt(num1);
	}

	public void setNum2(String num2) {
		this.num2 = Integer.parseInt(num2);
	}

	public void setOperator(String operator) {
		System.out.println("##" + operator);
		this.operator = operator;
	}
	
	public int getResult() {
		return result;
	}
	

}
