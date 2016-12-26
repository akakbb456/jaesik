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
function subx(){
	var s = prompt("입력하세요..");
	alert(s);	
}

function suby(){
	var s = prompt("자바스크립트 문법을 입력하세요.."); //"alert('안녕');"입력시 안녕이라고 뜬다!
	eval(s);	
}

function sub2() {
	if(confirm('삭제할래???')) { // 불린값을 입력받는다. 확인클릭시 true, 취소클릭시 false
		alert("삭제...");
	}
}

function sub3() {
	var s,t;
	s = document.getElementById("test1").value; // 아래에 보면<input type="text" id = "test1">객체의 값!!
	t = document.getElementsByName("exam1")[0].value; // name을 통한 접근이며 elements의 s때문에 리턴값이 배열이다!
	
	alert(s+":"+t);
}

function sub4() {
	var s = "<span style='color:red;'>자바</span>";
	
	document.getElementById("div1").innerHTML=s; 
	// innerHTML은 "<span style='color:red;'>자바</span>"을 html코드로 인지 후 결과값을 삽입!
	document.getElementById("div2").innerText=s; // 걍 text형태 그대로 삽입한다
}


</script>
</head>
<body>
<input type="button" value="확인x" onclick="subx();">
<input type="button" value="확인y" onclick="suby();">
<input type="button" value="삭제" onclick="sub2();">
<br>
아이디: <input type="text" id = "test1"><br>
이름: <input type="text" name="exam1"><br>
<input type="button" value="확인" onclick="sub3();">

<div id = "div1"></div>
<div id = "div2"></div>
<input type="button" value="확인" onclick="sub4();">
<br>

</body>
</html>