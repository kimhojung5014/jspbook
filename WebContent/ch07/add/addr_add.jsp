<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="addr" class="jspbook.ch07.AddrBean"></jsp:useBean>
<jsp:setProperty property="*" name="addr"/>
<jsp:useBean id="am" class="jspbook.ch07.AddrManager" scope="application"></jsp:useBean>
<%
	am.add(addr);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h2>등록내용</h2>
	이름: <jsp:getProperty property="username" name="addr"/>
	전화번호: <%=addr.getTel() %>
	이메일: <%=addr.getEmail() %>
	성별: <%=addr.getSex() %>
	<hr>
	<a href="addr_list.jsp">목록보기</a>
</div>
</body>
</html>