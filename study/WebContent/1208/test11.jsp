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

<style type="text/css">
.box1 {
	background: white;
}
.box2 {
	background: yellow;
}
</style>

<script type="text/javascript">
/* '0': 48
   '9': 57 */
function txtFocus(ob) {
	ob.className = "box2";
}
function txtBlur(ob) {
	ob.className = "box1";
}
   
   
function onlyNum() {
	if(event.keyCode<48||event.keyCode>57) { // 아스키코드가 48보다 작거나 57보다 크면 (즉 숫자를 제외한..)
	// 하지만 한글은 막을수 없다.
		try {
			event.preventDefault(); //이벤트취소 =>a를 투르면 a를 취소시켜버려
		} catch (e) {
			event.returnValue = false; // IE8이하에서는 이렇게 코딩해야 한다
		}
	}
}

function onlyHum() {
	if(event.keyCode<12592||event.keyCode>12687) {  // 한글만 들어갑니다
		try {
			event.preventDefault();
		} catch (e) {
			event.returnValue = false; 
		}
	}
}



</script>

</head>
<body>
숫자만:
<input type="text" name="num" onkeypress="onlyNum()"> <!-- 키프레스 이벤트가 발생이 되면 onlyNum()이라는 함수를 호출한다 -->
<br>
한글만:
<input type="text" onkeypress="onlyHum()">
<br>

<form>
이름: <input type="text" name="name" class="box1" onfocus="txtFocus(this);" onblur="txtBlur(this);"><br>
나이: <input type="text" name="age" class="box1" onfocus="txtFocus(this);" onblur="txtBlur(this);"><br>
<input type="button" value="확인">
</form>

<br>
<div>예제</div>



</body>
</html>