package com.kokoa.together.mapper.API;

import java.util.HashMap;

import com.kokoa.together.userInfo.loginAPI.KakaoDTO;

public interface UserInfoAPIMapper {

	//kakao로그인관련 정보저장
	public void kakaoinsert(HashMap<String, Object> userinfo); 
	
	//kakao 정보확인
	public KakaoDTO findkakao(HashMap<String, Object> userinfo);
	
}
