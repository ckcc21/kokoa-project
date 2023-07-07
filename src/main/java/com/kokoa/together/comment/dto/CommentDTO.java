package com.kokoa.together.comment.dto;

import java.sql.Timestamp;

public class CommentDTO {

	private int commentNum, fundraisingNum, totalLike, liked, donationDirect, donationComment;
	private String id, content, profileImg;
	private Timestamp date;

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getFundraisingNum() {
		return fundraisingNum;
	}

	public void setFundraisingNum(int fundraisingNum) {
		this.fundraisingNum = fundraisingNum;
	}

	public int getTotalLike() {
		return totalLike;
	}

	public void setTotalLike(int totalLike) {
		this.totalLike = totalLike;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getDonationDirect() {
		return donationDirect;
	}

	public void setDonationDirect(int donationDirect) {
		this.donationDirect = donationDirect;
	}

	public int getDonationComment() {
		return donationComment;
	}

	public void setDonationComment(int donationComment) {
		this.donationComment = donationComment;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}
