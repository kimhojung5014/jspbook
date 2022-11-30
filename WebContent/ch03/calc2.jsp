<%@page import="jspbook.ch03.CalcBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--calcbean 클래스를 calc라는 이름으로 인스턴스 생성 --%>
<jsp:useBean id ="calc" class="jspbook.ch03.CalcBean"/>

<jsp:setProperty name ="calc" property="*"/>


<% calc.calculate(); %>

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
계산결과:<jsp:getProperty name ="calc" property ="result"/>
</div>
</body>
</html>