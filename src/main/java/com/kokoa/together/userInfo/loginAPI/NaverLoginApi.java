package com.kokoa.together.userInfo.loginAPI;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20{

	protected static class InstanceHoler{
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
		
		
	}
	
	public static NaverLoginApi instance() {
		return InstanceHoler.INSTANCE;
	}
	
	@Override
	public String getAccessTokenEndpoint() {
		// TODO Auto-generated method stub
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		// TODO Auto-generated method stub
        return "https://nid.naver.com/oauth2.0/authorize";
	}

	
}
