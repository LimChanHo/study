package common;

public class DBConn {
	static int a = 1;

	static int getInt() {
		try {
			int a = Integer.parseInt("str");
			return a;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static void main(String[] args) {
		DBConn dbc = new DBConn();
		int a = dbc.getInt();
	}
}
