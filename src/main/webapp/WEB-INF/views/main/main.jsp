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
</head>
<body style="overflow: auto;">
	<div id="__next">
		<%@ include file="../main/header.jsp"%>
		<main id="main"
			class="page-container__PageContainerBase-sc-5zga16-0 bZrsSN">
			<div class="container__ContainerBase-sc-1blfbq7-0 jNuphj">
				<section
					class="container__ContainerBase-sc-1blfbq7-0 jNuphj section__Section-sc-jztdnf-0 branding-section__BrandingSectionBase-sc-1dbdm7a-0 cIpNNx kQUXyq">
					<h3
						class="text__Text-sc-55es3p-0 branding-section__BrandingTitle-sc-1dbdm7a-1 BFXgW fBDJlk">당신의 착한 마음을
						같이가치가 응원합니다❤️</h3>
					<div
						class="branding-section__BrandingIntroduce-sc-1dbdm7a-2 dQOTEc">
						<div
							class="branding-introduce-item__BrandingIntroduceItemBase-sc-qrv82a-0 kaCcMg">
							<i
								src="https://t1.kakaocdn.net/together_image/common/ico_home_donation.png"
								class="branding-introduce-item__IconBox-sc-qrv82a-3 dggxlY ico"></i>
							<i
								src="https://t1.kakaocdn.net/together_image/common/bg_home_hands.png"
								class="branding-introduce-item__IconBox-sc-qrv82a-3 branding-introduce-item__IconBgBox-sc-qrv82a-4 etdPvI inUieD ico"></i>
							<i
								src="https://t1.kakaocdn.net/together_image/common/ico_action_people.png"
								class="branding-introduce-item__IconBox-sc-qrv82a-3 bqjcIm ico"></i>
							<button type="button"
								class="button__ButtonBase-sc-1qp1zsm-0 ixJDoj button branding-introduce-item__IntroduceLinkButton-sc-qrv82a-2 fnrhmF">
								<a href="#"
									class="hyperlink__LinkBase-sc-1ifn50f-0 eEBkuc external_hyperlink ">
									<span
									class="text__Text-sc-55es3p-0 branding-introduce-item__BrandingRoundText-sc-qrv82a-1 hpKjlv kWtQFl">같이가치
										소개</span> <i
									src="https://t1.kakaocdn.net/together_image/common/ico_home_arrow_220831.png"
									class="branding-introduce-item__IconBox-sc-qrv82a-3 ienMnM ico"></i>
								</a>
							</button>
						</div>
					</div>
				</section>
				<div class="container__ContainerBase-sc-1blfbq7-0 jNuphj src__ContentContainer-sc-xxyp8v-0 etuknE">
				<section class="container__ContainerBase-sc-1blfbq7-0 jNuphj section__Section-sc-jztdnf-0 main__MainSectionBase-sc-1t4dd6z-0 cIpNNx iCLsje"></section>
				<section class="container__ContainerBase-sc-1blfbq7-0 jNuphj section__Section-sc-jztdnf-0 aside__AsideSectionBase-sc-1w8dzxf-0 cIpNNx fgOHIH"></section>
				</div>
			</div>
		</main>
		<%@ include file="../main/footer.jsp"%>
	</div>
</body>
</html>