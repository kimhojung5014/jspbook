<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String memberId = (String)session.getAttribute("MEMBERID");
	boolean login = memberId == null?false:true;
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 검사 여부</title>
</head>
<body>
<%
	if(login){
%>
아이디 "<%=memberId %>"로 로그인한 상 태		
<%}else{ %>
로그인하지 않은 상태
<%} %>
</body>
</html>