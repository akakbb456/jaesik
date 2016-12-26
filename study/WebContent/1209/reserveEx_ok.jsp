<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	String []chks=request.getParameterValues("chks");
	String ss="";
	if(chks!=null) {
		for(String s:chks)
			ss+=s+" | ";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
선택 좌석 : <%=ss%>
</body>
</html>