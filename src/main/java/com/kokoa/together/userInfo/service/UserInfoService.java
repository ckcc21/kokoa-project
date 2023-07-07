package com.kokoa.together.userInfo.service;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.kokoa.together.userInfo.DTO.UserInfoDTO;

public interface UserInfoService {
	
	//회원가입
	public int register(UserInfoDTO dto);
	
	//id중복체크
	public int idCheck(String id);
	
	//로그인 체크
	public int logChk(String id, String pwd);
	
	//로그인유지 및 큐키생성 및 세션유지
	public void keepLogin(UserInfoDTO dto);
	
	//유저 정보보기
	public UserInfoDTO userInfo(Model model, String id);
	
	//회원정보 수정
	public int userUpdate(UserInfoDTO dto);
	
	//회원정보 수정 및 삭제를 위한 비번체크
	public boolean checkPwd(String id, String pwd);
	
	//회원정보 삭제
	public void userDelete(@RequestParam(value="UId", required = false)String id);



}
	

