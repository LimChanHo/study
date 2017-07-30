<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.dto.UserInfo" %>
<%
String rootPath = request.getContextPath();
%>
<script src="<%=rootPath%>/js/jquery-3.2.1.js"></script>
<script src="<%=rootPath%>/ui/btsp3.7.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.7.7/css/bootstrap.min.css"/>
<body>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

String result = "";
String url = rootPath + "/user/login.jsp";
if(id!=null && pwd!=null){
	UserInfo ui = new UserInfo();
	ui.setUserId(id);
	ui.setUserPwd(pwd);
	
	Connection con = null;
	PreparedStatement ps = null;
	try{
		con = DBConn.getCon();
		String sql = "select username, age, address, hp1, hp2, hp3, userpwd from user_info where userid=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, ui.getUserId());
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String userPwd = rs.getString("userpwd");
			String userName = rs.getString("username");
			int age = rs.getInt("age");
			String address = rs.getString("address");
			String hp1 = rs.getString("hp1");
			String hp2 = rs.getString("hp2");
			String hp3 = rs.getString("hp3");
			if(userPwd.equals(ui.getUserPwd())){
				result =  "로그인 성공";
				url = rootPath + "/main.jsp";
				session.setAttribute("userid",ui.getUserId());
				session.setAttribute("username",userName);
				session.setAttribute("age",age);
				session.setAttribute("address",address);
				session.setAttribute("hp1",hp1);
				session.setAttribute("hp2",hp2);
				session.setAttribute("hp3",hp3);
			}else{
				result =  "비밀번호 틀렸어 임마!";
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
	
	if(result.equals("")){
		result =  "그런 아이디 없다잖아!!";
	}
}else{
	// 세션 초기화
	result = "로그아웃 되셨습니다.";
	session.invalidate();
}
%>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인 여부</h4>
        </div>
        <div class="modal-body">
          <p><%=result%></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<script>
$("#myModal").modal();
$("#myModal").on("hidden.bs.modal", function () {
	location.href="<%=url%>";
});
</script>
</body>
</html>