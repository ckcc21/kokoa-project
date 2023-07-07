<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
td{
   border:1px solid #000000;
   border-collapse:collapse;
}
</style>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<body>
<article class="container"> 
	
	<div class="page-header">
	<div class="col-md-6 col-md-offset-3">
		<h3>로그인 페이지</h3>
	</div>
	</div>
	
	<div class="col-sm-6 col-md-offset-3">
	<form action="${contextPath }/UserInfo/logChk" method="post">
	
	<div class="form-group">
	<label for ="id">아이디 </label>
	 <input type="text" class="form-control" name="UId" id="id" placeholder="Input ID">
	</div>
	
	<div class="form-group">
	<label for ="pwd">비밀번호 </label>
	 <input type="password" class="form-control" name="UPwd" id="pwd" placeholder="InPut PassWord">
	</div>
	
	<div class="form-group text-center">
       <button type="submit" class="btn btn-primary">로그인</button> 
  </div>
	</form>
<a href="${contextPath }/UserInfo/registerForm">회원가입</a>	


<div id=kakao_id_login style="text-align:center"><a href="/kakao_login.ajax" >
	<img width="223" alt="" src="/image/kakao.png"></a></div>

<div id="naver_id_login" style="text-align:center"><a href="${url}">
	<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>

</div>
 
 
 
</article>
</body>
</html>
