package report.limchanho.r0013;

public class Plus implements InterfaceExam {

	public String getString() {
		return "Exam의 getString()함수 호출!!";
	}

	public void setString(String str) {
		System.out.println("Exam 의 SetString()함수 호출!!" + str);
	}

	public int cal(int a, int b) {
		return a - b;
	}
}
