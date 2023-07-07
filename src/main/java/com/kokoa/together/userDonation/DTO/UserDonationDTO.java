package com.kokoa.together.userDonation.DTO;

import java.sql.Date;

public class UserDonationDTO {

	private int num, directMoney, likeMoney, replyMoney, shareMoney;
	private String id, title;
	private Date date;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getDirectMoney() {
		return directMoney;
	}

	public void setDirectMoney(int directMoney) {
		this.directMoney = directMoney;
	}

	public int getLikeMoney() {
		return likeMoney;
	}

	public void setLikeMoney(int likeMoney) {
		this.likeMoney = likeMoney;
	}

	public int getReplyMoney() {
		return replyMoney;
	}

	public void setReplyMoney(int replyMoney) {
		this.replyMoney = replyMoney;
	}

	public int getShareMoney() {
		return shareMoney;
	}

	public void setShareMoney(int shareMoney) {
		this.shareMoney = shareMoney;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
