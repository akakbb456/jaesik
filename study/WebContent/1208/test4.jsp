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

var a = "seoul korea";
console.log(a.length); // 11
console.log(a.substring(6,9)); // -> kor
console.log(a.substr(6,3)); // -> kor

var b = new Date(); // 날짜관련 내장객체 Date!! 이건 new를 해줘야 쓸 수 잇당
console.log(b);
</script>

<script type="text/javascript"> // 스크립트는 여러개 해도 상관없음(지금은 혼동할까봐)
function showDate() { // 시계
	var now = new Date();
	var y = now.getFullYear(); // 연도를 가져오는 방법
	var m = now.getMonth()+1; // 월을 가져오는 방법
	var d = now.getDate(); // 일을 가져오는 방법
	
	var s = y+"-"+m+"-"+d;
	
	var hr = now.getHours(); // 시
	var mi = now.getMinutes(); // 분
	var sc = now.getSeconds(); // 초
	
	s+=" "+hr+":"+mi+":"+sc;
	
	document.getElementById("datetime").value = s;
	
	setTimeout("showDate()",1000) 
	// setTimeout: (한번만 실행하라!) 무한루프에 빠지게 해서 1초에 한번씩 계속 부르게 한다 ㅜㅜ이해안댐.
}
//showDate() --> 실행순서로 인한 오류! (아래와 같이 코딩하면 오류안뜬당)

//******************************************//
if(window.attachEvent) { // 
	window.attachEvent("onload",function(){ // IE 낮은 버전은 이렇게 코딩해야해
		showDate();
	});
}else if(window.addEventListener) {
	window.addEventListener("load",function() { // IE, 크롬 등은 이렇게코딩..=> load가 발생 시 showDate를 불러라!
		showDate();
	},false); 
}
</script>

</head>
<body>

<input type="text" size="30" id="datetime"
  style="border: none;" readonly="readonly"> <!-- readonly="readonly" 는 못고치게 하는거다 -->









</body>
</html>