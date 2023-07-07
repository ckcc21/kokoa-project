package com.kokoa.together.userDonation.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kokoa.together.userDonation.DTO.UserDonationDTO;

public interface UserDonationService {

	public void userDonation(String id, Model model);
	
	public List<UserDonationDTO> donationList(String id, String year, String means, Model model);
	
	public void donationInsert(UserDonationDTO dto);
	
	public void likeMoney(String id, String title);
}
