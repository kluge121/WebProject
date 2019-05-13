package com.ssafy.edu.vue.dto;

import java.io.Serializable;

public class BoardAnswerDto implements Serializable{
	private int number;
	private String title;
	private String content;
	private String date;
	public BoardAnswerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardAnswerDto(int number, String title, String content, String date) {
		super();
		this.number = number;
		this.title = title;
		this.content = content;
		this.date = date;
	}
	@Override
	public String toString() {
		return "BoardAnswerDto [number=" + number + ", title=" + title + ", content=" + content + ", date=" + date
				+ "]";
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
