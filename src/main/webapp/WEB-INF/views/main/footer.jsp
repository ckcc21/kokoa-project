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
</head>
<body>
	<footer class="footer__FooterBase-sc-h394p2-0 eUWYSw">
		<div
			class="container__ContainerBase-sc-1blfbq7-0 jNuphj footer__FooterInner-sc-h394p2-1 lJyyS">
			<a href="/" class="footer__FooterLogolink-sc-h394p2-2 ihtLfh"> <span
				class="screen-out__ScreenOut-sc-1g53lol-0 knpbuW">코코아<b>같이가치</b></span>
			</a>
			<div
				class="container__ContainerBase-sc-1blfbq7-0 jNuphj footer__ProposeContainer-sc-h394p2-6 icUhCZ undefined responsive__Pc-sc-1hv3gy5-0 jkHUZj">
				<a size="14" color="#999" class="text__Text-sc-55es3p-0 gClYEA">
					당신의 착한 마음을 응원합니다. <br class="br__Br-sc-tpjmiz-0 eSMNuV"> 더 좋은
					세상을 꿈꾼다면 지금 시작해보세요.
				</a> <a href="${contextPath }/fundraisings/write" color="#999"
					class="container__ContainerBase-sc-1blfbq7-0 jNuphj text__Text-sc-55es3p-0 footer__ProposeLinkButton-sc-h394p2-7 ginDBX jwBEwh">제안하기</a>
			</div>
			<div
				class="container__ContainerBase-sc-1blfbq7-0 jNuphj footer__InfoContainer-sc-h394p2-3 fZywNA">
				<ul
					class="list__ListUlBase-sc-btykj5-1 gKaPZJ menu-list__MenuListBase-sc-1vwbryy-0 wVwjd">
					<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#"
						class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink "><span
							color="#999999"
							class="text__Text-sc-55es3p-0 list-item-link__ItemText-sc-1m4qc4h-0 jdQLiw gYWTyY item_text">도움말</span></a>
					</li>
					<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#"
						class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink "><span
							color="#999999"
							class="text__Text-sc-55es3p-0 list-item-link__ItemText-sc-1m4qc4h-0 jdQLiw gYWTyY item_text">이용약관</span></a>
					</li>
					<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#"
						class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink "><span
							color="#999999"
							class="text__Text-sc-55es3p-0 list-item-link__ItemText-sc-1m4qc4h-0 bstUxn gYWTyY item_text">개인정보처리방침</span></a>
					</li>
				</ul>
				<a href="#"
					class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink footer__CopyrightHyperlink-sc-h394p2-4 hnvKof">
					<small color="#999"
					class="text__Text-sc-55es3p-0 footer__CopyrightText-sc-h394p2-5 gDvoJJ cSSuKh">©
						Kokoa Corp.</small>
				</a>
				<ul
					class="list__ListUlBase-sc-btykj5-1 gKaPZJ sns-list__SnsListBase-sc-cwn9qz-0 bTWoum">
					<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#"
						class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink ">
							<span color="#999999"
							class="text__Text-sc-55es3p-0 list-item-link__ItemText-sc-1m4qc4h-0 jdQLiw gYWTyY item_text">
								<i class="list-item-link__IconBg-sc-1m4qc4h-1 fFKAGy"></i>
						</span>
					</a>
					</li>
					<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#"
						class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink ">
							<span color="#999999"
							class="text__Text-sc-55es3p-0 list-item-link__ItemText-sc-1m4qc4h-0 jdQLiw gYWTyY item_text">
								<i class="list-item-link__IconBg-sc-1m4qc4h-1 gooySY"></i>
						</span>
					</a>
					</li>
					<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#"
						class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink ">
							<span color="#999999"
							class="text__Text-sc-55es3p-0 list-item-link__ItemText-sc-1m4qc4h-0 jdQLiw gYWTyY item_text">
								<i class="list-item-link__IconBg-sc-1m4qc4h-1 cBwcMU"></i>
						</span>
					</a>
					</li>
					<li class="list__ListItemContainer-sc-btykj5-2 kzmrex undefined">
						<a href="#"
						class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink ">
							<span color="#999999"
							class="text__Text-sc-55es3p-0 list-item-link__ItemText-sc-1m4qc4h-0 jdQLiw gYWTyY item_text">
								<i class="list-item-link__IconBg-sc-1m4qc4h-1 fSdGdb"></i>
						</span>
					</a>
					</li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>