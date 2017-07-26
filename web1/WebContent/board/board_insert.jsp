<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.dto.BoardInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 입력</title>
</head>
<script>
function checkValue(){
	var titleObj = document.getElementById("bititle");
	if(titleObj.value.trim()==""){
		alert("제목 입력안해?")
		return false;
	}
	var contentObj = document.getElementById("bicontent");
	if(contentObj.value.trim()==""){
		alert("내용 입력안해?")
		return false;
	}
	var userObj = document.getElementById("creusr");
	if(userObj.value.trim()==""){
		alert("글쓴이 입력안해?")
		return false;
	}
	
	var userNumObj = document.getElementById("bipwd");
// 	var userNum = parseInt(userNumObj.value);
// 	if(isNaN(userNum)){
// 		alert("숫자 입력하라고!!!!");
// 		return false;
// 	}
	if(userNumObj.value.trim()==""){
		alert("게시판암호 입력안해?")
		return false;
	}
	return true; 
}

</script>
<body>

<form action="<%=rootPath%>/board/board_insert_ok.jsp" onsubmit="return checkValue()">
제목 : <input type="text" name="bititle" id="bititle"/><br/>
내용 : <textarea name="bicontent" id="bicontent"></textarea><br/>
글쓴이 : <input type="text" name="creusr" id="creusr"/><br/>
게시판암호 : <input type="text" name="bipwd" id="bipwd"/><br/>
<input type="submit" value="글작성!!!"/>
</form>
</body>
</html>