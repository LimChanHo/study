package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn2 {

	private static Connection con;

	public static Connection getCon() throws ClassNotFoundException, SQLException {
		if (con == null) {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/iot_test", "root", "rjqnrdl82");
			con.setAutoCommit(false);
		}
		return con;
	}

	// public static void main(String[] args) {
	// try {
	// Connection con = DBConn2.getCon();
	// System.out.println("접속 됬네잉!!" + con);
	// DBConn2.closeCon();
	//
	// System.out.println("종료 됬다네잉~!" + con);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }

	public static void closeCon() throws SQLException {
		System.out.println(con);
		if (con != null) {
			con.close();
			con = null;
		}
		System.out.println(con);
	}
}
