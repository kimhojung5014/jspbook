<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen">
<title>주소록:작성화면</title>
</head>
<body>
<div align="center">
	<h2>주소록:작성화면</h2>
	<hr>
		[<a href="index.jsp">주소록 목록으로]</a><p/>
		<form action="addrbook_control.jsp" method="post" name="form1">		
		<input type="hidden" name="action" value="insert">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="ab_name" maxlength="15"></td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="text" name="ab_email" maxlength="50"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="ab_tel" maxlength="20"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="ab_birth"></td>
			</tr>
			<tr>
				<th>회사</th>
				<td><input type="text" name="ab_comdept" maxlength="20"></td>
			</tr>
			<tr>
				<th>메모</th>
				<td><input type="text" name="ab_memo"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="저장" style="width: 80px">
				<input type="reset" value="취소">
				</td>
			</tr>
			
			<tr>
		</table>
	</form>
</div>
</body>
</html>