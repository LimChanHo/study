package report.limchanho.r0012;

import java.util.ArrayList;
import java.util.HashMap;

public class DataTypeExam {

	public static void main(String[] args) {
		ArrayList<Integer> list1 = new ArrayList<Integer>();
		list1.add(1);
		list1.add(2);
		ArrayList<String> list2 = new ArrayList<String>();
		list2.add("가");
		list2.add("가");
		ArrayList<String> list3 = new ArrayList<String>();//ArrayList<String>list3 (다이아몬드 안에 들은거까지 데이터타입)
		list3.add("a");                                   //스트링은 그냥 쓸 수 있는게 자바에서 new를 해주니까
		list3.add("b");

		HashMap<Object, ArrayList> hm = new HashMap<Object, ArrayList>();
		hm.put(list1.get(0), list1);
		hm.put(list2.get(0), list2);
		hm.put(list3.get(0), list3);

		System.out.println(hm);

	}

}
