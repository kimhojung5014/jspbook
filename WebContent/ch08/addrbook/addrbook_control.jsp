<%@page import="addrbook.model.AddrBook"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javafx.scene.web.WebHistory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="addrbook.controller.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ab" scope="page" class="addrbook.model.AddrBean"></jsp:useBean>
<jsp:useBean id="addrbook" scope="page" class="addrbook.model.AddrBook"></jsp:useBean>
<jsp:setProperty name="addrbook" property="*"/>
<%
	String action = request.getParameter("action");
	if(action.equals("list")){
		ArrayList<AddrBook>datas = ab.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("addrbook_list.jsp");
	}else if(action.equals("insert")){
		if(ab.insertDB(addrbook)){
			response.sendRedirect("index.jsp");
		}else{
			throw new Exception("DB 입력 오류");
		}
	}else if(action.equals("edit")){
		AddrBook abook = ab.getDb(addrbook.getAb_id());
		if(!request.getParameter("upasswd").equals("1")){
			out.println("<script>alert('비밀번호가틀렸습니다.!');history.go(-1);</script>");
		}else{
			request.setAttribute("ab", abook);
			pageContext.forward("addrbook_edit_form.jsp");
		}
	}else if(action.equals("update")){
		if(ab.updateDB(addrbook)){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}else{
			throw new Exception("DB 갱신 오류");
		}
	}else if(action.equals("delete")){
		if(ab.deleteDB(addrbook.getAb_id())){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}else{
			throw new Exception("DB 삭제 오류");
		}
	}else{
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>