package com.kokoa.together.mapper.userInfo;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.kokoa.together.userInfo.DTO.UserInfoDTO;

public interface UserInfoMapper {

	// 가입기능
	public int register(UserInfoDTO dto);

	// 아이디 중복체크
	public int idCheck(String id);

	// 로그인 체크
	public UserInfoDTO logChk(String id);

	// 로그인 유지
	public void keepLogin(UserInfoDTO dto);

	// 회원정보 보기
	public UserInfoDTO userInfo(String id);

	// 회원정보 수정
	public int userUpdate(UserInfoDTO dto);

	// 회원정보 수정 및 삭제를 위한 비번체크
	public int checkPwd(Map<String, String> map);

	// 회원정보 삭제
	public void userDelete(@RequestParam(value = "UId", required = false) String id);

}
