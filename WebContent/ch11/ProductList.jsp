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
<div align="center">
	<form action="ProductSel.jsp" name="form1" method="post">
		<jsp:useBean id="prodct" class="jspbook.ch09.Produbt" scope="session"></jsp:useBean>
		<select name="sel">

			<c:forEach items="${product.productList}" var ="item">
			<option>${item}</option>
			</c:forEach>
		
		
		</select>
		<input type="submit" value="선택">
	</form>
</div>
</body>
</html>