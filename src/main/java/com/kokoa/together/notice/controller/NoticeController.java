package com.kokoa.together.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kokoa.together.common.SessionName;
import com.kokoa.together.notice.dto.NoticeDTO;
import com.kokoa.together.notice.service.NoticeService;

@Controller
public class NoticeController implements SessionName {

	@Autowired
	NoticeService ns;

	@GetMapping("notices")
	public String notice() {
		return "notice/notice";
	}

	@GetMapping("notices/{notice_num}")
	public String noticeLoad(@PathVariable("notice_num") int num, Model model) {
		ns.noticeLoad(num, model);
		return "notice/notice_content";
	}

	@PostMapping(value = "notices/noticeListSearch.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<NoticeDTO> noticeList(@RequestBody Map<String, Integer> titAndPage) {
		int tit = titAndPage.get("tit");
		int page = titAndPage.get("page");
		return ns.noticeList(tit, page);
	}

	@GetMapping("noticeWrite")
	public String noticeWrite(HttpSession session) {
		String id = (String) session.getAttribute(LOGIN);
		if (id.equals("admin")) {
			return "notice/notice_write";
		} else {
			return "redirect:UserInfo/login";
		}
	}

	@PostMapping("noticeWriteSave")
	public String noticeWriteSave(NoticeDTO noticeDTO) {
		int result = ns.noticeWriteSave(noticeDTO);
		if (result == 0) {
			return "redirect:noticeWrite";
		} else {
			return "redirect:notices";
		}
	}

	@PutMapping(value = "noticeFix.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String noticeFix(@RequestBody Map<String, Integer> fixNum) {
		int fix = fixNum.get("fix");
		int num = fixNum.get("num");
		ns.noticeFix(fix, num);
		if (fix == 0) {
			return "{\"execute\" : \"게시물이 고정되었습니다.\"}";
		} else {
			return "{\"execute\" : \"게시물 고정이 취소되었습니다.\"}";
		}
	}

	@PostMapping(value = "noticeDelete.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String noticeDelete(@RequestBody int num) {
		ns.noticeDelete(num);
		return "{\"execute\" : \"게시물이 삭제되었습니다.\"}";
	}
}
