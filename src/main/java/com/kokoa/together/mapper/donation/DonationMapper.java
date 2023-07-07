package com.kokoa.together.mapper.donation;

import org.springframework.stereotype.Repository;

import com.kokoa.together.donation.dto.DonationDTO;

@Repository
public interface DonationMapper {
	
	public void fundraisingCreate(String id);

	public void donationInsert(DonationDTO dto);
	
	public DonationDTO fundraisingDonation(int num);
	
}
