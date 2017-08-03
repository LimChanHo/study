<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="java.sql.*" %>


<%
Gson g = new Gson();
HashMap<String,String> hm = g.fromJson(request.getReader(), HashMap.class);
String numStr1 = hm.get("num");

String result = "";
int num = Integer.parseInt(numStr1);
String text = hm.get("text");

Connection con  = null;
PreparedStatement ps = null;
int insertResult =0;
try{
	con  = DBConn.getCon();
	String sql = "insert into json_test(jtnum,jttext ) values(?,?)";
	ps = con.prepareStatement(sql);
	ps.setInt(1,num);
	ps.setString(2,text);
	insertResult = ps.executeUpdate();
	if(insertResult==1){
		con.commit();
		result = "입력 성공";
	}else{
		result = "입력 실패";
	}
}catch(Exception e){
	out.println(e);
}finally{
	ps.close();
	DBConn.closeCon();
}

HashMap<String, String> resulto = new HashMap<String,String>();
resulto.put("result", result);
String json = g.toJson(resulto);
out.print(json);
%>