<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	String result="성인";
	
	if(age<19)
	 result="미성년장";
	
	request.setAttribute("msg", result); // test3_result로 보내기 위해 


	request.setAttribute("msg", result);
	
	response.sendRedirect("test4_result.jsp"); // 리다이렉트!!

//리다이렉트는 아래 모든 내용을 지운다
%>
