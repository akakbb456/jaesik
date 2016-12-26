<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-size: 9pt;
	font-family: 맑은 고딕, 돋움;
}
</style>

<script type="text/javascript">
function send() {
	var f=document.forms[0];

	if(! f.name.value) {
		alert("이름을 입력 하세요.");
		f.name.focus();
		return;
	}
	
	if(! f.birth.value) {
		alert("생년월일을 정확히 입력 하세요(yyyy-mm-dd).");
		f.birth.focus();
		return;
	}
	
	if(! f.phone.value) {
		alert("전화번호를 정확히 입력 하세요.");
		f.phone.focus();
		return;
	}
	
	if(! f.pay.value) {
		alert("기본급여는 숫자만 가능 합니다.");
		f.pay.focus();
		return;
	}
	
	if(! f.sudang.value) {
		alert("수당은 숫자만 가능 합니다.");
		f.sudang.focus();
		return;
	}
	
	f.submit();
}
</script>

</head>
<body>

<form action="insa_ok.jsp" method="post">
<table border="1" style="width: 400px; margin:30px auto 5px; border-spacing: 0px;border:1px solid #cccccc; border-collapse: collapse;">
	<tr height="35">
	   <td width="100" align="right" style="padding-right: 5px">이름</td>
	   <td width="300" style="padding-left: 10px">
	         <input type="text" name="name">
	   </td>
	</tr>
	<tr height="35">
	   <td width="100" align="right" style="padding-right: 5px">생년월일</td>
	   <td width="300" style="padding-left: 10px">
	         <input type="date" name="birth">
	   </td>
	</tr>
	<tr height="35">
	   <td width="100" align="right" style="padding-right: 5px">전화번호</td>
	   <td width="300" style="padding-left: 10px">
	         <input type="text" name="phone">
	   </td>
	</tr>
	<tr height="35">
	   <td width="100" align="right" style="padding-right: 5px">기본급</td>
	   <td width="300" style="padding-left: 10px">
	         <input type="number" name="pay">
	   </td>
	</tr>
	<tr height="35">
	   <td width="100" align="right" style="padding-right: 5px">수당</td>
	   <td width="300" style="padding-left: 10px">
	         <input type="number" name="sudang">
	   </td>
	</tr>
</table>

<table style="width: 400px; margin:0px auto; border-spacing: 0px;border-collapse: collapse;">
<tr height="40" align="center">
   <td><input type="button" value=" 등록하기 " onclick="send();"></td>
</tr>
</table>
</form>

</body>
</html>