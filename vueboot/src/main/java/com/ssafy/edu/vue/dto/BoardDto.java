package com.ssafy.edu.vue.dto;

import java.io.Serializable;

public class BoardDto implements Serializable{
	private int number;
	private String user_id;
	private String title;
	private String content;
	private String date;
	private int click;
	public BoardDto() {
		super();
	}
	public BoardDto(int number, String user_id, String title, String content, String date, int click) {
		super();
		this.number = number;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.click = click;
	}
	@Override
	public String toString() {
		return "BoardDto [number=" + number + ", user_id=" + user_id + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", click=" + click + "]";
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
}
