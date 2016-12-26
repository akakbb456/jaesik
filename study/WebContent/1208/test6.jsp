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
function bg() { // 랜덤으로 색을 계속 넣어주기 위한 함수
	var r=Math.floor(Math.random()*255)+1 // Math.floor: 소수점 이하 절삭, Math.random(): 랜덤변수
	var g=Math.floor(Math.random()*255)+1
	var b=Math.floor(Math.random()*255)+1
	
	var lay=document.getElementById("lay");
	lay.style.backgroundColor="rgb("+r+","+g+","+b+")";
	
	setTimeout("bg()",2000);
}

window.onload=function() { 
	//window: 브라우저가 가진 최상단의 객체이다.  
	//onload: 브라우저의 내용이 보일 때(거의 동시에) 호출된다.
	bg();
}

</script>

</head>
<body>
<div id="lay" style="width:300px;height:300px;border:1px solid black;"></div>
</body>
</html>