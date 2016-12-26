<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.guest.GuestDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
GuestDAO dao = new GuestDAO();
int result = dao.insertGuest(dto); 

response.sendRedirect("guest.jsp");
%>