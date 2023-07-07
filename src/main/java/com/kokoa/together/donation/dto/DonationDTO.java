package com.kokoa.together.donation.dto;

import java.sql.Date;

public class DonationDTO {

	private int num, donationDirect, donationCheer, donationShare, donationComment, donationTotal, donationTotalCount,
			donationParticipate, donationParticipateCount, sumDirect, sumDirectCount, sumCheer, sumCheerCount, sumShare,
			sumShareCount, sumComment, sumCommentCount, goal, commentCount;
	private String id;
	private Date date;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getDonationDirect() {
		return donationDirect;
	}

	public void setDonationDirect(int donationDirect) {
		this.donationDirect = donationDirect;
	}

	public int getDonationCheer() {
		return donationCheer;
	}

	public void setDonationCheer(int donationCheer) {
		this.donationCheer = donationCheer;
	}

	public int getDonationShare() {
		return donationShare;
	}

	public void setDonationShare(int donationShare) {
		this.donationShare = donationShare;
	}

	public int getDonationComment() {
		return donationComment;
	}

	public void setDonationComment(int donationComment) {
		this.donationComment = donationComment;
	}

	public int getDonationTotal() {
		return donationTotal;
	}

	public void setDonationTotal(int donationTotal) {
		this.donationTotal = donationTotal;
	}

	public int getDonationTotalCount() {
		return donationTotalCount;
	}

	public void setDonationTotalCount(int donationTotalCount) {
		this.donationTotalCount = donationTotalCount;
	}

	public int getDonationParticipate() {
		return donationParticipate;
	}

	public void setDonationParticipate(int donationParticipate) {
		this.donationParticipate = donationParticipate;
	}

	public int getDonationParticipateCount() {
		return donationParticipateCount;
	}

	public void setDonationParticipateCount(int donationParticipateCount) {
		this.donationParticipateCount = donationParticipateCount;
	}

	public int getSumDirect() {
		return sumDirect;
	}

	public void setSumDirect(int sumDirect) {
		this.sumDirect = sumDirect;
	}

	public int getSumDirectCount() {
		return sumDirectCount;
	}

	public void setSumDirectCount(int sumDirectCount) {
		this.sumDirectCount = sumDirectCount;
	}

	public int getSumCheer() {
		return sumCheer;
	}

	public void setSumCheer(int sumCheer) {
		this.sumCheer = sumCheer;
	}

	public int getSumCheerCount() {
		return sumCheerCount;
	}

	public void setSumCheerCount(int sumCheerCount) {
		this.sumCheerCount = sumCheerCount;
	}

	public int getSumShare() {
		return sumShare;
	}

	public void setSumShare(int sumShare) {
		this.sumShare = sumShare;
	}

	public int getSumShareCount() {
		return sumShareCount;
	}

	public void setSumShareCount(int sumShareCount) {
		this.sumShareCount = sumShareCount;
	}

	public int getSumComment() {
		return sumComment;
	}

	public void setSumComment(int sumComment) {
		this.sumComment = sumComment;
	}

	public int getSumCommentCount() {
		return sumCommentCount;
	}

	public void setSumCommentCount(int sumCommentCount) {
		this.sumCommentCount = sumCommentCount;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
