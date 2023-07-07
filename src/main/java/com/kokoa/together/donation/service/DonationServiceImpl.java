package com.kokoa.together.donation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kokoa.together.donation.dto.DonationDTO;
import com.kokoa.together.mapper.comment.CommentMapper;
import com.kokoa.together.mapper.donation.DonationMapper;

@Service
public class DonationServiceImpl implements DonationService {
	
	@Autowired
	DonationMapper mapper;
	@Autowired
	CommentMapper cm;

	public void donationInsert(DonationDTO dto) {
		mapper.donationInsert(dto);
	}
	
	public DonationDTO fundraisingDonation(int num) {
		
		int commentCount = cm.commentCount(num);
		DonationDTO donationDTO = mapper.fundraisingDonation(num);
		donationDTO.setCommentCount(commentCount);
		
		return donationDTO;
	}

}
