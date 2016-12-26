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
var arr = new Array(); // 배열을 선언한다! 크기는 미리 선언할 필요 없다.
arr[0]=1;
arr[1]=10;
arr[2]=30;

for(var i=0;i<arr.length;i++) { // 정의한 배열 출력
	console.log(arr[i]);
}

var arr2 = new Array();
arr2[0]=10;
arr2[1]=20;
arr2[2]=30;
arr2[3]=40;
for(var i=0;i<arr2.length;i++) { // 정의한 배열 출력
	console.log(arr2[i]);
}

// 배열 초기화1
var arr3=[11,12,13];
for(var i=0;i<arr3.length;i++) { // 정의한 배열 출력
	console.log(arr3[i]);
}

//배열 초기화2
var arr4=new Array("a","b","c");
for(var i=0;i<arr4.length;i++) { // 정의한 배열 출력
	console.log(arr4[i]);
}

// 2차원배열 선언방법
var a = new Array();
a[0]=new Array();
a[1]=new Array();
a[0][0]=1;
a[0][1]=2;
a[1][0]=3;
a[1][1]=4;

for(var i=0;i<a.length;i++) { // 2차원 배열 출력
	for(var j=0;j<a[i].length;j++){
		console.log(a[i][j]);
	}
}
//------------------------------------------
for(var i=1;i<=100;i++) { // 난수출력??
	num=Math.floor(Math.random()*100)+1;
	document.write(num+" ");
}
</script>


</head>
<body>

</body>
</html>