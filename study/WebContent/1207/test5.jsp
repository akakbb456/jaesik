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
var n=0;

function start() {
	n++;
	var lay=document.getElementById("lay");
	
	lay.innerHTML="n:"+n;
}

var id=setInterval("start();", 2000);

function stop() {
	if(id!=null)
		clearInterval(id);
	id=null;
}
</script>

</head>
<body>
<input type="button" value="중지" onclick="stop();">
<br>

<div id="lay"></div>
</body>
</html>