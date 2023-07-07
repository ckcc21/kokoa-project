package com.kokoa.together.donation.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kokoa.together.common.SessionName;
import com.kokoa.together.donation.dto.DonationDTO;
import com.kokoa.together.donation.service.DonationService;

@RestController
public class DonationController {
	
	@Autowired
	DonationService ds;
	
	@PostMapping(value = "donationInsert.do", produces = "application/json; charset=utf-8")
	public DonationDTO donationInsert(@RequestBody Map<String, Integer> map, HttpSession session) {
		
		DonationDTO dto = new DonationDTO();
		dto.setId((String) session.getAttribute(SessionName.LOGIN));
		dto.setNum(map.get("fundraisingNum"));
		dto.setDonationDirect(map.get("donationDirect"));
		dto.setDonationCheer(map.get("donationCheer"));
		dto.setDonationShare(map.get("donationShare"));
		dto.setDonationComment(map.get("donationComment"));
		
		ds.donationInsert(dto);
		
		return ds.fundraisingDonation(dto.getNum());
		
	}
}
