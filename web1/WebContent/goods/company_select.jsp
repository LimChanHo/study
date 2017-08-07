<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.test.common.DBConn"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*"%>
<%
Gson g = new Gson();
HashMap<String,String> hm = g.fromJson(request.getReader(), HashMap.class);
String vinumStr = hm.get("vinum");
int vinum = Integer.parseInt(vinumStr);
Connection con = null;
PreparedStatement ps = null;
ArrayList<Map<String, String>> vendorList = new ArrayList<Map<String, String>>();
ArrayList<Map<String, String>> goodsList = new ArrayList<Map<String, String>>();
try{
	con = DBConn.getCon();
    
	String sql = "";
	
	if(vinumStr==null || vinumStr.equals("")){
		sql = "select* from vendor_info vi,goods_info gi where gi.VINUM=vi.vinum";
	}
	if(vinum==0){
		sql = "select* from vendor_info vi,goods_info gi where gi.VINUM=vi.vinum";
	}
	ps = con.prepareStatement(sql);
	if(vinum!=0){
		ps.setInt(1,vinum);
	}
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
			Map<String, String> hm1 = new HashMap<String, String>();
			hm1.put("viname", rs.getString("viname"));
			hm1.put("ginum", rs.getString("ginum"));
			hm1.put("giname", rs.getString("giname"));
			hm1.put("gidesc", rs.getString("gidesc"));
			vendorList.add(hm1);
	}
	sql = "select * from vendor_info";
	ps = con.prepareStatement(sql);	
	rs = ps.executeQuery();
	while (rs.next()) {
		Map<String, String> hm1 = new HashMap<String, String>();
		hm1.put("vinum", rs.getString("vinum"));
		hm1.put("viname", rs.getString("viname"));
		goodsList.add(hm1);
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
Map<String, List> hm2 = new HashMap<String, List>();
hm2.put("calList",vendorList);
hm2.put("goodsList",goodsList);

String json = g.toJson(hm2);
System.out.println(json);
out.print(json);
%>