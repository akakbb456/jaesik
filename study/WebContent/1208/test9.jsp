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
function sub1() {
	location.href="http://www.naver.com"; // 해당 주소로의 이동! location 객체에서는 href만 알면 된다
}
var win=null;
function sub2() {
	var url="http://www.google.com";
	/* win = window.open(url); */ 
	win = window.open(url, "exam", "width=500,height=200, left=50, top=50") // 팝업의 이름 및 크기지정, 위치지정
}

function sub3() { // sub3을 이용해 sub2의 팝업을 끈다
	if(win!=null) {
		win.close(win);
	}
	win=null
}
</script>
</head>
<body>
<input type="button" value="네이버" onclick="sub1();"><br>
<input type="button" value="팝업열기" onclick="sub2();"><br>
<input type="button" value="팝업닫기" onclick="sub3();"><br>
</body>
</html>