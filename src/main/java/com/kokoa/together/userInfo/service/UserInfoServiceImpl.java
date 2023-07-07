package com.kokoa.together.userInfo.service;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.kokoa.together.mapper.userInfo.UserInfoMapper;
import com.kokoa.together.userInfo.DTO.UserInfoDTO;

@Service
public class UserInfoServiceImpl implements UserInfoService{

	
	@Autowired UserInfoMapper mapper;
	
	BCryptPasswordEncoder en = new BCryptPasswordEncoder();// 암호화 해주는 객체 
	
	// 아이디 중복 체크
	@Override
    public int idCheck(String id) {
        int cnt = mapper.idCheck(id);
        System.out.println("cnt: " + cnt);
        return cnt;
    }

	
	// 회원 가입 및 비밀번호 암호화 
	@Override
	public int register(UserInfoDTO dto) {
		
		
		System.out.println("변경 전 비밀번호:" +dto.getUPwd());
		String enPwd = en.encode(dto.getUPwd()); //비밀번호를 암호화 하여 변수에 넣는것
		
		dto.setUPwd(enPwd);//변경된 비밀번호를 dto에 넣은거
		System.out.println("변경 후 비밀번호:"+dto.getUPwd());
		
		int result =0;
		
		
		try {
			result=mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}


	//로그인 체크
	@Override
	public int logChk(String id, String pwd) {
		int result =1;
		
		UserInfoDTO dto = mapper.logChk(id);
		if(dto != null) {
			if(en.matches(pwd,  dto.getUPwd()) || dto.getUPwd().equals(pwd)) {

				return 0;
			}
		}
		return result;
	}

	//로그인 유지 및 세션 쿠키 생성 
	@Override
	public void keepLogin(UserInfoDTO dto) {
		
		mapper.keepLogin(dto);
	}

	//유저정보 상세보기
	@Override
	public UserInfoDTO userInfo(Model model,String id) {
		
		UserInfoDTO dto = mapper.logChk(id);

		model.addAttribute("detail", dto);
		
		return null;
	}

	//회원정보 업데이트
	@Override
	public int userUpdate(UserInfoDTO dto) {
		
		int result =0;

		System.out.println(dto.getUName()); 
		
		try {
			result = mapper.userUpdate(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			}
		return 1;
	}

	//비번체크
	@Override
	public boolean checkPwd(String id, String pwd) {
		
		boolean result = false;
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pwd", pwd);
		
		int cnt = mapper.checkPwd(map);
		
		return result;
	}

	//회원정보 삭제처리
	@Override
	public void userDelete(@RequestParam(value="UId", required = false)String id) {
		
		System.out.println("서비스에서 삭제할 id:"+id);
		mapper.userDelete(id);
		

	}




	


	
	
}
