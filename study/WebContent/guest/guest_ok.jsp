<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="com.guest.GuestDAO"%>
<%
    request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="com.guest.GuestDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	GuestDAO dao=new GuestDAO();
	dao.insertGuest(dto);
	
	response.sendRedirect("guest.jsp");
%>
