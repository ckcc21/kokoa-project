package com.kokoa.together.account.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kokoa.together.account.dto.AccountDTO;
import com.kokoa.together.mapper.account.AccountMapper;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountMapper mapper;

	// 암호화 해주는 객체
	BCryptPasswordEncoder en = new BCryptPasswordEncoder();

	// 회원 가입 및 비밀번호 암호화
	@Override
	public int register(AccountDTO dto) {

		System.out.println("변경 전 비밀번호:" + dto.getPassword());

		// 비밀번호를 암호화하여 변수에 넣는 것
		String enPwd = en.encode(dto.getPassword());

		// 변경된 비밀번호를 dto에 넣은 것
		dto.setPassword(enPwd);
		System.out.println("변경 후 비밀번호:" + dto.getPassword());

		int result = 0;

		try {
			result = mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(String id) {
		int cnt = mapper.idCheck(id);
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	// 로그인 체크
	@Override
	public int logChk(String id, String pwd) {
		int result = 1;

		AccountDTO dto = mapper.logChk(id);
		if (dto != null) {
			if (en.matches(pwd, dto.getPassword()) || dto.getPassword().equals(pwd)) {
				return 0;
			}
		}
		return result;
	}

	// 로그인 유지 및 세션 쿠키 생성
	@Override
	public void keepLogin(AccountDTO dto) {
		mapper.keepLogin(dto);
	}

	// 유저정보 상세보기
	@Override
	public AccountDTO userInfo(Model model, String id) {

		AccountDTO dto = mapper.logChk(id);

		model.addAttribute("detail", dto);

		return null;
	}

	// 카카오 로그인
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=7583bcf60edefca37aeb6b093d87632e"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8090/kakaoLogin"); // 본인이 설정한 주소
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	// 카카오 인증 성공 사용자 토큰값 받아옴
	public HashMap<String, Object> getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String id = element.getAsJsonObject().get("id").getAsString();
			System.out.println(id);
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			System.out.println(nickname);
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			System.out.println(email);
//			String profileImg = kakao_account.getAsJsonObject().get("profile_image").getAsString();
//			System.out.println(profileImg);
			String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
			System.out.println(gender);
			String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
			System.out.println(birthday);
			String ageRange = kakao_account.getAsJsonObject().get("age_range").getAsString();
			System.out.println(ageRange);

			userInfo.put("kakaoId", id);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
//			userInfo.put("profile_image", profileImg);
//			userInfo.put("gender", gender);
//			userInfo.put("birthday", birthday);
//			userInfo.put("age_range", ageRange);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	// 카카오 로그인과 동시에 회원가입
	public void kakaoRegister(AccountDTO dto) {
		try {
			AccountDTO chkDTO = mapper.logChk(dto.getId());
			if (chkDTO == null) {
				mapper.kakaoRegister(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}