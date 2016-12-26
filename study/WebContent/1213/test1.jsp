<%@page import="com.guest.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	request.setAttribute("name", "홍길동");
	request.setAttribute("age", 10);
	GuestDTO dto = new GuestDTO();
	dto.setNum(1);
	dto.setName("자바");
	dto.setContent("안녕");
	request.setAttribute("dto", dto);

%>
<jsp:forward page="test1_ok.jsp"/>