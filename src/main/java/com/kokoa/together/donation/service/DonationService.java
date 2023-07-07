package com.kokoa.together.donation.service;

import com.kokoa.together.donation.dto.DonationDTO;

public interface DonationService {

	public void donationInsert(DonationDTO dto);
	
	public DonationDTO fundraisingDonation(int num);

}
