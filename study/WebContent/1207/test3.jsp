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
var n, s;
s=0;
n=0;

while(n<100) {
	n++;
	if(!((n%2)==0))
		s+=n;
}
document.write(s+"<br>");

s=0;
n=1;
while(n<100) {
	n+=2;
	s+=n;
}
document.write(s+"<br>");




</script>
</head>
<body>

</body>
</html>