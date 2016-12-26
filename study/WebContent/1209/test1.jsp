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
// 앞 뒤 공백을 없애는 함수를 String객체에 추가



 String.prototype.trim = function(){     //앞 뒤 공백을 없애는 함수를 String객체에 추가!
	   var p = /(^\s*)|(\s*$)/g;            //   \s는 공백!!
	   return this.replace(p,"");
	}



function result1() {
	var f=document.forms[0];
	
	var s=f.name.value;
	s=s.trim();
	s=":"+s+":";
	alert(s); 
	
	
	
	var format;
	//var format=/^[0-9][0-9]{0,2}$/g; // ^:앞에! ,[0-9]: 0에서 9까지 , $: 뒤에 두개의 숫자가 한자리 혹은 두자리
									   // 1~3자 숫자만
	//var format=/^[\-|\+|0-9][0-9]*$/g; // '-'or'+'or''
	format = /^[\uac00-\ud7a3]+$/g; // 'ㅋㅋㅋ'같은 자음만 한거도 막음 오직 한글 한글자 이상만 가능
	if(!format.test(f.name.value)) {
		alert("한글만 가능...");
		f.name.focus();
		return;
	}
	format = /^(\d+)$/g; // \d: 숫자, +: 한개 이상.. 즉 숫자만 가능하다는 뜻
	if(!format.test(f.num.value)) {
		alert("숫자만 가능...");
		f.num.focus();
		return;
	}
	format=/(\.gif|\.png|\.jpg|\.jpeg)/i; // i: g와는 달리 대문자까지도 포용, =>png,gif,jpg,jpeg파일인지 검사하는것
	if(!format.test(f.photo.value)) {
		alert("이미지파일만 가능...");
		f.photo.focus();
		return;
	}
	alert("성공...");
	
}
</script>



</head>
<body>

<form>
한글: <input type="text" name="name"><br>
숫자: <input type="text" name="num"><br>
파일: <input type="file" name="photo"><br>
<input type="button" value="확인" onclick="result1();">
<br>
	
</form>

</body>
</html>