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



</head>
<body>
<input type="text" id="data"><br>
 
                    <!-- 키 이벤트!!! -->
<h3>keydown</h3>
<div id="div1"></div>

<h3>keypress</h3>
<div id="div2"></div>

<h3>keyup</h3>
<div id="div3"></div>

<script type="text/javascript"> // 스크립트가 더 밑에 있어야해
// 데이터에서 키보드를 건드렸을 때에용
document.getElementById("data").onkeydown=function(e) { // data에 keydown 이벤트가 발생 하면 안에있는 내용을 실행하라
	var c=e.keyCode;
	document.getElementById("div1").innerHTML=c;
}; // 걍 눌렸다는것만 인지한다

document.getElementById("data").onkeypress=function(e) {  // keypress
	var c=e.keyCode;
	document.getElementById("div2").innerHTML=c;
}; // 눌린 알파벳의 아스키코드까지 인지하며 (a~z, 0~9, +-*/) 등 아스키코드와 관련된것만 인지한다..

document.getElementById("data").onkeyup=function(e) {  // keyup
	var c=e.keyCode;
	document.getElementById("div3").innerHTML=c;
}; // 걍 때는순간만 인지한다
</script>







</body>
</html>