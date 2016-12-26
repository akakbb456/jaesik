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
<title>Insert title here</title>
<script type="text/javascript">
var a;

a="10+20";
document.write(a+"<br>");
a="10"+20; // 1020. +는 문자가 우선순위가 높다.
document.write(a+"<br>");

a="10*20";
document.write(a+"<br>");
a="10"*20; // 200. +이외는 숫자가 우선순위가 높다.
document.write(a+"<br>");

a=parseInt("10")+20; // 30
document.write(a+"<br>");

var x,y;
x="123";
y=123;
document.write((x==y)+"<br>"); // true
document.write((x===y)+"<br>"); // false(동치)
document.write((x!=y)+"<br>"); // false
document.write((x!==y)+"<br>"); // true
</script>
</head>
<body>

</body>
</html>