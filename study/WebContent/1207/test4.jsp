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
// 함수선언방식으로 함수 생성
function add(x,y) {
	return x+y;
}

console.log(add(10,5)); // 15
//console.log(add(10,5,8)); // 오류가 안떠용!! 8은 쌩까네

// 함수 표현식 방식으로 함수 생성
var sub=function(x,y) { // 익명함수
	return x-y; 
};

var s=sub;

console.log(sub(3,5)); // -2
console.log(s(10,5)); // 5

//기명 함수 표현식 방식으로 함수 생성
var mul2=function mul(x,y) { 
	return x*y; 
};

console.log(mul2(3,5)); // 15
//console.log(mul(3,5)); // 에러: 함수표현식에서 사용한 함수명은 접근불가

 var fact = function f(x,y) {
	if(y<=0)
		return 1;
	return x*f(x,y-1); // 2*f(2,9)
};
console.log(fact(2,10));



// Function() 생성자를 통한 함수 만들기 
var s1=Function('x','y','return x+y;');
console.log(s1(2,10));

// 함수 선언문에서의 함수 호이스팅(선언전 호출)
console.log(s2(2,10));
function s2(x,y) {
	return x+y;
}


//함수 표현식에서의 함수 호이스팅 ==> 에러
//console.log(s3(2,10));
var s3=function s2(x,y) {
	return x+y;
}
console.log(s3(2,10)); // 여기서는 에러 아님

 
// 가변인수


function s4(){
    for(var i = 0; i < s4.arguments.length; i++) // s 붙으면 다 배열 
       {
       document.write(s4.arguments[i] + "<br>");
       }
 }
 s4(1, 2, 3);

// 콜백함수
window.onload=function(){ // onload는 페이지가 열릴때 자동적으로 발생되는 이벤트
	alert("안녕...");
};



</script>
</head>
<body>

</body>
</html>