<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	ScoreDAO dao = new ScoreDAO();
	String [] haks=request.getParameterValues("chk");
	
	dao.deleteList(haks);
	response.sendRedirect("list.jsp");
%>