package com.kokoa.together.account.service;

import java.util.HashMap;

import org.springframework.ui.Model;

import com.kokoa.together.account.dto.AccountDTO;

public interface AccountService {

	// 회원가입
	public int register(AccountDTO dto);

	// id중복체크
	public int idCheck(String id);

	// 로그인 체크
	public int logChk(String id, String pwd);

	// 로그인유지 및 쿠키생성 및 세션유지
	public void keepLogin(AccountDTO dto);

	// 유저 정보보기
	public AccountDTO userInfo(Model model, String id);

	// 카카오 로그인 api 토큰값
	public String getAccessToken(String authorize_code);

	// 카카오 로그인 api
	public HashMap<String, Object> getUserInfo(String access_Token);

	// 카카오 회원가입 서비스
	public void kakaoRegister(AccountDTO dto);

}
