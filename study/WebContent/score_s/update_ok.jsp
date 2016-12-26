<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.score.ScoreDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	String pageNum=request.getParameter("page");
	ScoreDAO dao = new ScoreDAO();
	
	dao.updateScore(dto);
	
	response.sendRedirect("list.jsp?page="+pageNum);
%>