package com.kokoa.together.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kokoa.together.mapper.notice.NoticeMapper;
import com.kokoa.together.notice.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeMapper mapper;

	public void noticeLoad(int num, Model model) {
		model.addAttribute("noticeDTO", mapper.noticeLoad(num));
	}
	
	public List<NoticeDTO> noticeList(int tit, int page) {
		int tit1, tit2;
		if (tit == 0) {
			tit1 = 1;
			tit2 = 3;
		} else {
			tit1 = tit;
			tit2 = tit;
		}
		int noticeCount = 10;
		int end = page * noticeCount;
		int start = end + 1 - noticeCount;
		return mapper.noticeList(tit1, tit2, start, end);
	}

	public int noticeWriteSave(NoticeDTO noticeDTO) {
		int result = 0;
		try {
			result = mapper.noticeWriteSave(noticeDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void noticeFix(int fix, int num) {
		mapper.noticeFix(fix, num);
	}

	public void noticeDelete(int num) {
		mapper.noticeDelete(num);
	}

}
