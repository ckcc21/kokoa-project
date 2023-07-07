package com.kokoa.together.userDonation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kokoa.together.common.SessionName;
import com.kokoa.together.userDonation.DTO.UserDonationDTO;
import com.kokoa.together.userDonation.service.UserDonationService;

@Controller
public class UserDonationController implements SessionName {

	@Autowired
	UserDonationService uds;

	@RequestMapping("/my")
	public String my(HttpSession session, Model model) {
		String id = (String) session.getAttribute(LOGIN);
		uds.userDonation(id, model);
		return "myPage/myPage";
	}

	@RequestMapping(value = "/my/donations")
	public String donation(HttpSession session, Model model) {
		String id = (String) session.getAttribute(LOGIN);
		uds.userDonation(id, model);
		return "myPage/donation";
	}

	@RequestMapping(value = "/my/donationListSearch.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<UserDonationDTO> donationList(@RequestBody Map<String, String> yearAndMeans, HttpSession session,
			Model model) {
		String id = (String) session.getAttribute(LOGIN);
		String year, means;
		year = yearAndMeans.get("year");
		means = yearAndMeans.get("means");
		return uds.donationList(id, year, means, model);
	}

	@RequestMapping(value = "/preferences")
	public String preference() {
		return "myPage/preference";
	}

	@RequestMapping(value = "/preferences/third-party-agreement")
	public String thirdPartyAgreement() {
		return "myPage/thirdPartyAgreement";
	}

	@RequestMapping(value = "/donationMoney")
	public String donationMoney() {
		return "myPage/donationMoney";
	}

	@PostMapping(value = "/donationMoney.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String donationMoneyInsert(@RequestBody UserDonationDTO dto) {
		uds.donationInsert(dto);
		return "{\"execute\" : \"기부하였습니다.\"}";
	}

	@GetMapping(value = "/like.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String likeMoney() {
		String id = "ckc21";
		String title = "당신을 혼자 두지 않겠습니다";
		uds.likeMoney(id, title);
		return "{\"execute\" : \"좋아요.\"}";
	}

}
