<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ex2_ok.jsp" method = "post">
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
<input type="submit" value="보내기"> <!-- type="image"또한 데이터전송이 가능하다 -->
<input type="reset" value="다시입력">
</form>
</body>
</html>