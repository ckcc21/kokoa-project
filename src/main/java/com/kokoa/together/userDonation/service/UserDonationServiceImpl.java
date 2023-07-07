package com.kokoa.together.userDonation.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kokoa.together.mapper.userInfo.UserInfoMapper;
import com.kokoa.together.mapper.userdonation.UserDonationMapper;
import com.kokoa.together.userDonation.DTO.UserDonationDTO;

@Service
public class UserDonationServiceImpl implements UserDonationService {
	@Autowired
	UserDonationMapper mapper;
	
	@Autowired
	UserInfoMapper uim;

	public void userDonation(String id, Model model) {
		
		model.addAttribute("profileImage", uim.logChk(id).getUGen());
		
		List<UserDonationDTO> userDonationDTOList = mapper.donationList(id);
		String maskingId = id.replaceAll("(?<=.{3}).", "*");
		model.addAttribute("maskingId", maskingId);
		
		int directMoney = 0;
		int likeMoney = 0;
		int replyMoney = 0;
		int shareMoney = 0;
		for (UserDonationDTO dto : userDonationDTOList) {
			directMoney += dto.getDirectMoney();
			replyMoney += dto.getReplyMoney();
			shareMoney += dto.getShareMoney();
			likeMoney += dto.getLikeMoney();
		}
		likeMoney = likeMoney * 100;
		shareMoney = shareMoney * 100;
		replyMoney = replyMoney * 100;
		int attendMoney = replyMoney + shareMoney + likeMoney;
		int totalMoney = directMoney + attendMoney;

		String formatTotalMoney, formatDonateCount, formatDirectMoney, formatAttendMoney;
		DecimalFormat df = new DecimalFormat("###,###");
		formatTotalMoney = df.format(totalMoney);
		formatDonateCount = df.format(mapper.donateCount(id));
		formatDirectMoney = df.format(directMoney);
		formatAttendMoney = df.format(attendMoney);

		model.addAttribute("totalMoney", formatTotalMoney);
		model.addAttribute("donateCount", formatDonateCount);
		model.addAttribute("directMoney", formatDirectMoney);
		model.addAttribute("attendMoney", formatAttendMoney);
	}

	public List<UserDonationDTO> donationList(String id, String year, String means, Model model) {
		List<UserDonationDTO> list = new ArrayList<UserDonationDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");

		String maskingId = id.replaceAll("(?<=.{3}).", "*");
		model.addAttribute("maskingId", maskingId);

		switch (means) {
		case "0":
			if (year.equals("")) {
				return mapper.directMoneyList(id);
			} else {
				for (UserDonationDTO dto : mapper.directMoneyList(id)) {
					if (sdf.format(dto.getDate()).equals(year)) {
						list.add(dto);
					}
				}
			}
			return list;
		case "1":
			if (year.equals("")) {
				return mapper.attendMoneyList(id);
			} else {
				for (UserDonationDTO dto : mapper.attendMoneyList(id)) {
					if (sdf.format(dto.getDate()).equals(year)) {
						list.add(dto);
					}
				}
			}
			return list;
		default:
			if (year.equals("")) {
				return mapper.donationList(id);
			} else {
				for (UserDonationDTO dto : mapper.donationList(id)) {
					if (sdf.format(dto.getDate()).equals(year)) {
						list.add(dto);
					}
				}
			}
			return list;
		}
	}
	
	public void donationInsert(UserDonationDTO dto) {
		String id = dto.getId();
		String title = dto.getTitle();
		int directMoney = dto.getDirectMoney();
		int likeMoney = dto.getLikeMoney();
		int replyMoney = dto.getReplyMoney();
		int shareMoney = dto.getShareMoney();

		mapper.donationInsert(id, title, directMoney, likeMoney, replyMoney, shareMoney);
		
	}
	
	public void likeMoney(String id, String title) {
		List<UserDonationDTO> list = mapper.likeMoneyCheck(id, title);
		System.out.println(list);
		System.out.println(list.size());
		
		if(list.size() > 0) {
			mapper.likeCancel(id, title);
		} else {
			mapper.likeInsert(id, title);
		}
		
	}
}