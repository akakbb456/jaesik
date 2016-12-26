<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	session.removeAttribute("id");
	session.removeAttribute("name");
	
	session.invalidate(); // 세션에 저장된 모드 ㄴ정보를 지우고 세션 초기화
	
	response.sendRedirect("main.jsp");
%>