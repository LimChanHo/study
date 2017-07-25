<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.dto.BoardInfo" %>
<body>
<!-- 
게시판을 jsp로 만들어주세요 파일명은 board_select.jsp입니다.
게시판이 제대로 나오고 난 후 버튼 2개를 만들어주세요
버튼1 : 생성하기 -> 게시판 생성화면으로 이동하면 됩니다.
버튼2 : 메인가기 -> login.jsp화면으로 이동 하면 됩니다.
 -->
 <%
 
	Connection con = null;
	PreparedStatement ps = null;
	try{
		con = DBConn.getCon();
		String sql = "select binum, bititle, bicontent, bipwd, creusr, credat from board_info";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		String tableStr="<table border='1'>";
		tableStr += "<tr>";
		tableStr += "<td>번호</td>";
		tableStr += "<td>제목</td>";
		tableStr += "<td>내용</td>";
		tableStr += "<td>비밀번호</td>";
		tableStr += "<td>작성자</td>";
		tableStr += "<td>작성일자</td>";
		tableStr += "</tr>";
		while(rs.next()){
			tableStr += "<tr>";
			tableStr += "<td>"+rs.getInt("binum") + "</td>";
			tableStr += "<td>"+rs.getString("bititle") + "</td>";
			tableStr += "<td>"+rs.getString("bicontent") + "</td>";
			tableStr += "<td>"+rs.getString("bipwd") + "</td>";
			tableStr += "<td>"+rs.getString("creusr") + "</td>";
			tableStr += "<td>"+rs.getString("credat") + "</td>";
			tableStr += "</tr>";
		}
		tableStr += "</table>";
		out.println(tableStr);
	}catch(Exception e){
		System.out.println(e);
	}
	%>
	<input type="button" value="게시글 작성" onclick="doMovePage('board_insert')"/>
	<input type="button" value="메인가기" onclick="doMovePage('main')"/>
</body>
</html>