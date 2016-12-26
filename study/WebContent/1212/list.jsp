<%@page import="com.hom.JaesikUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	//MyUtil util = new MyUtil();
	JaesikUtil util = new JaesikUtil();
	int current_page=1;
	String pageNum=request.getParameter("page");
	if(pageNum!=null)
		current_page = Integer.parseInt(pageNum);
	
	int dataCount=789;
	int numPerPage=10;
	int total_page=util.pageCount(numPerPage, dataCount);
	
	String listUrl="list.jsp";
	String paging = util.paging(current_page, total_page, listUrl);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="width: 700px; margin: 20px auto;">
<tr height="35">
	<td align="center">
		<%=paging %>
	</tr>
</body>
</html>