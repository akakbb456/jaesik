<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function send() {
	alert("zzz");
}
</script>


</head>
<body>

<form action="jvascript:send();" method="post">
<fieldset>
	<legend>입력사항</legend>
	<p>
		<label>
		아이디:
		<input type="text" name="id" 
				maxlength="10" 
				required="required" 
				placeholder="아이디 입력">
		</label>
	</p>
	<p>
		<label>
		패스워드:
		<input type="password" name="pwd" 
				maxlength="10" 
				required="required" 
				placeholder="패스워드 입력">
		</label>
	</p>
	<p>
		<label>
		이름:
		<input type="text" name="name" 
				maxlength="10" 
				required="required" 
				placeholder="이름 입력">
		</label>
	</p>
</fieldset>

<p>
  <label>
  전화번호 : 
  <input type="tel" name="tel"
  			required="required"
  			pattern="(010-[0-9]{4}-[09]{4})">
  </label>
</p>

<p>
  <label>
  이메일 : 
  <input type="email" name="email"
  			required="required">
  </label>
</p>

<p>
  <label>
  생년월일: 
  <input type="date" name="birth"
  			required="required">
  </label>
</p>

<p>
  <label>
   나이: 
  <input type="number" name="age"
  			required="required" min = "0" max="130">
  </label>
</p>

<p>
	<label>
	  학력:
	  <input list = "haks" name="hak">  <!-- list는 datalist중에 선택할 수 있게 한다!! -->
	  <datalist id = "haks">
	  	  <option>대학원</option>	
		  <option>대졸</option>
		  <option>고졸</option>
		  <option>기타</option>
	  </datalist>
	</label>
</p>


<p>
	<label>
	메모:
		<textarea rows="5" cols="30" name = "memo"></textarea>
	</label>
</p>


<p>
	<label>
	 약관동의
		<input type = "checkbox"
		      checked = "checked"
		      onchange="form.btn.disabled=!checked"> 
	</label>
</p>


<input type="text" value="예제" name = "t1"
	readonly="readonly"><br> <!-- 비활성화기능 및 서버로 전송된다.(클라이언트가 고칠수만 없게 만들기 위해 사용) -->
<input type="text" value="예제" name = "t2"
	disabled="disabled"><br> <!-- 비활성화기능 및 서버로 전송되지 않는다(ex. 영화관에 이미 선택되어있는 좌석) -->


<p>
	<input type="submit" name="btn" value="회원가입">
</p>


</form>



</body>
</html>