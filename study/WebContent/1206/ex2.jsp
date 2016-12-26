<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check() {
	var f = document.myForm;
	
	// if(f.name.value=="")
	if(!f.name.value) { // 바로 위랑 같은뜻! (공백일 때)
		alert("이름...");
		f.name.focus(); // 커서를 미리 name에 가져다 둔다
		return false; // false가 리턴되면 서버로 전송이 되지 않는다.
	}
	
	if(!f.pwd.value) { // 바로 위랑 같은뜻! (공백일 때)
		alert("패스워드...");
		f.pwd.focus(); // 커서를 미리 name에 가져다 둔다
		return false; // false가 리턴되면 서버로 전송이 되지 않는다.
	}
	
	return true;
}
</script>

</head>
<body>
<form name = "myForm" action="ex2_ok.jsp" method="post" onsubmit="return check();">
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
	</select>

	<button>보내기</button>
	<input type="submit" value = "보내기">  <!-- 바로 위에줄이랑 같은거 -->
</form>


</body>
</html>