package com.kokoa.together.comment.service;

import java.util.List;

import com.kokoa.together.comment.dto.CommentDTO;

public interface CommentService {

	public int commentInsert(CommentDTO dto);
	
	public List<CommentDTO> commentLoad(String id, int fundraisingNum, int num, int page);
	
	public int commentLike(String id, int liked, int commentNum);
	
}
