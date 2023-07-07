package com.kokoa.together.userInfo.contoroller;


import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kokoa.together.common.SessionName;
import com.kokoa.together.userInfo.DTO.UserInfoDTO;
import com.kokoa.together.userInfo.loginAPI.NaverLoginBO;
import com.kokoa.together.userInfo.service.UserInfoService;


@Controller
@RequestMapping(value ="/UserInfo")
public class UserInfoController implements SessionName{
	
	@Autowired UserInfoService us;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그 남기기 
	private final Logger logger = LoggerFactory.getLogger(UserInfoController.class.getName());

	//회원가입 페이지
	@GetMapping("registerForm")
	public String register_form() {
		return "/UserInfo/register";
	}
	
	//회원가입 
	@PostMapping("register")
	public String register(UserInfoDTO dto) {
		logger.info(dto.getUId());
		logger.info(dto.getUPwd());
		logger.info(dto.getUName());
		logger.info(dto.getUMail());
		logger.info(dto.getUImg());
		logger.info(dto.getUPostAddr());
		logger.info(dto.getURoadAddr());
		logger.info(dto.getUDetailAddr());
		System.out.println(dto.getUBirth());
		System.out.println(dto.getUTel());
		System.out.println(dto.getUGen());
		
		int result = us.register(dto);
		if(result ==1) {
			return "redirect:login";
		}else {
			return "redirect:registerForm";
		}
	}
	
	
	//아이디 중복체크
    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("id") String id, HttpServletRequest request){
    	
        logger.info("userIdCheck 진입");
        logger.info("전달받은 id:"+id);
        int cnt = us.idCheck(id);
        logger.info("확인 결과:"+cnt);
        return cnt;
    }


    //로그인 페이지
    @GetMapping("login")
    public String loginForm(Model model, HttpSession session) {
    	
    	
    	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);
    	
    	return "UserInfo/login";
    }

    
    //로그인 체크
    @PostMapping("logChk")
    public String logChk(@RequestParam(value="UId", required = false)String id, 
    		@RequestParam(value="UPwd", required = false) String pwd,
    		@RequestParam(required = false)String loginUser, RedirectAttributes ra,HttpSession session,
    		Model model) {
    	
    	//as 어드민 서비스 단을 만들어야한다. 관리자 페이지 서비스 페이지 따로만들어야 하고   admin DTO
    	//어드민분류에 1,2,3 주고 id=admin1이라면 관리자 as로 들어가겠다 이렇게 하자
    	
    	logger.info("전달받은 id:"+id);
    	// 어드민계정으로 로그인할시 
    	if(id.equals("admin1") || id.equals("admin2") || id.equals("admin3")) {
    		ra.addAttribute("id", id);
    		return "redirect:successLogin";
    	}else {
    		System.out.println("동작안함");
    	}
    	
    	int result = us.logChk(id, pwd);
    	    	
    	if(result ==0) {//로그인 성공
    		
    		ra.addAttribute("id",id);
    		
    		logger.info("전달받은 ra-id:"+id);
    		
    		return "redirect:successLogin";
    	}
    	
    		return "redirect:login";
    }

    //ID를 근거로 쿠키 및 세션 생성 
    @RequestMapping("/successLogin")
    public String successLogin(@RequestParam String id, HttpSession session,
    		HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	logger.info("logChk에서id값은:"+id);
    	
    	session = request.getSession();//세션만들기 1단계
    	session.setAttribute(LOGIN, id);// 끌고온 id로 LOGIN이란 이름으로 세션을 만들어 주겠다.
    	logger.info("SessionName.LOGIN:"+session.getAttribute(LOGIN));// 가지고 온 세션 값 확인 
    	//session.setAttribute(LOGIN, session.getAttribute(LOGIN));
    	
    	if(session.getAttribute("loginUser") !=null) {
    		int time =60*60*24*30; //30일까지 
    		Cookie cookie = new Cookie("loginCookie", session.getId());
    		cookie.setPath("/");
    		cookie.setMaxAge(time);
    		response.addCookie(cookie);

    		Calendar cal = Calendar.getInstance();// 싱글톤생성
    		cal.setTime(new java.util.Date());
    		cal.add(Calendar.MONTH, 1); // 1개월로 시간설정
    		
    		java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
    		
    		UserInfoDTO dto = new UserInfoDTO();
    		
    		dto.setLimitTime(limitDate);
    		dto.setSessionId(session.getId());
    		dto.setUId(id);
    		us.keepLogin(dto);
    		
    		// 프로필 이미지 세션 추가
//    		us.userInfo(model, id);
//    		session.setAttribute(PROFILEIMAGE, model.getAttribute("profileImage"));    		
    	}
    	return "default/index";
    }
    
    //로그아웃 
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response,
    		HttpSession session, @CookieValue(required = false)Cookie loginCookie ) throws IOException {
    	
    	if(loginCookie != null) {
    		
    		loginCookie.setMaxAge(0);
    		
    		response.addCookie(loginCookie);
    		
    		session = request.getSession();
    		
    		session.invalidate();
    		
//    		"none", new java.sql.Date(System.currentTimeMillis()),
//			(String)session.getAttribute(SessionName.LOGIN)
    	}
    	return "default/index";
    }
    
    
    

    @GetMapping("mypage")
    public String mypage(HttpSession session, Locale locale, Model model) {
    	String id =(String)session.getAttribute(LOGIN);
    	logger.info("세션으로 유지되는 id: "+id);
    	return "redirect:userInfo";
    }

  
    @GetMapping("userInfo")
    public String userInfo(HttpSession session, Model model) {
    	
    	String id =(String)session.getAttribute(LOGIN);
    	
    	logger.info("세션으로 유지되는 id2: "+id);
    	model.addAttribute("profile", "image/1.png");
    	model.addAttribute("title", "남자");
    	us.userInfo(model,id);
    	
    	return "UserInfo/mypage";
    }

    
    @PostMapping("userUpdate")
    public String userUpdate(@ModelAttribute UserInfoDTO dto, Model model,String id) {
    	
    	
    	int result =  us.userUpdate(dto);

    	if( result == 1 ) {// cnt 반환값이 1이면 성공으로 마이페이지로  
    		
    		model.addAttribute("msg", "성공적으로 작동");
    		return "redirect:userInfo";
    		
    	}else {
    		
    		return "UserInfo/mypage";
    	}
    	
    }

    @PostMapping("userDelete")
    public String userDelete(@RequestParam(value="UId", required = false)String id) {
    	
    	logger.info("삭제할아이디:"+id);
    	
    	us.userDelete(id);
  
    	return "redirect:logout";
    	
    	}	
    	
 
    
    
}


