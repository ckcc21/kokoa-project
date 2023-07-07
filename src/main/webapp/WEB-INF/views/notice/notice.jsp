<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<base href="/">
<meta charset="UTF-8">
<title>공지사항 : 코코아같이가치</title>
<meta name="viewport" content="width=device-width">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/common.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.float_writeTab {
	position: fixed;
	left: 0px;
	bottom: 10px;
	width: 100%;
	text-align: center;
}

.float_writeTab .btn_write {
	width: 200px;
	border-radius: 4px 4px;
	padding: 15px;
	overflow: hidden;
	height: 60px;
	background: #434343;
}

.float_writeTab .txt_write {
	display: inline-block;
	margin-top: -2px;
	font-size: 18px;
	color: #fff;
	vertical-align: top;
}
</style>
</head>
<body>
	<div id="dkWrap">
		<%@ include file="../main/header.jsp"%>
		<span id="rootContent">
		<router-outlet></router-outlet>
		<ng-component>
			<div id="dkContent" class="cont_join">
				<div id="mArticle">
					<div class="wrap_tab">
						<ul class="list_tab">
							<li class="on"><a class="link_tab"
								href="${contextPath }/notices"><span class="txt_tab">전체</span></a></li>
							<li class=""><a class="#tab_1 link_tab"
								href="${contextPath }/notices#%EC%84%9C%EB%B9%84%EC%8A%A4%EC%95%88%EB%82%B4"><span
									class="txt_tab">서비스안내</span></a></li>
							<li class=""><a class="#tab_2 link_tab"
								href="${contextPath }/notices#%EC%A0%9C%EC%95%88%EC%9E%90%EC%95%88%EB%82%B4"><span
									class="txt_tab">제안자안내</span></a></li>
							<li class=""><a class="#tab_3 link_tab"
								href="${contextPath }/notices#%EC%BA%A0%ED%8E%98%EC%9D%B8%EC%95%88%EB%82%B4"><span
									class="txt_tab">캠페인안내</span></a></li>
						</ul>
					</div>
					<router-outlet></router-outlet>
					<ng-component>
					<div class="group_official">
						<ul class="list_official">
							<!---->
						</ul>
						<div class="list_more">
							<!---->
						</div>
					</div>
					</ng-component>
					<c:if test="${loginUser != admin }">
						<div class="float_writeTab">
							<button type="button" class="btn_write"
								onclick="location.href='${contextPath }/noticeWrite';">
								<span class="txt_write"> 글쓰기 </span>
							</button>
						</div>
					</c:if>
				</div>
			</div>
			</ng-component>
		</span>
		<%@ include file="../main/footer.jsp"%>
	</div>
	<script type="text/javascript" src="${contextPath }/resources/js/main.js"></script>
</body>
</html>