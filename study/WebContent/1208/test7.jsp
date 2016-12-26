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
function lotto() {
	var arr = new Array();
	
	for(var i=0;i<6;i++) { // 중복되지 않는 6개의 난수 발생
		arr[i]=Math.floor(Math.random()*45)+1;
		for(j=0;j<i;j++) {
			if(arr[i]==arr[j]) {
				i--;
				break;
			}
		}
	}
	
	arr.sort(compareAsc); // 정렬을 하기위함
	
	var s="";
	for(var i=0;i<arr.length;i++) {
		s+=arr[i]+" ";
	}
	var div=document.getElementById("result");
	div.innerHTML=s;
	
	function compareAsc(a,b) {
		return a-b; // 오름차순
	}
	
	function compareDesc(a,b) {
		return -(a-b); // 내림차순
	}
}
</script>
</head>
<body>

<div id="result"></div>
<input type="button" value="결과" onclick="lotto();">
</body>
</html>