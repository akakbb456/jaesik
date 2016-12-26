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
// Object() 를 이용한 a객체를 생성
var a = new Object();

a.name = "홍길동"; // 클래스가 없으므로 이런식으로 데이터를 넣는다
a.age = 20;

console.log(typeof a); // a라는 놈의 자료형을 출력하세용! ==> Object
console.log(a); // 객체의 프로퍼티를 확인할 수 있다


var b={
		name:"자바", // 이런식으로도 입력이 가능!!
		age: 20
};

console.log(typeof b);
console.log(b);


// 생성자 생성
function User(name, age, job){
	this.name=name; // 프로퍼티 설정
	this.age = age;
	this.job = job;
	
	this.sayName = function() { // 함수설정
		return this.name;
		//console.log(this.name);
	};
}

var u1 = new User("자바","20","개발자");
var u2 = new User("스프링","30","코더");
console.log(u1);
console.log(u2);
console.log(u1.constructor==User); // u1의 생성자는 User니?? ==> true값 반환

console.log(u1 instanceof User); // 너 User객체니? ==> true
console.log(u1 instanceof Object); // 너 Object객체냐? ==> true

// 함수객체의 프로토타입을 이용하여 함수 정의(생성자에서 정의하는 것보다 효율적)
// ->즉 외부에서의 메소드를 추가하는 방법
User.prototype.result = function() {
	if(this.age>=19)
		return "성인";
	return "미성년자";
};

alert(u1.sayName()+":"+u1.age+":"+u1.result()); // result함수가 추가되었다!!! 


// 결론: 자바스크립트도 객체라는게 있다!(클래스랑은 좀 다르다), 객체를 만드는 방법은 다양하다
// 프로토타입을 통해서 함수를 정의해서 넣을 수 있당
</script>



</head>
<body>

</body>
</html>