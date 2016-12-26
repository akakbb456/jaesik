<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	if(id.equals("test") && pwd.equals("test")) {  // 로그인 시
		// 세션유지시간변경(톰캣기본유지시간 30분)
		session.setMaxInactiveInterval(20*60); // 단위: 초
		
		// 세션에 정보저장
		session.setAttribute("id", id);
		session.setAttribute("name", "홍길동");
		response.sendRedirect("main.jsp");
	} else {
%>
	<jsp:forward page="login.jsp"/>
<%	
	}
%>