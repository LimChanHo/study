<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.dto.BoardInfo" %>
<body>
<%-- <jsp:include page="/common/top.jsp" flush="fasle"></jsp:include> --%>
<div class="container">
      <div class="starter-template">
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
				alert("<%=pBinum%>번 게시물은 이미 지워졌습니다.");
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
				out.println("<script>");
				out.println("alert(" +pBinum + ");" );
				out.println("history.back();" );
				out.println("</script>");
				//out.println("< % JSP태그입니다 % >");
			}else{
%>
<form method="get" action="<%=rootPath%>/board/board_modify_ok.jsp" >
<table class='table table-bordered table-hover'>
<tr>
<td >제목 :</td><td><input class="form-control" type="text" name="bititle" id="bititle" value="<%=bititle%>"/></td>
</tr>
<tr>
<td>내용 :</td> <td><textarea class="form-control" name="bicontent" id="bicontent"><%=bicontent%></textarea></td>
</tr>
<tr>
<td>글쓴이 :</td> <td><input class="form-control" type="text" name="creusr" id="creusr" value="<%=creusr%>"/></td>
</tr>
<tr>
<td>비밀번호 :</td> <td><input class="form-control" type="password" name="bipwd" id="bipwd" value="<%=bipwd%>"/></td>
</tr>
<tr>
<td colspan="2"><input type="hidden" value="<%=binum%>" name="binum"/>
<input class="btn btn-lg btn-primary btn-block" type="submit" value="수정하기"/></td>
</tr>

</table>
</form>
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
</div>
</div>
<body>
</body>
</html>