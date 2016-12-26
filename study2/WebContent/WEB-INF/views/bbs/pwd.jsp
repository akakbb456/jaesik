<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study</title>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css">

<script type="text/javascript">
function check() {
	var f=document.pwdForm;
	
	if(! f.pwd.value) {
		alert("패스워드를 입력 하세요 !!!");
		f.pwd.focus();
		return false;
	}
	
	f.action="<%=cp%>/bbs/pwd_ok.do";
	
	return true;
}
</script>

</head>
<body>

<div class="layoutMain">
	<div class="layoutHeader">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
	
	<div class="layoutBody">

		<div style="min-height: 450px;">
				<div style="width:100%;	height: 40px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
				    <div style="width:350px; height:30px; line-height:30px; margin:5px auto;">
				        <img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">
				        <span style="font-weight: bold;font-size:13pt;font-family: 나눔고딕, 맑은 고딕, 굴림;">게시판</span>
				    </div>
				</div>
			
				<div style="margin: 10px auto; margin-top: 20px; width:350px; min-height: 400px;">
		
					<form name="pwdForm" method="post" onsubmit="return check();">
				    <table style="width: 300px; margin: 100px auto 0px; background:#cccccc; border-spacing: 1px;">
					    <tr align="center">
					      <td height="40" bgcolor="#E6E4E6">
					          <b>게시물 ${title}</b>
					      </td>
					    </tr>
							
					    <tr align="center">
					      <td bgcolor="white" height="50">
					            패스워드 &nbsp;:&nbsp;
				             <input type="password" name="pwd" size="10" maxlength="10" class="boxTF">
					      </td>
					  </tr>
					</table>
					
				 	<table style="width: 300px; margin: 0px auto; border-spacing: 0px;">
					    <tr align="center" height="50">
					       <td>
							  <input type="submit" value=" 확  인 " class="btn">&nbsp;
							  <input type="button" name="cancel" value=" 취  소 " class="btn"
							         onclick="javascript:location.href='<%=cp%>/bbs/list.do';">
				
					          <input type="hidden" name="mode" value="${mode}">
					          <input type="hidden" name="num" value="${num}">
					          <input type="hidden" name="page" value="${page}">
					       </td>
					    </tr>
					</table>
					</form>

					<table style="width: 300px; margin: 10px auto 0px; border-spacing: 0px;">
					    <tr align="center" height="30">
					       <td><span style='color:red'>${message}</span></td>
					    </tr>
					</table>
				</div>
		</div>

    </div>
	
	<div class="layoutFooter">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>