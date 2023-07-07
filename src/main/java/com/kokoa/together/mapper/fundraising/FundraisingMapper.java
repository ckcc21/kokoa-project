package com.kokoa.together.mapper.fundraising;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kokoa.together.fundraising.dto.FundraisingDTO;

@Repository
public interface FundraisingMapper {
	
	public FundraisingDTO fundraisingLoad(int num);

	public List<FundraisingDTO> newFundraisingList(@Param("topicId1") int topicId1, @Param("topicId2") int topicId2,
			@Param("start") int start, @Param("end") int end);
	
	public List<FundraisingDTO> closingFundraisingList(@Param("topicId1") int topicId1, @Param("topicId2") int topicId2,
			@Param("start") int start, @Param("end") int end);

	public int writeSave(FundraisingDTO dto);

}
