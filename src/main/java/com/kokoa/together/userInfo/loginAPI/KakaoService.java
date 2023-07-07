package com.kokoa.together.userInfo.loginAPI;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kokoa.together.mapper.API.UserInfoAPIMapper;

@Service
public class KakaoService {
	
	@Autowired UserInfoAPIMapper mapper;
		
	
	
	
	//access_Token요청하는 메소드
	public String getAccessToken (String code) {
		String access_Token ="";
		String refresh_Token ="";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url= new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			//post요청을 위해 기본갑이 false 인 setDoOutPut를 true로 
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			//buffer 스트림 객체로 값 세팅 후 post요청에 필요로 요구하는 파리미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=12d166a16b9ab707ddd23fa50dc6039e"); //발급받은 rest-key
			sb.append("&redirect_uri=http://localhost:8085/UserInfo/kakaologin"); // 리다이렉트주소
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			
			// return값을 result변수에 저장 값  결과 코드가 200이면 성공 
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode:" + responseCode);
			
			//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line="";
			String result="";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body:"+ result);
			
			//Gson 라이브러리에 포함된  클래스로  JSON 파싱 객체 생성
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
	
	//사용자 정보를 요청하는 메소드
	public KakaoDTO getUserInfo(String access_Token) {
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

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}
		//정보가 저장되었는지에 대한 코드
		KakaoDTO result = mapper.findkakao(userInfo);
		
		System.out.println("저장된 정보에대한 결과:"+ result);
		if(result==null) {//result가 null이면 정보가 저장이 안되것으로 정보를 저장
			//정보를 저장하기 위해  mapper로 연결하러는것
			mapper.kakaoinsert(userInfo);
			
			//정보를 저장후 컨트롤러에 보내는 것 result를 리턴으로 보내면 null이 리턴됨에따라 이렇게 보냄
			return mapper.findkakao(userInfo);
		}else {
			
			return result;
		}
	}

	//로그아웃
	public String getLogout(String access_Token) {
		String reqURL ="https://kapi.kakao.com/GET/oauth/logout? client_id={0f0cb097cf98adc10e27d4fc3ed7f796}"
				+ "&logout_redirect_uri={http://localhost:8085/kakao/logout}HTTP/1.1";
				 
				
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            if(responseCode ==400)
                throw new RuntimeException("카카오 로그아웃 도중 오류 발생");
            
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String br_line = "";
            String result = "";
            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }
            System.out.println("카카오API로그아웃되었습니다");
            System.out.println(result);
        }catch(IOException e) {
            
        }
		return access_Token;
    }

	
}
			
	

