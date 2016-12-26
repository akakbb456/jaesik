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
var a = "자바";

a = encodeURIComponent(a); // 숫자, 알파벳을 제외한 모든 문자를 인코딩 ->%EC%9E%90%EB%B0%94
console.log(a);

a = decodeURIComponent(a); // 숫자, 알파벳을 제외한 모든 문자를 디코딩 ->자바
console.log(a);

a="";
a += "var n=10;";
a += "alert(n);";
//eval(a); // string을 자바스크립트 코드로 실행(alert창이 뜸)

a="10+5";
console.log(eval(a)); // 그냥 a를 넣으면 10+5로 일케하면 나오는데 15로나온당

var x,y;
x="123";
y=isFinite(x); // true (숫자로 바꿀 수 있다!!!)
console.log(y); 

x="1,234";
y=isFinite(x); // false(숫자로 바꿀 수 없다!!!)
console.log(y);

var x,y;
x="123";
y=isNaN(x); // 숫자가 아니면 true!! -> 숫자니까 false!
console.log(y);

x="1,234";
y=isNaN(x); // 숫자가 아니면 true!! -> 숫자니까 true!
console.log(y); 

x=prompt("수식을 입력하세요?"); //prompt에 의해 창이 뜸? 그리고 5*8+10-5 입력 시 계산된 값이 리턴된다(eval에 의해)
y=eval(x);
console.log(y);


</script>

</head>
<body>

</body>
</html>