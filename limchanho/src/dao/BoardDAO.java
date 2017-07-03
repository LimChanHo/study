package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import common.DBConn2;

public class BoardDAO {
	// board테이블에 update, insert, delete, select 하는 함수를 각각 4개 생성해주세요
	// 모두 단일 작업임으로 한개의 함수마다 commit이 이러우져야 하며
	// 만약 에러날경우 rollback이 되면 됩니다.
	Connection con;
	public void setConnection() throws ClassNotFoundException, SQLException{
		con = DBConn2.getCon();
	}
	
	public boolean insertBoard() throws SQLException{
		String sql = "insert into board(title, content, writer, reg_Date)values('게시판제목3','게시판내용3',4,now())";
		Statement st = con.createStatement();
		int result = st.executeUpdate(sql);
		if(result==1){
			st.close();
			st = null;
			return true;
		}
		return false;
	}
	
	public boolean updateBoard() throws SQLException{
		String sql = "update board1 set title='으하하하하' where num='1'";
		Statement st = con.createStatement();
		int result = st.executeUpdate(sql);
		if(result==1){
			st.close();
			st = null;
			return true;
		}
		return false;
	}
	
	public static void main(String[] args){
		BoardDAO bdao = new BoardDAO();
		try {
			bdao.setConnection();
			bdao.insertBoard();
			bdao.updateBoard();
			bdao.con.commit();
			System.out.println("정상동작 했고 저장까지 완료 했수다!!");
		} catch (ClassNotFoundException | SQLException e) {
			try {
				bdao.con.rollback();
				System.out.println("뭔진 모르겠는데 에러났어 그래서 원복했수다!!");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
}
