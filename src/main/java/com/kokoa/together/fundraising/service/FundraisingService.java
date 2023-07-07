package com.kokoa.together.fundraising.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kokoa.together.fundraising.dto.FundraisingDTO;

public interface FundraisingService {
	
	public void fundraisingLoad(int num, Model model);

	public List<FundraisingDTO> fundraisingList(int sort, int topicId, int page, Model model);

	public String writeSave(MultipartHttpServletRequest mhsr, HttpServletRequest request, String id);
}
