<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>프로퍼티 연계</h2>
<hr>
<%-- <% --%>

<%-- %> --%>
버전: ${prop.get('version') }<br>
uri: ${prop.get('uri') }<br>
user: ${prop.get('user') }<br>
password: ${prop.get('password') }<br>
</div>
</body>
</html>