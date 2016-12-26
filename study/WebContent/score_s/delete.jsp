<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	String [] chkList = request.getParameterValues("chk"); 
	// chkList라는 String형 배열로 chk의 벨류값들을 받아온다(학번값들)

	
	ScoreDAO dao = new ScoreDAO();
	String hak=request.getParameter("hak");
	String pageNum = request.getParameter("page");
	if(hak!=null) // hak으로 받아왔으면 실행
		dao.deleteScore(hak);
	else { // 체크박스로 받아왔으면 실행
		for(int i=0;i<chkList.length;i++) {
			dao.deleteScore(chkList[i]);  
			// 해당 학번을 dao의 deletescore메소드에 넣어서 DB에 있는 행을 삭제시킨다.
		}
	}
	response.sendRedirect("list.jsp?page="+pageNum);
	
	
%>