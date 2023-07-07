package com.kokoa.together.mapper.notice;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kokoa.together.notice.dto.NoticeDTO;

@Repository
public interface NoticeMapper {

	public NoticeDTO noticeLoad(int num);
	
	public List<NoticeDTO> noticeList(@Param("tit1") int tit1, @Param("tit2") int tit2, @Param("start") int start,
			@Param("end") int end);

	public int noticeWriteSave(NoticeDTO noticeDTO);

	public void noticeFix(@Param("fix") int fix, @Param("num") int num);

	public void noticeDelete(int num);
}
