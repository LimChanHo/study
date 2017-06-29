package common;

public class Exam {

	public static void main(String[] args) {
		DBConn abc = new DBConn();
		abc.a = 3;
		System.out.println(abc.a);
		System.out.println(DBConn.a);
		DBConn.a = 4;
		System.out.println(abc.a);
		abc = new DBConn();
		System.out.println(abc.a);
		int a = DBConn.getInt();

		Integer.parseInt("asdf");

	}

}
