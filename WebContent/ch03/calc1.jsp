<%@page import="jspbook.ch03.CalcBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
		int result = 0;

		if(request.getMethod().equals("POST")){
	
		String operator = request.getParameter("operator"); 	
		
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
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
%>	
	
<html>
<head>
<title>계산기</title>
</head>

<body>
<div align=center>
<H3>ch03:계산기</H3>

<HR>
<form name = form1 method=post>
<INPUT type ="text" NAME ="num1" width =200 size ="5">
<select NAME = "operator">
  <option selected>+</option>
  <option>-</option>
  <option>*</option>
  <option>/</option>
</select>

<input TYPE ="text" NAME ="num2" width =200 size ="5">
<input type ="submit" value ="계산" name ="B1"><input type ="reset" value ="다시입력" name ="B2">  
</form>
<HR>
<h3>계산결과: <%= result %></h3>
</div>
</body>
</html>