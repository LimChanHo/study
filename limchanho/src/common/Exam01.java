package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class Exam01 {

	public List<String> getUserIDLists(String name){
		//String result = "";
		List<String> userlist = new ArrayList<String>();
		try {
			Connection con = DBConn2.getCon();			
			String sql = "select ID,PWD,NAME,age from user";
			if(!name.equals("")){
				sql += " WHERE NAME=?";	//sql += " WHERE NAME='" + name + "'";
			}
			
			PreparedStatement prestmt = con.prepareStatement(sql);
			
			if(!name.equals("")){
				prestmt.setString(1, name);
			}
			ResultSet rs = prestmt.executeQuery();
			while (rs.next()) {		
				userlist.add(rs.getString(1) + "," + rs.getString(2) + "," + rs.getString(3) + "," +rs.getInt(4));
			}			
			DBConn2.closeCon();
			return userlist;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean insertUser(){
		try {
			Connection con = DBConn2.getCon();
			Scanner scan = new Scanner(System.in);
			HashMap<String, String> hm = new HashMap<String, String>();
			System.out.println("id를 입력해주세요");
			hm.put("id", scan.nextLine());
			System.out.println("pwd를 입력해주세요");
			hm.put("pwd", scan.nextLine());
			System.out.println("name을 입력해주세요");
			hm.put("name", scan.nextLine());
			System.out.println("나이를 입력해주세요");
			hm.put("age", scan.nextLine());
			
			String sql = "insert into user(id, pwd, name, age)"
					+ "values(?,?,?,?)";
			PreparedStatement prestmt = con.prepareStatement(sql);
			prestmt.setString(1, hm.get("id"));
			prestmt.setString(2, hm.get("pwd"));
			prestmt.setString(3, hm.get("name"));
			prestmt.setString(4, hm.get("age"));
			int result = prestmt.executeUpdate();
			DBConn2.closeCon();
			if(result==1){
				return true;
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean deleteUser(int num){
		try {
			Connection con = DBConn2.getCon();			
			String sql = "delete from user where num=" + num;
			PreparedStatement prestmt = con.prepareStatement(sql);
			int result = prestmt.executeUpdate();
			DBConn2.closeCon();
			if(result>0){
				return true;
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String[] args){
		Exam01 e = new Exam01();
//		if(e.insertUser()){
//			System.out.println("오~ 잘들어갔네요 유저테이블에!!");
//		}
//		
//		boolean isDel = e.deleteUser(1);
//		if(isDel){
//			System.out.println("유저테이블에 잘 삭제가 됬네요!!");
//		}
		List<String> userList = e.getUserIDLists("");
		for(int i=0;i<userList.size();i++){
			System.out.println(userList.get(i));
		}
	}
}
