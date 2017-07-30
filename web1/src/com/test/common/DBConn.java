package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

	private static Connection con;

	public static Connection getCon() throws ClassNotFoundException, SQLException {
		if (con == null) {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/iot", "root", "qnrkr327");
			con.setAutoCommit(false);
		}
		return con;
	}
	public static void closeCon() throws SQLException {
		System.out.println(con);
		if (con != null) {
			con.close();
			con = null;
		}
		System.out.println(con);
	}
}
