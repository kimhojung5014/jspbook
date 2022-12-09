<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404error page</title>
</head>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<body>
<div align="center">
<h2>404error page 지정</h2>
<hr>
<table>
	<tr width=100% bgcolor="pink">
		<td>요청하신 파일 없음</td>
	</tr>
	<tr>
		<td>${now }<br>
		요청 실패 uri : ${pageContext.errorData.requestURI }<br>
		상태 코드 : ${pageContext.errorData.statusCode }<br>
		</td>
	</tr>
</table>
</div>
</body>
</html>