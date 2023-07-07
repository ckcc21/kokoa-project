package com.kokoa.together.userInfo.loginAPI;


import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kokoa.together.common.SessionName;

@Controller
public class LoginController implements SessionName{
	//로그 남기기 
	private final Logger logger = LoggerFactory.getLogger(LoginController.class.getName());

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private KakaoService ks;
 
 
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, 
			@RequestParam String state, HttpSession session) throws IOException, ParseException, org.json.simple.parser.ParseException {
		
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
 
        //1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
		
		/** apiResult json 구조
		{"resultcode":"00",
		 "message":"success",
		 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);   
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱 
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
 
		System.out.println(nickname);
		
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId",nickname); //세션 생성
		session.setAttribute(LOGIN, nickname);
		model.addAttribute("result", apiResult);
	     
		return "default/index";
	}
	
//	//로그아웃
//	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
//	public String logout(HttpSession session)throws IOException {
//			System.out.println("여기는 logout");
//			session.invalidate();
//			
//	        
//			return "redirect:index.jsp";
//		}
	
	
	//kakao로그인API 
	@RequestMapping(value="/kakao_login.ajax")
	public String kakoLogin() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
        loginUrl.append("12d166a16b9ab707ddd23fa50dc6039e"); 
        loginUrl.append("&redirect_uri=");
        loginUrl.append("http://localhost:8085/UserInfo/kakaologin"); 
        loginUrl.append("&response_type=code");
	
        return "redirect:"+loginUrl.toString();
	}
	
	
	//code받을 메소드 
	@GetMapping("UserInfo/kakaologin")
	public String kakaologin(@RequestParam(value="code", required = false)String code,
			HttpSession session, HttpServletRequest request) {
		logger.info("받은코드:"+code);
		//접속 토근 get
		String access_Token= ks.getAccessToken(code);
		
		//로그아웃시 상용될 세션이름과 값
		logger.info("토큰값출력:"+access_Token);
		
		//KakaoDTO dto= new KakaoDTO();
		
		
		//KakaoDTO에 userInfo라는 변수로 접속토큰
		KakaoDTO userInfo = ks.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getK_name());
		System.out.println("###email#### : " + userInfo.getK_email());
		
		//세션 담기 로그인 이라는이름으로 닉네임 저장
		session.setAttribute(LOGIN, access_Token);
		
		session.setAttribute("userInfo", userInfo);
		
		//로그아웃시 상용될 세션이름과 값
		session.setAttribute("access_Token", access_Token);
		
		//닉네임이랑 이메일을 session객체에 담는코드 
		//jsp페이지에서${sessionScope.kakaoN}이런 형식으로 사용가능
		session.setAttribute("kakaoN", userInfo.getK_name());
		session.setAttribute("kakaoE", userInfo.getK_email());
		
				
				return "default/index";
	}
	
	//로그아웃 
	@GetMapping("/kakao/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap, 
    		HttpSession session, @CookieValue(required = false)Cookie loginCookie ) throws IOException {
		
		System.out.println("여기는 로그아웃 ");
		
		//session.removeAttribute("access_Token");
		
	   ks.getLogout((String)session.getAttribute("access_Token"));
		
		session.setAttribute("userInfo", null);
		session.setAttribute("access_Token", null);
		
		if(loginCookie != null) {
    		
    		loginCookie.setMaxAge(0);
    		
    		response.addCookie(loginCookie);
    		
    		session = request.getSession();
    		
    		session.invalidate();

    	}
			return "default/index";
    }
	
}
	

	
