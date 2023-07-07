package com.kokoa.together.comment.dto;

public class LikeDTO {
	private int CommentNum, liked;
	private String id;

	public int getCommentNum() {
		return CommentNum;
	}

	public void setCommentNum(int commentNum) {
		CommentNum = commentNum;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
