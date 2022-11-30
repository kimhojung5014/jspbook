package addrbook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import addrbook.model.AddrBean;
import addrbook.model.AddrBook;

/**
 * Servlet implementation class addrbook_control_servlet
 */
@WebServlet("/add")
public class addrbook_control_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AddrBean ab ;
	AddrBook addrbook ;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public addrbook_control_servlet() {
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		actionDo(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 ab = new AddrBean();
		 
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html; charset=UTF-8");
		 String action = request.getParameter("action");
		
		
		PrintWriter out = response.getWriter();
		// 쌤 코드
		
		/*
		 * String uri = request.getRequestURI(); //웹브라우저가 요청한 URL에서 경로를 구한다. String
		 * String conPath = request.getContentType(); // 클라이언트가 요청 정보를 전송할 때 사용한 컨텐츠 타입을
		 * 구한다. String command = uri.substring(conPath.length());

		 */
		//
		if (action.equals("insert")) {
			addrbook = new AddrBook();
			addrbook.setAb_name(request.getParameter("ab_name"));
			addrbook.setAb_email(request.getParameter("ab_email"));
			addrbook.setAb_tel(request.getParameter("ab_tel"));
			addrbook.setAb_birth(request.getParameter("ab_birth"));
			addrbook.setAb_comdept(request.getParameter("ab_comdept"));
			addrbook.setAb_memo(request.getParameter("ab_memo"));			
			
			if (ab.insertDB(addrbook)) {
				System.out.println("저장완료");
				response.sendRedirect("ch08/addrbookServlet/index.jsp");
			} else {
				System.out.println("저장실패");
			}
			

		} else if (action.equals("list")) {
			request.setAttribute("datas", ab.getDBList());
			RequestDispatcher dispatcher = request.getRequestDispatcher("ch08/addrbookServlet/addrbook_list.jsp");
			dispatcher.forward(request, response);
		} else if(action.equals("edit")){
			
			if(!request.getParameter("upasswd").equals("1")){
				out.println("<html><head><title>오류</title>");
				out.println("<script>alert('비밀번호가틀렸습니다.!');history.go(-1);</script>");
				out.println("</head><body></body><html>");
			}else{
				AddrBook abook = ab.getDb(Integer.parseInt(request.getParameter("ab_id")));
				
				request.setAttribute("ab", abook);
				RequestDispatcher dispatcher = request.getRequestDispatcher("ch08/addrbookServlet/addrbook_edit_form.jsp");
				dispatcher.forward(request, response);
			}
		} else if(action.equals("update")){
			addrbook = new AddrBook();
			addrbook.setAb_name(request.getParameter("ab_name"));
			addrbook.setAb_email(request.getParameter("ab_email"));
			addrbook.setAb_tel(request.getParameter("ab_tel"));
			addrbook.setAb_birth(request.getParameter("ab_birth"));
			addrbook.setAb_comdept(request.getParameter("ab_comdept"));
			addrbook.setAb_memo(request.getParameter("ab_memo"));		
			addrbook.setAb_id(Integer.parseInt(request.getParameter("ab_id")));
			
			if(ab.updateDB(addrbook)){
				/*
				 * request.setAttribute("ab", addrbook); RequestDispatcher dispatcher =
				 * request.getRequestDispatcher("/jspbook/add?action=list");
				 * dispatcher.forward(request, response);
				 */
				response.sendRedirect("ch08/addrbookServlet/index.jsp?");
				System.out.println("변경완료");
			}else{
				System.out.println("DB업데이트 오류");
			}
		}else if(action.equals("delete")){
				
			if(ab.deleteDB(Integer.parseInt(request.getParameter("ab_id")))){
				response.sendRedirect("ch08/addrbookServlet/index.jsp");
				System.out.println("삭제완료");
			}else{
				System.out.println("삭제오류");
			}
		}else{
			
		}
	}
}
