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
function dday() { // dday계산하기위한 함수!!
	var s=document.getElementById("sdate").value;
	if(s.length!=10) { // 2000-10-10 =>이런식의 입력만 받기위해 설정
		document.getElementById("sdate").focus();
		return;
	}
	
	//날짜를 숫자로!!
	var y=parseInt(s.substr(0,4)); 
	var m=parseInt(s.substr(5,2));
	var d=parseInt(s.substr(8));
	// var ss = s.split("-"); => ss[0], ss[1], ss[2] 결과는 위에랑 똑같다
	
	var date1 = new Date(); // 오늘 날짜
	var date2 = new Date(y,m-1,d); // 입력한 날짜를 date형으로!
	
	var d=(date2-date1)/1000/60/60/24; // (date2-date1)에서 밀리세컨드로 바뀌고!! ==> 날짜로 변환
	
	// d=Math.floor(d); //절삭하면 안되 디데이는 올림해야되 몇시간애매하게 남으면 그것도 하루거든
	d = Math.ceil(d); // 올림
	
	var out="디데이: <span style='color:blue;'>"+d+"일"+"</span>"; // span태그를 쓰면 날짜가 파란색으로 나오겠다 그치?
	
	
	document.getElementById("result").innerHTML=out;		
}
</script>



</head>
<body>
날짜: <input type="test" id="sdate">
<input type="button" value="확인" onclick="dday();">
<br>
<hr>
<div id="result"></div>

</body>
</html>