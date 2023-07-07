package com.kokoa.together.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kokoa.together.comment.dto.CommentDTO;
import com.kokoa.together.donation.dto.DonationDTO;
import com.kokoa.together.mapper.comment.CommentMapper;
import com.kokoa.together.mapper.donation.DonationMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper mapper;
	@Autowired
	DonationMapper dm;

	public int commentInsert(CommentDTO dto) {

		int donationComment = mapper.commentDonationCheck(dto.getId(), dto.getFundraisingNum());

		DonationDTO donationDTO = new DonationDTO();
		donationDTO.setId(dto.getId());
		donationDTO.setNum(dto.getFundraisingNum());

		if (dto.getDonationDirect() == 0 && donationComment == 0) {
			dto.setDonationComment(1);
		}

		mapper.commentInsert(dto);

		return donationComment;

	}

	public List<CommentDTO> commentLoad(String id, int fundraisingNum, int num, int page) {
		int start, end;

		switch (num) {
		case 1:
			start = 1;
			end = 1;
			break;
		case 5:
			start = 1;
			end = 5;
			break;
		default:
			end = page * num - 5;
			start = end + 1 - num;
			break;
		}

		return mapper.commentLoad(id, fundraisingNum, start, end);
	}

	public int commentLike(String id, int liked, int commentNum) {
		if (liked == 1) {
			return mapper.commentLikeInsert(id, commentNum);
		} else {
			return mapper.commentLikeDelete(id, commentNum);
		}
	}
}
