<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String username = request.getParameter("username");

if(username != null){
	session.setAttribute("user", username);
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Twitter</title>
</head>
<body>
<div align="center">
	<h3>My Simple Twtter!</h3>
	<hr>
	<form action="tweet.jsp" method="post">
		@<%=session.getAttribute("user") %><input type="text" name="msg">
		<input type="submit" value="Tweet">
	</form>
	<hr>
	<div align="left">
	<ul>
	<%
		ArrayList<String>msgs = (ArrayList<String>)application.getAttribute("msgs");
		if(msgs != null){
			for(String msg:msgs){
				out.println("<li>"+msg+"</li>");
			}
		}
	%>
	</ul>
	</div>
</div>
</body>
</html>