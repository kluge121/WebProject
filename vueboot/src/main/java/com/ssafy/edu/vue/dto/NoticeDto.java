package com.ssafy.edu.vue.dto;

public class NoticeDto {
	private int num;
	private String title;
	private String content;
	private String date;
	private int viewcnt;
	private boolean activate;
	public NoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDto(int num, String title, String content, String date, int viewcnt, boolean activate) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.date = date;
		this.viewcnt = viewcnt;
		this.activate = activate;
	}
	@Override
	public String toString() {
		return "NoticeDto [num=" + num + ", title=" + title + ", content=" + content + ", date=" + date + ", viewcnt="
				+ viewcnt + ", activate=" + activate + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public boolean isActivate() {
		return activate;
	}
	public void setActivate(boolean activate) {
		this.activate = activate;
	}
}
