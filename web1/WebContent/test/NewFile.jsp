<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
var ABC = function(){
this.call = function(){
	 alert("원래 콜이라고 이것들아!!!");
 }
}
function doCheckValue(){
	var a = new ABC();
	a.call();
	a.call = function(){
		alert("재정의 했다고 이것들아!!!");
	}
	a.call();
}
</script>
<script>
var ABC = function(){
	 this.call = function(){
		 alert("원래 콜이라고 이것들아!!!");
	 }
	}
	function ddd(abc){
		alert(abc);
	}
	function doCheckValue(){
		var a = new ABC();
		a.call();
		a.call = ddd;
		a.call("이건 파라메터다?");
	
	}

</script>
<body>
<input type="button" onclick ="doCheckValue()">

</body>
</html>