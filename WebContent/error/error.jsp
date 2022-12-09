<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error.jsp</title>
</head>
<body>
<div align="center">
<h2>error.jsp xml지정</h2>
<hr>
<table>
	<tr width=100% bgcolor="pink">
		<td>관리자 문의해</td>
	</tr>
	<tr>
		<td>${now }<br>
		요청 실패 uri : ${pageContext.errorData.requestURI }<br>
		상태 코드 : ${pageContext.errorData.statusCode }<br>
		예외유형 : ${pageContext.errorData.throwable }
		</td>
	</tr>
</table>
</div>
</body>
</html>