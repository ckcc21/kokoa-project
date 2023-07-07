<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
td {
	border: 1px solid #000000;
	border-collapse: collapse;
}
</style>
<meta charset="UTF-8">
<title>코코아계정</title>
</head>
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>로그인 페이지</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="${contextPath }/logChk" method="post">

				<div class="form-group">
					<label for="id">아이디 </label> <input type="text"
						class="form-control" name="id" id="id" placeholder="아이디 입력">
				</div>

				<div class="form-group">
					<label for="pwd">비밀번호 </label> <input type="password"
						class="form-control" name="password" id="pwd"
						placeholder="비밀번호 입력">
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
			<a href="${contextPath }/createAccount">회원가입</a>

			<!-- 카카오 들어갈 부분 -->
			<div id=kakao_id_login style="text-align: center">
				<a class="p-2" id="kakaoIdLogin_loginButton"
					href="https://kauth.kakao.com/oauth/authorize?client_id=7583bcf60edefca37aeb6b093d87632e&redirect_uri=http://localhost:8090/kakaoLogin&response_type=code">
					<!-- REST_API키 및 REDIRECT_URI는 본인걸로 수정하세요 --> <!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
					<span><img
						src="${contextPath}/resources/image/kakao_login.png" width="200"></span>
				</a>
			</div>

			<!-- 			<div id="naver_id_login" style="text-align: center"> -->
			<%-- 				<a href="${url}"> <img width="223" --%>
			<!-- 					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a> -->
			<!-- 			</div> -->

		</div>
	</article>
</body>
</html>