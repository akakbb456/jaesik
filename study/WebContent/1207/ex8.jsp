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
</head>
<body>

<form action="">
	<input type="radio" id="test1" name = "test1"> 
	<!-- id는 중복따위 허용 안됨, name은 중복가능
	서버에서 데이터를 받을때는 id가 아닌 name으로만 받을 수 있다 -->
	<label for = "test1" title = "알아서 하삼">예</label>
	<br>
	<input type="radio" id="test2" name="test2">
	<label for = "test2" title = "알아서 하삼">아니오</label>

</form>


<!-- 라벨은 단순히 제목을 쓸때 많이 사용하며 위의 라벨의 경우 "예"를 선택했을때도 radio가 선택이 가능하다-->



</body>
</html>