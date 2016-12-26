<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();

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
.btn {
	 font-size: 12px;
	 color:#333;
 	 font-weight:500;
	 font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
	 border:1px solid #ccc;
	 background-color:#FFF;
	 vertical-align:middle;
	 text-align:text-align;
	 cursor:cursor;
	 padding:4px 8px;
	 border-radius:4px;
	 margin-bottom: 3px;
}
.btn:active, .btn:focus, .btn:hover {
	 background-color:#e6e6e6;
	 border-color: #adadad;
	 color: #333;
}
.boxTF {
	border:1px solid #999;
	padding:4px 6px;
	border-radius:4px;
	background-color:#ffffff;
	font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
	font-size: 9pt;
}
</style>

<script type="text/javascript">
function check() {
	var f=document.forms[0];
	
	if(! /^(\d+)$/.test(f.rows.value)) {
		alert("숫자만 입력 가능 합니다.");
		f.rows.focus();
		return false;
	}
	
	if(f.rows.value<5) {
		alert("행은 5이상 가능합니다.");
		f.rows.focus();
		return false;
	}

	if(! /^(\d+)$/.test(f.cols.value)) {
		alert("숫자만 입력 가능 합니다.");
		f.cols.focus();
		return false;
	}
	
	if(f.cols.value<5) {
		alert("열은 5이상 가능합니다.");
		f.cols.focus();
		return false;
	}

	f.action="seat2.jsp";
	f.submit();
}
</script>

</head>
<body>

<form action="" method="post">
<table style="width:250px; margin: 3px auto 0; border-spacing: 0; border-collapse: collapse;">
 <caption style="height:35px;"><b>좌석 만들기</b></caption>

<tr height="1"><td colspan="2" bgcolor="#ccc"></td></tr>
 
 <tr height="35">
      <td bgcolor="#e4e6e4" align="center" width="80">행수</td>
      <td align="left" style="padding-left: 10px;">
            <input type="text" name="rows" class="boxTF">
      </td>
 </tr>

<tr height="1"><td colspan="2" bgcolor="#ccc"></td></tr>

 <tr height="35">
      <td bgcolor="#e4e6e4" align="center" width="80">열수</td>
      <td align="left" style="padding-left: 10px;">
            <input type="text" name="cols" class="boxTF">
      </td>
 </tr>

<tr height="1"><td colspan="2" bgcolor="#ccc"></td></tr>
 
 <tr height="35">
      <td align="center" colspan="2">
            <input type="button" value=" 만들기 " class="btn" onclick="check();">
      </td>
 </tr>

</table>
</form>
         
</body>
</html>