package com.kokoa.together.mapper.userdonation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kokoa.together.userDonation.DTO.UserDonationDTO;

@Repository
public interface UserDonationMapper {
	public List<UserDonationDTO> donationList(String id);

	public int donateCount(String id);

	public List<UserDonationDTO> directMoneyList(String id);

	public List<UserDonationDTO> attendMoneyList(String id);

	public void donationInsert(@Param("id") String id, @Param("title") String title, @Param("directMoney") int directMoney, @Param("likeMoney") int likeMoney, @Param("replyMoney") int replyMoney, @Param("shareMoney") int shareMoney);

	public List<UserDonationDTO> likeMoneyCheck(@Param("id") String id, @Param("title") String title);
	
	public void likeInsert(@Param("id") String id, @Param("title") String title);

	public void likeCancel(@Param("id") String id, @Param("title") String title);
}
