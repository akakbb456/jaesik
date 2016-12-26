<%@page import="com.guest.GuestDAO"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	GuestDAO dao = new GuestDAO();
	String _num=request.getParameter("num");
	
	String pageNum = request.getParameter("page");
	
	dao.deleteGuest(Integer.parseInt(_num));
	
	//response.sendRedirect("list.jsp?page="+pageNum);
	response.sendRedirect("guest.jsp");
%>