<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="sun.security.mscapi.CKeyPairGenerator.RSA"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8"); %>
<%
Connection conn = null;
PreparedStatement pstmt = null;

try{
	Context initContext = new InitialContext();
	Context envContext =
			(Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/oracle");
	conn = ds.getConnection();
	
	if(request.getParameter("username") != null){
		String sql = "insert into jdbc_test values(?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,request.getParameter("username"));
		pstmt.setString(2,request.getParameter("email"));
		pstmt.executeUpdate();
	}
}catch(Exception e){
	System.out.println(e);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 테스트</title>
</head>
<body>
	<div align="center">
		<form action="">
		등록이름 : <input type="text" name="username">
		주소 : <input type="text" name="email" size="20">
		<input type="submit" value="등록">
		</form>
	</div>
	#등록목록<br>
	<%
	try{
		String sql = "select * from jdbc_test";
		
		pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		int i = 1;
		
		while(rs.next()){
			out.println(i+" : "+rs.getString(1)+" , "+rs.getString("email")+"<br>");
			i++;
		}
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e);
	}

	%>
</body>
</html>