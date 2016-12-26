<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1"; style="border-spacing: 0; border-collapse: 0; margin: 10px auto">
<tr>
	<td>a</td>
	<td colspan="2">b</td>
	<td>c</td>
	<td>d</td>
</tr>

<tr>
	<td>e</td>
	<td>f</td>
	<td>g</td>
	<td rowspan="2"; colspan="2">h</td>
</tr>

<tr>
	<td rowspan="2">i</td>
	<td>j</td>
	<td>l</td>
</tr>

<tr>
	<td>m</td>
	<td colspan="2">n</td>
	<td>o</td>
</tr>
</table>



</body>
</html>