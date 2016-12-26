<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include액션태그</title>
</head>
<body>

<table style="width:800px; margin: 20px auto;">
<tr height="50">
	<td>
		<jsp:include page="top.jsp"/>
	</td>
</tr>
<tr height="400">
	<td valign="top">
	 게시판입니다.
	</td>
</tr>
<tr height="50">
	<td>
		<jsp:include page="footer.jsp"/>
	</td>
</tr>
</table>
</body>
</html>