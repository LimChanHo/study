<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<form method="get" action="<%=rootPath%>/board/board_insert_ok.jsp" >
제목 : <input type="text" name="bititle" id="bititle"/><br/>
내용 : <textarea name="bicontent" id="bicontent"></textarea><br/>
글쓴이 : <input type="text" name="creusr" id="creusr" value="<%=userId%>"/><br/>
비밀번호 : <input type="password" name="bipwd" id="bipwd" /><br/>
<input type="submit" value="글쓰기"/>
</form>
</body>
</html>