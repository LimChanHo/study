<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.dto.BoardInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String bititle = request.getParameter("bititle");
String bicontent = request.getParameter("bicontent");
String creusr = request.getParameter("creusr");
String bipwd = request.getParameter("bipwd");
String binum = request.getParameter("binum");
String result1 = "";

if(binum!=null){
	result1 = "11";
	BoardInfo bi = new BoardInfo();
	bi.setBinum(Integer.parseInt(binum));
	bi.setBititle(bititle);
	bi.setBicontent(bicontent);
	bi.setCreusr(creusr);
	bi.setBipwd(bipwd);
	
	
Connection con = null;
PreparedStatement ps = null;
try {
	con = DBConn.getCon();
	String sql = "update board_info ";
	sql += " set bititle=?,";
	sql += " bicontent=?,";
	sql += " creusr=?";
	sql += " bipwd=?";
	sql += " where binum=?";
	
	ps = con.prepareStatement(sql);
	ps.setString(1, bi.getBititle());
	ps.setString(2, bi.getBicontent());
	ps.setString(3, bi.getCreusr());
	ps.setString(4, bi.getBipwd());
	ps.setInt(5, bi.getBinum());
	int result = ps.executeUpdate();
	if(result==1){
		con.commit();
		result1 =  "수정성공";
		
	}else{
		result1 =  "수정실패";
	}
} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
}finally{
	if(ps!=null){
		ps.close();
		ps = null;
	}
	DBConn.closeCon();
}


}
%>
<script>
alert("<%=bicontent%>");
location.href="/board/board_select.jsp";
</script>

</body>
</html>