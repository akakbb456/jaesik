<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();

	request.setCharacterEncoding("utf-8");
	String chks[] = request.getParameterValues("chks");
	String str="";
	if(chks != null) {
	     for(String s:chks)
	        str+=s+",";
	}

	if(str.length()!=0)
		str=str.substring(0, str.length()-1);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-size: 9pt;
	font-family: 맑은 고딕, 돋움;
}
</style>

</head>
<body>
<div style="width: 300px; margin: 30px auto 0;">
	<b>선택좌석 :  <%=str%></b>
</div>
</body>
</html>