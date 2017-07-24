package com.test.exam;

public class Exam {
	public void printObj(Object obj){
		System.out.println(obj);
	}
	public static void main(String[] args){
		Exam e = new Exam();
		e.printObj("new Element()");
		e.printObj(new Element());
	}
}
