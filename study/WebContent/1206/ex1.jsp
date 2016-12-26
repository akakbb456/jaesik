<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ex1_ok.jsp" method = "post">
이름: <input type="text" name = "name"><br>
패스워드: <input type="password" name = "pwd"><br>
나이: <input type="text" name = "age"><br>
성별: <input type="radio" name = "gender" value="M" checked = "checked"> 남자 <!-- checked는 미리 선택되어있게!! -->
	  <input type="radio" name = "gender" value="F"> 여자 <br>
이상형: <input type="checkbox" name = "style" value="이이이"> 이이이
		<input type="checkbox" name = "style" value="가가가"> 가가가
		<input type="checkbox" name = "style" value="나나나"> 나나나
		<input type="checkbox" name = "style" value="무무무"> 무무무
		<input type="checkbox" name = "style" value="후후후"> 후후후 <br>
<input type="submit" value="보내기">
<input type="reset" value="다시입력">
</form>
</body>
</html>