<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*"%>
<%
Gson g = new Gson();
	HashMap<String, String> hm2 = g.fromJson(request.getReader(), HashMap.class);
	Connection con = null;
	PreparedStatement ps = null;
	ArrayList<Map<String, String>> goodsList = new ArrayList<Map<String, String>>();

	try {
		con = DBConn.getCon();
		String sql = "select * from vendor_info";

		ps = con.prepareStatement(sql);	
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Map<String, String> hm = new HashMap<String, String>();
			hm.put("vinum", rs.getString("vinum"));
			hm.put("viname", rs.getString("viname"));
			goodsList.add(hm);
		}

	} catch (Exception e) {
		System.out.println(e);
	} finally {
		if (ps != null) {
			ps.close();
			ps = null;
		}
		DBConn.closeCon();
	}
	String json = g.toJson(goodsList);
	out.print(json);
%>