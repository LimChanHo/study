<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.dto.BoardInfo" %>
<body>
<%
	int pBinum = Integer.parseInt(request.getParameter("binum"));
	String pBiPwd = request.getParameter("bipwd");
	Connection con = null;
	PreparedStatement ps = null;
	int binum = 0;
	String bititle = "";
	String bicontent = "";
	String bipwd = "";
	String creusr = "";
	String credat = "";
	try{
		con = DBConn.getCon();
		String sql = "select binum, bititle, bicontent, bipwd, creusr, credat from board_info where binum=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1,pBinum);
		ResultSet rs = ps.executeQuery();
		rs.last();
		int rowCnt = rs.getRow();
		if(rowCnt==0){
%>
			<script>
				alert("<%=pBinum%>번 게시물은 이미 지워졌어 자시가");
				history.back();
			</script>
<%
		}
		rs.beforeFirst();
		while(rs.next()){
			binum = rs.getInt("binum");
			bititle = rs.getString("bititle");
			bicontent = rs.getString("bicontent");
			creusr = rs.getString("creusr");
			credat = rs.getString("credat");
			bipwd = rs.getString("bipwd");
			if(!bipwd.equals(pBiPwd)){
%>
				<script>
					alert("<%=pBinum%>번 게시물은 비밀번호가 틀렸어 임마!!");
					history.back();
				</script>
<%
			}
		}
	}catch(Exception e){
		System.out.println(e);
	}finally{
		if(ps!=null){
			ps.close();
			ps = null;
		}
		DBConn.closeCon();
	}

%>
<body>
<form method="get" action="<%=rootPath%>/board/board_modify_ok.jsp" >
제목 : <input type="text" name="bititle" id="bititle" value="<%=bititle%>"/><br/>
내용 : <textarea name="bicontent" id="bicontent"><%=bicontent%></textarea><br/>
글쓴이 : <input type="text" name="creusr" id="creusr" value="<%=creusr%>"/><br/>
비밀번호 : <input type="password" name="bipwd" id="bipwd" value="<%=bipwd%>"/><br/>
<input type="hidden" value="<%=binum%>" name="binum"/>
<input type="submit" value="수정하기"/>
</form>
</body>
</html>