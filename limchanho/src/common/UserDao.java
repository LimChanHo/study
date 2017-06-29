package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class UserDao {
	public List<HashMap> doSelect(String sql) {
		List<HashMap> userlist = new ArrayList<HashMap>();
		try {
			Connection con = DBConn2.getCon();
			PreparedStatement prestmt = con.prepareStatement(sql);
			//"select *  from user";
			ResultSet rs = prestmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				HashMap hm = new HashMap();
				int colCount = rsmd.getColumnCount();
				for(int i=1;i<=colCount;i++){
					String colName = rsmd.getColumnName(i);
					hm.put(colName, rs.getString(colName));
				}
				userlist.add(hm);
			}
			DBConn2.closeCon();
			return userlist;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	public boolean doInsert(String sql, HashMap<String, String> hm) {
		try {
			Connection con = DBConn2.getCon();
			String[] keys = hm.keySet().toArray(new String[hm.size()]);
			for(int i=0;i<keys.length;i++){
				sql += keys[i] + ",";
			}
			sql = sql.substring(0, sql.length()-1);
			sql += ") values(";

			for(int i=0;i<keys.length;i++){
				sql += "?,";
			}
			sql = sql.substring(0, sql.length()-1);
			sql += ")";
			PreparedStatement prestmt = con.prepareStatement(sql);
			for(int i=0;i<keys.length;i++){
				prestmt.setString(i+1, hm.get(keys[i]));
			}
			int result = prestmt.executeUpdate();
			DBConn2.closeCon();
			if (result == 1) {
				return true;
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static void main(String[] args){
		UserDao ud = new UserDao();
//		String sql = "select * from user order by age desc";
//		List<HashMap> userList = ud.doSelect(sql);
//		System.out.println(" = 유저 리스트 = ");
//		for(HashMap hm : userList){
//			System.out.println(hm);
//		}
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", "green");
		hm.put("pwd", "green");
		hm.put("name", "녹길동");
		hm.put("age", "21");
		hm.put("class_num", "3");
		

		String sql = "insert into user_info(";
		//ud.doInsert(sql, hm);
		System.out.println(sql);
		
		sql = "insert into class_info(";
		hm = new HashMap<String, String>();
		hm.put("class_name", "미술반");
		ud.doInsert(sql, hm);
//		while(it.hasNext()){
//			String key = (String) it.next();
//			System.out.println(key);
//		}
	}
}
