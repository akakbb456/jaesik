<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check() {
	//var f = document.myForm;
	var f = document.forms[0];
	// if(f.name.value=="")
	if(!f.name.value) { // 바로 위랑 같은뜻! (공백일 때)
		alert("이름...");
		f.name.focus(); // 커서를 미리 name에 가져다 둔다
		return; // false가 리턴되면 서버로 전송이 되지 않는다.
	}
	
	
	f.submit();
}
</script>

</head>
<body>
<form name = "myForm" action="join_ok.jsp" method="post">

	이름:     <input type="text" name="name"><br>
	생년월일: <input type="date" name="birth"><br>
	전화번호: <input type="text" name = "tel"><br>
	기본급:   <input type="number" name = "pay"><br>
	수당:     <input type="number" name = "sudang"><br>
		<input type="button" value = "등록하기" onclick="check();">  
		<!-- 버튼만으로는 아무런 변화가 일어나지 않는다 -->
	</form>
</body>
</html>