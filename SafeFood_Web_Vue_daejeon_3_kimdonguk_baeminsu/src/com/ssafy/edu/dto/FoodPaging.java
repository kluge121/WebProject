package com.ssafy.edu.dto;

import java.util.ArrayList;
import java.util.List;

public class FoodPaging {

	List<Food> list = new ArrayList<>();
	private int page;
	private int startPage;
	private int endPage;
	private int totalPage;
	
	
	public FoodPaging() {
		super();
	}


	public FoodPaging(List<Food> list, int page, int startPage, int endPage, int totalPage) {
		super();
		this.list = list;
		this.page = page;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
	}


	public List<Food> getList() {
		return list;
	}


	public void setList(List<Food> list) {
		this.list = list;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	
	
	

	

}
