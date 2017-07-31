<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.dto.UserInfo" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.*" %>

<%
JSONObject j = new Gson().fromJson(request.getReader(), JSONObject.class);
String id = (String)j.get("id");
String pwd = (String)j.get("pwd");
String result = "";
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
HashMap hm = new HashMap();
hm.put("login","ok");
hm.put("msg",result);
String json = new Gson().toJson(hm);
out.write(json);
%>