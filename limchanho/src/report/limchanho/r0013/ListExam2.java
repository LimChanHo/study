package report.limchanho.r0013;

import java.util.List;

import com.google.common.collect.Lists;	

public class ListExam2 {

	public void arrayToListWithGuava() {
		Integer[] sourceArray = { 0, 1, 2, 3, 4, 5 };
		List<Integer> targetList = Lists.newArrayList(sourceArray);
	}

	public static void main(String[] args) {
		ListExam2 le = new ListExam2();
		le.arrayToListWithGuava();

	}
}

