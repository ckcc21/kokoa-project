package com.kokoa.together.notice.dto;

import java.sql.Date;

public class NoticeDTO {
	private int num, fix, tit;
	private String title, content;
	private Date date;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getFix() {
		return fix;
	}

	public void setFix(int fix) {
		this.fix = fix;
	}

	public int getTit() {
		return tit;
	}

	public void setTit(int tit) {
		this.tit = tit;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
