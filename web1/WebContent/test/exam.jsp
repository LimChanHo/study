<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

연산자 : <input type="text" id="op"/><input type="button" id="getCal" value="계산리스트호출"/>
<div id="result_div" class="container"></div>
<script>

var a = {a:1, b:1};
var b = {a:2, b:2};
var c = {a:3, b:3};
var list = [{"result":"4","calnum":"6","op":"+","num1":"2","num2":"2"},
	{"result":"4","calnum":"7","op":"+","num1":"2","num2":"2"},
	{"result":"1","calnum":"8","op":"-","num1":"4","num2":"3"},
	{"result":"6","calnum":"9","op":"*","num1":"2","num2":"3"},
	{"result":"2","calnum":"10","op":"/","num1":"10","num2":"5"}];
$("#getCal").click(function(){
	for(var i=0, max=list.length;i<max;i++){
		var m = list[i];
		alert(m.result);
	}
});
</script>
</body>
</html>