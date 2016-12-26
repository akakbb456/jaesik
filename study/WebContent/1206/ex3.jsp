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
	
	if(!f.pwd.value) { // 바로 위랑 같은뜻! (공백일 때)
		alert("패스워드...");
		f.pwd.focus(); // 커서를 미리 name에 가져다 둔다
		return; // false가 리턴되면 서버로 전송이 되지 않는다.
	}
	
	f.submit();
}
</script>

</head>
<body>
<form name = "myForm" action="ex3_ok.jsp" method="post">
이름: <input type="text" name="name"><br>
패스워드: <input type="password" name="pwd"><br>
나이: <input type="number" name="age"><br>
생년월일: <input type="date" name="birth"><br>
학력:
	<select name="hak">
		<option value="">::선택::</option>
		<option value="대학원">대학원졸</option>
		<option value="대학교">대학졸</option>
		<option value="고졸">고졸</option>
	</select> <br>

	<input type="button" value = "보내기" onclick="check();">  
	<!-- 버튼만으로는 아무런 변화가 일어나지 않는다 -->
</form>


</body>
</html>