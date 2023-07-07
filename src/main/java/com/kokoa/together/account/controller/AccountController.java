package com.kokoa.together.account.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kokoa.together.account.dto.AccountDTO;
import com.kokoa.together.account.service.AccountService;
import com.kokoa.together.common.SessionName;

@Controller
public class AccountController implements SessionName {

	@Autowired
	AccountService as;

	// 로그 남기기
	private final Logger logger = LoggerFactory.getLogger(AccountController.class.getName());

	@GetMapping("createAccount")
	public String createAccount() {
		return "account/create_account";
	}

	// 회원가입
	@PostMapping("register")
	public String register(AccountDTO dto) {
		logger.info(dto.getId());
		logger.info(dto.getPassword());
		logger.info(dto.getName());
		logger.info(dto.geteMail());
		logger.info(dto.getProfileImg());
		logger.info(dto.getPostalCode());
		logger.info(dto.getRoadNameAddr());
		logger.info(dto.getDetailedAddr());
		System.out.println(dto.getGender());
		System.out.println(dto.getBirth());
		System.out.println(dto.getTel());

		int result = as.register(dto);
		if (result == 1) {
			return "redirect:login";
		} else {
			return "redirect:createAccount";
		}
	}

	// 아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id, HttpServletRequest request) {
		logger.info("idCheck 진입");
		logger.info("전달받은 id:" + id);
		int cnt = as.idCheck(id);
		logger.info("확인 결과:" + cnt);
		return cnt;
	}

	// 로그인 페이지
	@GetMapping("login")
	public String login() {
		return "account/login";
	}

	// 로그인 체크
	@PostMapping("logChk")
	public String logChk(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "password", required = false) String pwd,
			@RequestParam(required = false) String loginUser, RedirectAttributes ra, HttpSession session, Model model) {

		// as 어드민 서비스 단을 만들어야한다. 관리자 페이지 서비스 페이지 따로만들어야 하고 admin DTO
		// 어드민분류에 1,2,3 주고 id=admin1이라면 관리자 as로 들어가겠다 이렇게 하자

		logger.info("전달받은 id:" + id);
		// 어드민계정으로 로그인할시
		if (id.equals("admin1") || id.equals("admin2") || id.equals("admin3")) {
			ra.addAttribute("id", id);
			return "redirect:successLogin";
		} else {
			System.out.println("동작안함");
		}

		int result = as.logChk(id, pwd);

		if (result == 0) {// 로그인 성공

			ra.addAttribute("id", id);

			logger.info("전달받은 ra-id:" + id);

			return "redirect:successLogin";
		}

		return "redirect:login";
	}

	// ID를 근거로 쿠키 및 세션 생성
	@RequestMapping("/successLogin")
	public String successLogin(@RequestParam String id, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		logger.info("logChk에서id값은:" + id);

		session = request.getSession();// 세션만들기 1단계
		session.setAttribute(LOGIN, id);// 끌고온 id로 LOGIN이란 이름으로 세션을 만들어 주겠다.
		logger.info("SessionName.LOGIN:" + session.getAttribute(LOGIN));// 가지고 온 세션 값 확인
		// session.setAttribute(LOGIN, session.getAttribute(LOGIN));

		if (session.getAttribute("loginUser") != null) {
			int time = 60 * 60 * 24 * 30; // 30일까지
			Cookie cookie = new Cookie("loginCookie", session.getId());
			cookie.setPath("/");
			cookie.setMaxAge(time);
			response.addCookie(cookie);

			Calendar cal = Calendar.getInstance();// 싱글톤생성
			cal.setTime(new java.util.Date());
			cal.add(Calendar.MONTH, 1); // 1개월로 시간설정

			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());

			AccountDTO dto = new AccountDTO();

			dto.setLimitDate(limitDate);
			dto.setSessionId(session.getId());
			dto.setId(id);
			as.keepLogin(dto);

			// 프로필 이미지 세션 추가
			as.userInfo(model, id);
			session.setAttribute("profileImage", model.getAttribute("profileImage"));
		}
		return "main/main";
	}

	// 카카오 로그인 및 가입
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session)
			throws Exception {
		// System.out.println("#########" + code);
		String access_Token = as.getAccessToken(code);

		HashMap<String, Object> userInfo = as.getUserInfo(access_Token);

		// 위에서 만든 코드 아래에 코드 추가
		// System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###kakaoId### : " + userInfo.get("kakaoId"));
		System.out.println("###email#### : " + userInfo.get("email"));

		AccountDTO dto = new AccountDTO();
		dto.setId((String) userInfo.get("kakaoId"));
		dto.setNickName((String) userInfo.get("nickname"));
		dto.seteMail((String) userInfo.get("email"));
		// dto.setGender((int) userInfo.get("gender"));

		// mbr_info로 kakao 이메일, 닉네임, 아이디 전송
		as.kakaoRegister(dto);

		// String mbrName = URLEncoder.encode((String) userInfo.get("nickname"));

		// 리턴 매핑
		// "redirect:reg?mbrId="+userInfo.get("kakaoId")+"&mbrEmail="+userInfo.get("email")+"&mbrName="+mbrName;
		session.setAttribute(LOGIN, userInfo.get("kakaoId"));

		return "main/main";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@CookieValue(required = false) Cookie loginCookie) throws IOException {

		if (loginCookie != null) {

			loginCookie.setMaxAge(0);

			response.addCookie(loginCookie);

			session = request.getSession();

			session.invalidate();

//	    		"none", new java.sql.Date(System.currentTimeMillis()),
//				(String)session.getAttribute(SessionName.LOGIN)
		}
		return "main/main";
	}

}
