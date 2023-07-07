package com.kokoa.together.fundraising.service;

import java.sql.Date;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kokoa.together.donation.dto.DonationDTO;
import com.kokoa.together.fundraising.dto.FundraisingDTO;
import com.kokoa.together.mapper.comment.CommentMapper;
import com.kokoa.together.mapper.donation.DonationMapper;
import com.kokoa.together.mapper.fundraising.FundraisingMapper;

@Service
public class FundraisingServiceImpl implements FundraisingService {

	@Autowired
	FundraisingMapper mapper;
	@Autowired
	DonationMapper dm;
	@Autowired
	CommentMapper cm;
	@Autowired
	FundraisingFileService ffs;

	public void fundraisingLoad(int num, Model model) {
		model.addAttribute("fundraisingDTO", mapper.fundraisingLoad(num));	
		int commentCount = cm.commentCount(num);
		DonationDTO donationDTO = dm.fundraisingDonation(num);
		donationDTO.setCommentCount(commentCount);
		model.addAttribute("donationDTO", donationDTO);
		
	}

	public List<FundraisingDTO> fundraisingList(int sort, int topicId, int page, Model model) {
		int topicId1, topicId2;
		if (topicId == 0) {
			topicId1 = 1;
			topicId2 = 4;
		} else {
			topicId1 = topicId;
			topicId2 = topicId;
		}
		int fundraisingCount = 20;
		int end = page * fundraisingCount;
		int start = end + 1 - fundraisingCount;

		if (sort == 2) {
			return mapper.closingFundraisingList(topicId1, topicId2, start, end);
		} else {
			System.out.println(start);
			System.out.println(end);
			return mapper.newFundraisingList(topicId1, topicId2, start, end);
		}
	}

	public String writeSave(MultipartHttpServletRequest mhsr, HttpServletRequest request, String id) {
		FundraisingDTO dto = new FundraisingDTO();
		dto.setProposer(mhsr.getParameter("proposer"));
		int goal = Integer.parseInt(mhsr.getParameter("goal"));
		dto.setGoal(goal);
		int topicId = Integer.parseInt(mhsr.getParameter("topicId"));
		dto.setTopicId(topicId);

		Date endDate = Date.valueOf(mhsr.getParameter("endDate"));
		dto.setEndDate(endDate);

		dto.setTitle(mhsr.getParameter("title"));
		dto.setContent(mhsr.getParameter("content"));

		MultipartFile file = mhsr.getFile("img");
		if (file.getSize() != 0) {
			dto.setImg(ffs.saveFile(file));
		} else {
			dto.setImg("nan");
		}

		int result = 0;
		result = mapper.writeSave(dto);
		String message = null, url = null;
		if (result == 1) {
			dm.fundraisingCreate(id);
			message = "모금함이 개설되었습니다.";
			url = request.getContextPath() + "/fundraisings/now";
		} else {
			message = "문제가 발생하였습니다.";
			url = request.getContextPath() + "/fundraisings/write";
		}

		return ffs.getMessage(message, url);

	}
}
