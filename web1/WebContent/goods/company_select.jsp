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
ArrayList<Map<String, String>> calList = new ArrayList<Map<String, String>>();
try{
	con = DBConn.getCon();
    
	String sql = "";
	
	if(vinum!=0){
		sql = "select* from vendor_info vi,goods_info gi where gi.VINUM=vi.vinum and vi.vinum= ?";
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
			hm1.put("vinum", rs.getString("vinum"));
			hm1.put("viname", rs.getString("viname"));
			hm1.put("videsc", rs.getString("videsc"));
			hm1.put("viaddress", rs.getString("viaddress"));
			hm1.put("viphone", rs.getString("viphone"));
			hm1.put("giname", rs.getString("giname"));
			hm1.put("gidesc", rs.getString("gidesc"));
			hm1.put("gicredat", rs.getString("gicredat"));
			hm1.put("gicretim", rs.getString("gicretim"));
			calList.add(hm1);
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