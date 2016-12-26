<%@page import="com.score.ScoreDTO"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   request.setCharacterEncoding("UTF-8");
   ScoreDAO dao = new ScoreDAO();
   String hak = request.getParameter("hak");
   String pageNum = request.getParameter("page");
   
   ScoreDTO dto = dao.readScore(hak);
   if(dto==null) {
	   response.sendRedirect("list.jsp?page="+pageNum);
	   return;
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
   
   function check()
   {
      var f = document.scoreForm;
      
      if (! f.hak.value)
      {
         alert("학번을 입력하세요!!");
         f.hak.focus();
         return false;
      }
      
      if (! f.name.value)
      {
         alert("이름을 입력하세요!!");
         f.name.focus();
         return false;
      }
      
      var format;
      format = /[12][0-9]{3}-[01][0-9]-[0-3][0-9]/;
      if (! format.test(f.birth.value))
      {
         alert("생년월일을 입력하세요!! (yyyy-mm-dd)");
         f.birth.focus();
         return false;
      }
      
      format = /^(\d+)$/;
      if (! format.test(f.kor.value) || parseInt(f.kor.value)>100)
      {
         alert("국어 점수를 입력하세요!!");
         f.kor.focus();
         return false;
      }
      
      format = /^(\d+)$/;
      if (! format.test(f.eng.value) || parseInt(f.eng.value)>100)
      {
         alert("영어 점수를 입력하세요!!");
         f.eng.focus();
         return false;
      }
      
      format = /^(\d+)$/;
      if (! format.test(f.mat.value) || parseInt(f.mat.value)>100)
      {
         alert("수학 점수를 입력하세요!!");
         f.mat.focus();
         return false;
      }
         
      f.action = "update_ok.jsp";
      return true;
   }
   
</script>

</head>
<body>

   <table style="width: 300px; margin: 30px auto 10px;">
      <tr height="30">
         <td align="center"><b>성적처리</b></td>
      </tr>
   </table>

   <form name="scoreForm" method="post" onsubmit="return check();">
      <table style="width: 300px; margin: 30px auto 10px;">
         <tr height="30">
            <td width="100" align="center">학번</td>
            <td width="200" style="padding-left: 5px;"><input type="text"
               name="hak" value="<%=dto.getHak()%>" readonly="readonly"></td>
         </tr>
         <tr height="30">
            <td width="100" align="center">이름</td>
            <td width="200" style="padding-left: 5px;"><input type="text"
               name="name" value="<%=dto.getName()%>"></td>
         </tr>
         <tr height="30">
            <td width="100" align="center">생년월일</td>
            <td width="200" style="padding-left: 5px;"><input type="text"
               name="birth" value="<%=dto.getBirth()%>"></td>
         </tr>
         <tr height="30">
            <td width="100" align="center">국어</td>
            <td width="200" style="padding-left: 5px;"><input type="text"
               name="kor" value="<%=dto.getKor()%>"></td>
         </tr>
         <tr height="30">
            <td width="100" align="center">영어</td>
            <td width="200" style="padding-left: 5px;"><input type="text"
               name="eng" value="<%=dto.getEng()%>"></td>
         </tr>
         <tr height="30">
            <td width="100" align="center">수학</td>
            <td width="200" style="padding-left: 5px;"><input type="text"
               name="mat" value="<%=dto.getMat()%>"></td>
         </tr>

         <tr height="35" align="center">
         	 <!-- 우리 눈에 보이지 않는 text -->
            <td colspan="2">
            <input type="hidden" name="page" value="<%=pageNum %>">
            <input type="submit" value="수정완료"> <input
               type="reset" value="다시입력"> <input type="button"
               value="수정취소" onclick="javascript:location.href='list.jsp';">
            </td>
         </tr>
      </table>
   </form>

</body>
</html>