package com.kokoa.together.comment.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kokoa.together.comment.dto.CommentDTO;
import com.kokoa.together.comment.service.CommentService;
import com.kokoa.together.common.SessionName;

@RestController
public class CommentController {

	@Autowired
	CommentService cs;

	@PostMapping(value = "commentInsert.do", produces = "application/json; charset=utf-8")
	public String commentInsert(@RequestBody Map<String, Object> map, HttpSession session) {

		CommentDTO dto = new CommentDTO();
		dto.setId((String) session.getAttribute(SessionName.LOGIN));
		dto.setFundraisingNum(Integer.parseInt((String) map.get("fundraisingNum")));
		dto.setContent((String) map.get("content"));
		dto.setDonationDirect(Integer.parseInt(String.valueOf(map.get("donationDirect"))));

		return "{\"fundraisingNum\" : " + dto.getFundraisingNum() + ", \"donationComment\" : " + cs.commentInsert(dto)
				+ "}";
	}

	@PostMapping(value = "commentLoad.do", produces = "application/json; charset=utf-8")
	public List<CommentDTO> commentLoad(@RequestBody Map<String, Integer> number, HttpSession session) {
		String id = (String) session.getAttribute(SessionName.LOGIN);
		int fundraisingNum = number.get("fundraisingNum");
		int num = number.get("num");
		int page = number.get("page");

		return cs.commentLoad(id, fundraisingNum, num, page);

	}

	@PostMapping(value = "restCommentCheck.do", produces = "application/json; charset=utf-8")
	public List<CommentDTO> restCommentCheck(@RequestBody Map<String, Integer> fundraisingNumAndPage) {
		int fundraisingNum = fundraisingNumAndPage.get("fundraisingNum");
		int page = fundraisingNumAndPage.get("page");
		return cs.commentLoad(null, fundraisingNum, 10, page);
	}
	
	@PostMapping(value = "commentLike.do", produces = "application/json; charset=utf-8")
	public int commentLike(@RequestBody Map<String, Integer> likedAndCommentNum, HttpSession session) {
		String id = (String) session.getAttribute(SessionName.LOGIN);
		int liked = likedAndCommentNum.get("liked");
		int commentNum = likedAndCommentNum.get("commentNum");
		
		return cs.commentLike(id, liked, commentNum);
	}
}
