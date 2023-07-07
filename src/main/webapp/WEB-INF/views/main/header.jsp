<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>코코아같이가치</title>
<meta name="viewport" content="width=device-width">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var flag = false;
	$("#myMoreBtn").click(function(event){
		flag = !flag;
		if (flag) {
			$(".bZNsqa").attr("class", "list__ListUlBase-sc-btykj5-1 gKaPZJ pc-sub-menu__SubMenuBase-sc-11cwur-1 lNzQu pc-util-menu__PcSubMenuList-sc-wlpfqk-6 bZNsqa");
		} else {
			$(".bZNsqa").attr("class", "list__ListUlBase-sc-btykj5-1 gKaPZJ pc-sub-menu__SubMenuBase-sc-11cwur-1 rHVfk pc-util-menu__PcSubMenuList-sc-wlpfqk-6 bZNsqa");
		}
		
	});
	
	$(".fwcAaC").click(function(event){
		location.href = "${contextPath }/logout";
	});
	
});
</script>
</head>
<body>
	<header id="navigation"
		class="navigation__NavigationBase-sc-18gpk6r-0 cscyaQ navigation ">
		<div class="navigation__NavigationInner-sc-18gpk6r-1 cAoHTf">
			<div>
				<h1 class="logo__LogoBase-sc-1k39pz6-0 fCezHB">
					<a href="/" class="logo__LogoLink-sc-1k39pz6-1 itVrXi"> <span
						class="screen-out__ScreenOut-sc-1g53lol-0 knpbuW">코코아<b>같이가치</b></span>
					</a>
				</h1>
			</div>
			<nav class="gnb-menu__GnbBase-sc-1dzlqwk-3 ktAeju">
				<ul class="list__ListUlBase-sc-btykj5-1 gKaPZJ">
					<li
						class="list__ListItemContainer-sc-btykj5-2 kzmrex gnb-menu__GnbListItem-sc-1dzlqwk-0 kHJzvY undefined responsive__Mobile-sc-1hv3gy5-1 egLiOg">
						<a href="#"
						class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 gnb-menu__GnbItemLink-sc-1dzlqwk-1 bpmkZv jlsyIx link_gnb">홈</a>
					</li>
					<li
						class="list__ListItemContainer-sc-btykj5-2 kzmrex gnb-menu__GnbListItem-sc-1dzlqwk-0 cVarxt">
						<a href="${contextPath }/fundraisings/now"
						class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 gnb-menu__GnbItemLink-sc-1dzlqwk-1 bpmkZv jlsyIx link_gnb">같이기부</a>
					</li>
					<li
						class="list__ListItemContainer-sc-btykj5-2 kzmrex gnb-menu__GnbListItem-sc-1dzlqwk-0 cVarxt">
						<a href="#"
						class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 gnb-menu__GnbItemLink-sc-1dzlqwk-1 bpmkZv jlsyIx link_gnb">모두의행동</a>
					</li>
					<li
						class="list__ListItemContainer-sc-btykj5-2 kzmrex gnb-menu__GnbListItem-sc-1dzlqwk-0 cVarxt">
						<a href="${contextPath }/notices"
						class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 gnb-menu__GnbItemLink-sc-1dzlqwk-1 bpmkZv jlsyIx link_gnb">공지사항</a>
					</li>
					<li
						class="list__ListItemContainer-sc-btykj5-2 kzmrex gnb-menu__GnbListItem-sc-1dzlqwk-0 cVarxt undefined responsive__Pc-sc-1hv3gy5-0 jkHUZj">
						<button class="gnb-menu__GnbItemButton-sc-1dzlqwk-4 jHajhQ">더보기</button>
					</li>
				</ul>
			</nav>
			<div
				class="pc-util-menu__UtilMenuBase-sc-wlpfqk-0 fXbSZk undefined responsive__Pc-sc-1hv3gy5-0 jkHUZj">
				<c:choose>
					<c:when test="${loginUser == null}">
						<a href="${contextPath }/createAccount"
							class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 pc-util-menu__ProposeLinkButton-sc-wlpfqk-1 gA-DARd kWPyNV">회원가입</a>
						<a href="${contextPath }/login"
							class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 pc-util-menu__LoginLinkButton-sc-wlpfqk-2 gA-DARd cWqxgx">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath }/fundraisings/write"
							class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 pc-util-menu__ProposeLinkButton-sc-wlpfqk-1 gA-DARd kWPyNV">제안하기</a>
						<!---->
						<div class="container__ContainerBase-sc-1blfbq7-0 jNuphj pc-util-menu__UserUtil-sc-wlpfqk-3 fRTZDQ">
						<button type="button" id="myMoreBtn" class="button__ButtonBase-sc-1qp1zsm-0 cQFMzZ button pc-util-menu__UserMenuButton-sc-wlpfqk-5 hzQjqh">
							<span class="avatar__Avatar-sc-1o57jkz-0 pc-util-menu__AvatarUser-sc-wlpfqk-4 gbWzwn fIjjoe">
								<c:choose>
									<c:when test="${profileImage == 1 }">
										<img width="30" height="30" alt="프로필사진" class="thumb_profile"
											src="${contextPath }resources/image/1.png">
									</c:when>
									<c:when test="${profileImage == 2 }">
										<img width="30" height="30" alt="프로필사진" class="thumb_profile"
											src="${contextPath }resources/image/2.jpg">
									</c:when>
									<c:otherwise>
										<img width="30" height="30" alt="프로필사진" class="thumb_profile"
											src="https://t1.kakaocdn.net/together_image/common/avatar/avatar03.png">
									</c:otherwise>
								</c:choose>
							</span>
						</button>
						<ul class="list__ListUlBase-sc-btykj5-1 gKaPZJ pc-sub-menu__SubMenuBase-sc-11cwur-1 rHVfk pc-util-menu__PcSubMenuList-sc-wlpfqk-6 bZNsqa">
						<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#" class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 pc-sub-menu__SubMenuItemLink-sc-11cwur-0 guzATk ggpkUw">알림</a>
						</li>
						<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#" class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 pc-sub-menu__SubMenuItemLink-sc-11cwur-0 guzATk ggpkUw">마이페이지</a>
						</li>
						<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#" class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 pc-sub-menu__SubMenuItemLink-sc-11cwur-0 guzATk ggpkUw">설정</a>
						</li>
						<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<button class="pc-util-menu__LogoutButton-sc-wlpfqk-7 fwcAaC">로그아웃</button>
						</li>
						</ul>
						</div>
						<!---->
						<!---->
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
</body>
</html>