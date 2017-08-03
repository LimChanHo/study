<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*"%>
<%
	 Gson g = new Gson();
	 HashMap<String,String> hm = g.fromJson(request.getReader(), HashMap.class);
	String numStr = "";
	if(hm!=null){
		numStr = hm.get("num1");
	}
	int num1 = Integer.parseInt(numStr);
	Connection con = null;
	PreparedStatement ps = null;
	ArrayList<Map<String, String>> calList = new ArrayList<Map<String, String>>();
	try{
		con = DBConn.getCon();
		String sql = "select jtnum, jttext from json_test where 1=1";

		if(numStr!=null && !numStr.equals("")){
			sql += " and jtnum = ?";
		}
		ps = con.prepareStatement(sql);
		if(numStr!=null && !numStr.equals("")){
			ps.setInt(1,num1);
		}
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Map<String, String>rhm = new HashMap<String, String>();
			rhm.put("num1", rs.getString("jtnum"));
			rhm.put("text", rs.getString("jttext"));
			calList.add(rhm);
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

String json = g.toJson(calList);
System.out.println(json);
out.print(json);
	%>