package com.kokoa.together.mapper.comment;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kokoa.together.comment.dto.CommentDTO;

@Repository
public interface CommentMapper {
	public int commentDonationCheck(@Param("id") String id, @Param("fundraisingNum") int fundraisingNum);

	public void commentInsert(CommentDTO dto);

	public List<CommentDTO> commentLoad(@Param("id") String id, @Param("fundraisingNum") int fundraisingNum,
			@Param("start") int start, @Param("end") int end);

	public int commentCount(int num);

	public int restCommentCheck(@Param("fundraisingNum") int fundraisingNum, @Param("start") int start,
			@Param("end") int end);
	
	public int commentLikeInsert(@Param("id") String id,@Param("commentNum") int commentNum);
	
	public int commentLikeDelete(@Param("id") String id,@Param("commentNum") int commentNum);

}
