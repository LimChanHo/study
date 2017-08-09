package com.test.dto;

public class Page {


	private int nowPage = 1;

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	@Override
	public String toString() {
		return "Page [nowPage=" + nowPage + "]";
	}
	
}
