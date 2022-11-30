<%@page import="addrbook.model.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*"%>   

     

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function check(ab_id) {
		pwd = prompt('수정/삭제하려면 비밀번호를 넣으세요');
		document.location.href="/jspbook/add?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
	}
</script>

<meta charset="UTF-8">
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen">
<title>주소록: 목록 화면</title>
</head>
<body>
<div align="center">
	<h2>주소록: 목록 화면</h2>
	<hr>
	<form action="">
		<a href="addrbook_form.jsp">주소록 등록</a><p/>
		
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>생일</th>
				<th>회사</th>
				<th>메모</th>
			</tr>

			<%
				
				
				for(AddrBook ab:(ArrayList<AddrBook>)request.getAttribute("datas")){

			%>
			
			
			<tr>
				<td><a href="javascript:check(<%=ab.getAb_id()%>)"><%=ab.getAb_id()%></a></td>
				
				<td><%=ab.getAb_name() %></td>
				<td><%=ab.getAb_tel() %></td>
				<td><%=ab.getAb_birth() %></td>
				<td><%=ab.getAb_comdept() %></td>
				<td><%=ab.getAb_memo() %></td>
			</tr>
			<%} %>
		</table>
	</form>
</div>
</body>
</html>