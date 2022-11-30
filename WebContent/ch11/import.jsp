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
<h3>c:import</h3>
다음은 import를 이용해 포함한것
<c:import url="set.jsp" var="myurl"></c:import>
<c:out value="${myurl}" escapeXml="false"></c:out>
<!-- <hr> -->
<c:import url="out.jsp" var="myurl2"></c:import>
<c:out value="${myurl2}" escapeXml="false"></c:out>

</body>
</html>