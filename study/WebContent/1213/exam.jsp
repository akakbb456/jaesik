<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>CHECKBOX</TITLE>
<script>
function check(){
    cbox = input_form.chk;
    if(cbox.length) {  // 여러 개일 경우
        for(var i = 0; i<cbox.length;i++) {
            cbox[i].checked=input_form.all.checked;
        }
    } else { // 한 개일 경우
        cbox.checked=input_form.all.checked;
    }
}
</script>
</HEAD>
<BODY>
<form name="input_form">
<input type="checkbox" name="all" onclick="check();">check all<br>
<input type="checkbox" name="chk" value="01" color="white">TEST1<br></font>
<input type="checkbox" name="chk" value="02" color="white">TEST2<br></font>
<input type="checkbox" name="chk" value="03" color="white">TEST3<br></font>
<input type="checkbox" name="chk" value="04" color="white">TEST4<br></font>
</form>
</body>
</html>

