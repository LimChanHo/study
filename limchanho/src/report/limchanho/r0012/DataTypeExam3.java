package report.limchanho.r0012; //crud 크리에이트 리드 업로드 들리트

import java.util.ArrayList;
import java.util.HashMap;

public class DataTypeExam3 {

	public static void main(String[] args){
		ArrayList<HashMap> numList = new ArrayList<HashMap>();
		
		HashMap hm = new HashMap();
		hm.put("번호", "1");
		hm.put("제목", "게시물1");
		hm.put("작성자", "홍길동");
		numList.add(hm);
		
		HashMap hm1 = new HashMap();
		hm1.put("번호", "2");
		hm1.put("제목", "게시물2");
		hm1.put("작성자", "길정이");
		numList.add(hm1);
		
		HashMap hm2 = new HashMap();
		hm2.put("번호", "3");
		hm2.put("제목", "게시물3");
		hm2.put("작성자", "윤정이");
		numList.add(hm2);
		
		for(int i=0;i<numList.size();i++){
			HashMap resultHm = numList.get(i);
			//System.out.println(resultHm);
			System.out.print(resultHm.get("번호")+",");
			System.out.print(resultHm.get("제목")+",");
			System.out.println(resultHm.get("작성자"));
		}
	}

}
