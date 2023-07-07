package com.kokoa.together.mapper.account;

import org.springframework.stereotype.Repository;

import com.kokoa.together.account.dto.AccountDTO;

@Repository
public interface AccountMapper {

	// 회원 가입
	public int register(AccountDTO dto);

	// 아이디 중복체크
	public int idCheck(String id);

	// 로그인 체크
	public AccountDTO logChk(String id);

	// 로그인 유지
	public void keepLogin(AccountDTO dto);
	
	// 카카오 api 회원 가입
	public void kakaoRegister(AccountDTO dto);
	
}
