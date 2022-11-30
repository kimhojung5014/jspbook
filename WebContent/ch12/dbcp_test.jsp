<%@page import="sun.security.mscapi.CKeyPairGenerator.RSA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 테스트</title>
</head>
<body>

<sql:query var="rs" dataSource="jdbc/oracle">
select username, email from jdbc_test
</sql:query>

<h2>결과 출력</h2>
<hr>
<c:forEach var="row" items="${rs.rows}">
	이름: ${row.username}<br>
	이메일: ${row.email}<br>
	<hr>
</c:forEach>
</body>
</html>