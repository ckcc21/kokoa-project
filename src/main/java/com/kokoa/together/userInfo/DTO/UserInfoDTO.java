package com.kokoa.together.userInfo.DTO;

public class UserInfoDTO {
	
	private String UId, UPwd,UName, UMail, UImg, UPostAddr,  URoadAddr, UDetailAddr;
	private int UGen, UTel, UBirth;
	private java.sql.Date LimitTime;
	private String SessionId;
	
	public String getUId() {
		return UId;
	}
	public void setUId(String uId) {
		UId = uId;
	}
	
	
	public java.sql.Date getLimitTime() {
		return LimitTime;
	}
	public void setLimitTime(java.sql.Date limitTime) {
		LimitTime = limitTime;
	}
	public String getSessionId() {
		return SessionId;
	}
	public void setSessionId(String sessionId) {
		SessionId = sessionId;
	}
	public String getUPwd() {
		return UPwd;
	}
	public void setUPwd(String uPwd) {
		UPwd = uPwd;
	}
	public String getUName() {
		return UName;
	}
	public void setUName(String uName) {
		UName = uName;
	}
	public String getUMail() {
		return UMail;
	}
	public void setUMail(String uMail) {
		UMail = uMail;
	}
	public String getUImg() {
		return UImg;
	}
	public void setUImg(String uImg) {
		UImg = uImg;
	}
	public String getUPostAddr() {
		return UPostAddr;
	}
	public void setUPostAddr(String uPostAddr) {
		UPostAddr = uPostAddr;
	}
	public String getURoadAddr() {
		return URoadAddr;
	}
	public void setURoadAddr(String uRoadAddr) {
		URoadAddr = uRoadAddr;
	}
	public String getUDetailAddr() {
		return UDetailAddr;
	}
	public void setUDetailAddr(String uDetailAddr) {
		UDetailAddr = uDetailAddr;
	}
	public int getUGen() {
		return UGen;
	}
	public void setUGen(int uGen) {
		UGen = uGen;
	}
	public int getUTel() {
		return UTel;
	}
	public void setUTel(int uTel) {
		UTel = uTel;
	}
	public int getUBirth() {
		return UBirth;
	}
	public void setUBirth(int uBirth) {
		UBirth = uBirth;
	}
	

	
	
}