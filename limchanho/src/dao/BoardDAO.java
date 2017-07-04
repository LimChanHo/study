package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBConn2;

public class BoardDAO { //다외워
	// board테이블에 update, insert, delete, select 하는 함수를 각각 4개 생성해주세요
		// 모두 단일 작업임으로 한개의 함수마다 commit이 이러우져야 하며
		// 만약 에러날경우 rollback이 되면 됩니다.
		Connection con;

		public void setConnection() throws ClassNotFoundException, SQLException {
			con = DBConn2.getCon();
		}

		public boolean insertBoard() throws SQLException {
			String sql = "insert into board(title, content, writer, reg_Date)values('게시판제목3','게시판내용3',4,now())";

			Statement st = con.createStatement();
			int result = st.executeUpdate(sql);
			if (result == 1) {
				st.close();
				st = null;
				return true;
			}
			return false;
		}

		public boolean updateBoard() throws SQLException {
			String sql = "update board set title='으하하하하' where num='2'";

			Statement st = con.createStatement();
			int result = st.executeUpdate(sql);
			if (result == 1) {
				st.close();
				st = null;
				return true;
			}
			return false;
		}

		public List<Map> selectBoard() throws SQLException {
			String sql = "select num, title, content, writer from board;";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			List boardList = new ArrayList();
			while (rs.next()) {
				HashMap hm = new HashMap();
				hm.put("num", rs.getString("num"));
				hm.put("title", rs.getString("title"));
				hm.put("content", rs.getString("content"));
				hm.put("writer", rs.getString("writer"));
				boardList.add(hm);
			}
			rs.close();
			rs = null;
			ps.close();
			ps = null;
			return boardList;
		}

		public static void main(String[] args) {
			BoardDAO bdao = new BoardDAO();
			try {
				bdao.setConnection();
				List<Map> boardList = bdao.selectBoard();
				CommentDAO dao = new CommentDAO();
				for(Map m : boardList){
					System.out.println(m);
					List<Map> commentList = dao.getCommentList(Integer.parseInt((String)m.get("num")));
					for(Map m2 : commentList){
						System.out.println(m2);
					}
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
	}
