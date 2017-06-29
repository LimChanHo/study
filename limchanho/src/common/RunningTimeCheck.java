package common;

import java.util.ArrayList;
import java.util.Vector;

public class RunningTimeCheck {
	
	public static void main(String[] args){
		long startTime = System.currentTimeMillis();
		Vector v = new Vector();
		for(int i=0;i<1000000;i++){
			v.add(i);
		}

		for(int i=0;i<1000000;i++){
			v.get(i);
		}
		long endTime   = System.currentTimeMillis();
		long totalTime = endTime - startTime;
		System.out.println(totalTime);
		startTime = System.currentTimeMillis();
		ArrayList al = new ArrayList();
		for(int i=0;i<1000000;i++){
			al.add(i);
		}
		for(int i=0;i<1000000;i++){
			al.get(i);
		}
		endTime   = System.currentTimeMillis();
		totalTime = endTime - startTime;
		System.out.println(totalTime);
		
	}
}