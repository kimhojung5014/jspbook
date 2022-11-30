<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>&lt;c:remove&gt;</h3>
<c:set value="Hello World" var="msg"></c:set>
before remove : ${msg}<br>
<c:remove var="msg"/>
after remove : ${msg}
</body>
</html>