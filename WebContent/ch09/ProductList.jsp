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
	<form action="ProductSel.jsp" name="form1" method="post">
		<jsp:useBean id="product" class="jspbook.ch09.Produbt" scope="session"></jsp:useBean>
		<select name="sel">
		<%
			for(String item: product.getProductList()){
				out.println("<option>"+item+"</option>");
			}
		%>
		
		</select>
		<input type="submit" value="선택">
	</form>
</div>
</body>
</html>