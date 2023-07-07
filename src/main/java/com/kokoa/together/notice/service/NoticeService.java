package com.kokoa.together.notice.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kokoa.together.notice.dto.NoticeDTO;

public interface NoticeService {

	public void noticeLoad(int num, Model model);
	
	public List<NoticeDTO> noticeList(int tit, int page);

	public int noticeWriteSave(NoticeDTO noticeDTO);

	public void noticeFix(int fix, int num);

	public void noticeDelete(int num);
}
