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
function check() {
	var f = document.forms[0];
	if(f.cnt.value) {
		return false;
	}
	return true;
}

</script>
</head>
<body>

<form action="lotto_ok.jsp" method="post">

개수:<input type="number" name = "cnt" min="1" max="5" onsubmit = "return check();">


<input type="submit" value="구매하기">

</form>



</body>
</html>