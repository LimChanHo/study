package report.limchanho.r0013;

public class User {
	private InterfaceExam ie;

	User(String operator) {
		if (operator.equals("+")) {
			ie = new Minus();
		} else if (operator.equals("-")) {
			ie = new Plus();
		} else {
			System.out.println("넘마 연산자 잘못입력했어 임마!!");
		}

	}

	public InterfaceExam getInterfaceExam() {
		return ie;
	}

	public static void main(String[] args) {
		User u = new User("+");
		InterfaceExam ie = u.getInterfaceExam();
		int result = ie.cal(3, 4);
		System.out.println(result);

		u = new User("-");
		ie = u.getInterfaceExam();
		result = ie.cal(3, 4);
		System.out.println(result);
	}
}
