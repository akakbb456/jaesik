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

<script type="text/javascript" src="<%=cp%>/res/js/util.js"></script>
<script type="text/javascript">
    function check() {
        var f = document.boardForm;

       var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

        str = f.name.value;
        if(!str) {
            alert("이름을 입력하세요. ");
            f.name.focus();
            return false;
        }
        
        
        
       str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

        str = f.pwd.value;
        if(!str) {
            alert("패스워드를 입력하세요. ");
            f.pwd.focus();
            return false;
        }
        
        
       var mode="${mode}";
       if(mode=="created")
          f.action="<%=cp%>/bbs/created_ok.do";
       else if(mode=="update")
          f.action="<%=cp%>/bbs/update_ok.do";

       // image 버튼, submit은 submit() 메소드 호출하면 두번전송
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
            <div style="width:100%;   height: 40px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
                <div style="width:600px; height:30px; line-height:30px; margin:5px auto;">
                    <img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">
                    <span style="font-weight: bold;font-size:13pt;font-family: 나눔고딕, 맑은 고딕, 굴림;">게시판</span>
                </div>
            </div>
         
            <div style="margin: 10px auto; margin-top: 20px; width:600px; min-height: 400px;">
      
               <form name="boardForm" method="post" onsubmit="return check();">
                 <table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
                 <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
               
                 <tr align="left" height="40"> 
                     <td width="100" bgcolor="#EEEEEE" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
                     <td width="500" style="padding-left:10px;"> 
                       <input type="text" name="subject" size="75" maxlength="100" class="boxTF" value="${dto.subject}">
                     </td>
                 </tr>
                 <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
                 
                 <tr align="left" height="40"> 
                     <td width="100" bgcolor="#EEEEEE" style="text-align: center;">작 성 자</td>
                     <td width="500" style="padding-left:10px;"> 
                       <input type="text" name="name" size="35" class="boxTF" value="${dto.name}">
                     </td>
                 </tr>
                  <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
                  
                 <tr align="left"> 
                     <td width="100" bgcolor="#EEEEEE" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
                     <td width="500" valign="top" style="padding:5px 0px 5px 10px;"> 
                       <textarea name="content" cols="75" rows="12" class="boxTA">${dto.content}</textarea>
                       <!-- textarea는 초기값을 주는방법이 위와 같다 -->
                     </td>
                 </tr>
                 
                 <tr align="left" height="40"> 
                     <td width="100" bgcolor="#EEEEEE" style="text-align: center;">비밀번호</td>
                     <td width="500" style="padding-left:10px;"> 
                       <input type="password" name="pwd" size="35" class="boxTF" value="${dto.name}">
                     </td>
                 </tr>
                 
                 <tr>
                    <td colspan="2" height="1" bgcolor="#DBDBDB"></td>
                 </tr>
                 
                 <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
                 </table>
               
                 <table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
                    <tr height="45"> 
                     <td align="center" >
                     <c:if test="${mode=='update'}">
                     	<input type="hidden" name="num" value="${dto.num }">
                     	<input type="hidden" name="page" value="${page }">
                     	<input type="hidden" name="boardNum" value="${dto.boardNum}">
                     </c:if>
                      <input type="image" src="<%=cp%>/res/images/btn_submit.gif" >
                        <a href="javascript:location.href='<%=cp%>/bbs/list.do';"><img src="<%=cp%>/res/images/btn_cancel.gif" border="0"></a>
      
                     </td>
                   </tr>
                 </table>
               </form>
            </div>
      </div>

    </div>
   
   <div class="layoutFooter">
      <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
   </div>
</div>

</body>
</html>