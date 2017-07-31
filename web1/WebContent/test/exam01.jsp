<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="exam01_ok.jsp">
<input type="text" name="id" id="id"/><br/>
<input type="text" name="name" id="name"/><br/>
<input type="text" name="age" id="age"/><br/>
<input type="text" name="address" id="address"/><br/>
<input type="text" name="address2" id="address2"/><br/>
<input type="text" name="hp1" id="hp1"/><br/>
<input type="text" name="hp2" id="hp2"/><br/>
<input type="text" name="hp3" id="hp3"/><br/>
<input type="text" name="zipcode" id="zipcode"/><br/>
<input type="text" name="password" id="password"/><br/>
<input type="button" value="값확인" onclick="doCheckValue()"/>
</form>
<script>

var AjaxUtil = function(p_url, params){
	this.params = params;
	
	getHttpXmlObj = function(){
		if(window.XMLHttpRequest){
	  		return new XMLHttpRequest();
	 	}else if(window.ActiveXObject){
	  		return new ActiveXObject("Microsoft.XMLHTTP");
	 	}
		alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
	}
	this.xhr = getHttpXmlObj();
	var method = "get";
	var url = p_url;
	var aSync = true;
	this.xhr.onreadystatechange=function(){
   		if (this.readyState==4){
   			if(this.status==200){
	   			var result = decodeURIComponent(this.responseText);
	   			alert(result);
	   			document.getElementById("result_div").innerHTML = result;
	   			
   			}
   		}
	}
	this.changeCallBack = function(func){
		this.xhr.onreadystatechange = func;
	}
   	this.xhr.open(method, url+this.params, aSync);
   	this.send = function(){
   		this.xhr.send.arguments = this;
   	   	this.xhr.send();
   	}
} 
function doCheckValue(){
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var age = document.getElementById("age").value;
	var address = document.getElementById("address").value;
	var address2 = document.getElementById("address2").value;
	var hp1 = document.getElementById("hp1").value;
	var hp2 = document.getElementById("hp2").value;
	var hp3 = document.getElementById("hp3").value;
	var zipcode = document.getElementById("zipcode").value;
	var password = document.getElementById("password").value;
	var params = "?id=" + id + "&name=" + name +"&age=" + age +"&address=" + address +"&address2=" + address2 +"&hp1=" + hp1 +"&hp2=" + hp2 +"&hp3=" + hp3 +"&zipcode=" + zipcode +"&password=" + password;
	var au = new AjaxUtil("/test/exam01_ok.jsp", params);
	au.send();
}
</script>
<div id="result_div"></div>
</body>
</html>