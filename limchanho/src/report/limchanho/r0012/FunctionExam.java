package report.limchanho.r0012;

import java.util.Scanner;

public class FunctionExam {
	int[] arrNum = new int[5];
	Scanner scan = new Scanner(System.in);
	int num = 0;

	int getNumberFromString() {

		try {
			System.out.println((num += 1) + "번째 숫자를 넣어 주세요.");
			return Integer.parseInt(scan.nextLine());
		} catch (Exception e) {// Exception?
			num--;
			System.out.println("누가 문자 넣으래!!");
			return getNumberFromString();
		}

	}

	public static void main(String[] args) {
		FunctionExam ee2 = new FunctionExam();
		for (int i = 0; i < ee2.arrNum.length; i++) {
			ee2.arrNum[i] = ee2.getNumberFromString();
		}
		for (int i = 0; i < ee2.arrNum.length; i++) {
			System.out.println(ee2.arrNum[i]);
		}
	}

}
