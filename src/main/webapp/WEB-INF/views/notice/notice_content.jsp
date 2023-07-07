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
<title>${noticeDTO.title } : 코코아같이가치</title>
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/common.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.float_viewTab {
	position: fixed;
	left: 73%;
	top : 150px;
	width: 400px;
	text-align: center;
	z-index: 99998;
}

.float_viewTab .tab_fix {
	border-radius: 4px 0 0 4px;
	float: left;
	overflow: hidden;
	position: relative;
	width: 50%;
	height: 60px;
	line-height: 60px;
	background: #ffe500;
}

.float_viewTab .tab_delete {
	border-radius: 0 4px 4px 0;
	float: left;
	overflow: hidden;
	position: relative;
	width: 50%;
	height: 60px;
	line-height: 60px;
	background: #434343;
}

.float_viewTab .txt_fix {
	display: inline-block;
	margin-top: -2px;
	font-size: 18px;
	color: #444;
	vertical-align: top;
}

.float_viewTab .txt_delete {
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
			<div id="dkContent" class="cont_etc">
				<div id="mArticle">
					<div class="wrap_tab">
						<ul class="list_tab">
							<li class=""><a class="link_tab"
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
					<div class="wrap_view">
						<div class="view_head">
							<c:choose>
								<c:when test="${noticeDTO.tit == 1}">
									<span class="tit_official">서비스안내</span>
								</c:when>
								<c:when test="${noticeDTO.tit == 2}">
									<span class="tit_official">제안자안내</span>
								</c:when>
								<c:otherwise>
									<span class="tit_official">캠페인안내</span>
								</c:otherwise>
							</c:choose>
							<strong class="subject_official">${noticeDTO.title }</strong> <span
								class="date_official"><fmt:formatDate
									value="${noticeDTO.date }" pattern="yyyy.MM.dd" /></span>
						</div>
						<div class="view_body" id="view_body">
							<%
								pageContext.setAttribute("cr", "\r");
							pageContext.setAttribute("cn", "\n");
							pageContext.setAttribute("crcn", "\r\n");
							pageContext.setAttribute("text", "</span></font></p><p><font><span style='font-size: 16px;'>");
							pageContext.setAttribute("enter",
									"</span></font></p><p><font><span style='font-size: 16px;'><br></span></font></p><p><font><span style='font-size: 16px;'>");
							pageContext.setAttribute("enter2",
									"</span></font></p><p><font><span style='font-size: 16px;'><br></span></font></p><p><font><span style='font-size: 16px;'><br></span></font></p><p><font><span style='font-size: 16px;'>");
							pageContext.setAttribute("cncrcn", "\n\r\n");
							pageContext.setAttribute("cncrcncrcn", "\n\r\n\r\n");
							%>
							<p>
								<font><span style='font-size: 16px;'> <c:set
											var="content1"
											value="${fn:replace(noticeDTO.content,cncrcncrcn,enter2)}" />
										<c:set var="content2"
											value="${fn:replace(content1,cncrcn,enter)}" /> <c:set
											var="content3" value="${fn:replace(content2,cn,text)}" />
										${content3 }
								</span></font>
							</p>
						</div>
						<div class="view_foot">
							<strong class="writer">by. 같이가치 요정</strong>
							<div class="wrap_plusfriend">
								<span class="info_plusfriend">카카오같이가치 채널을 추가하면<br>중요한 이벤트 및 혜택을 알려드려요.</span>
								<button type="button" class="btn_plusfriend">
									<span class="icon_together icon_plusfriend"></span> <span
										class="txt_plusfriend">채널 추가</span>
								</button>
							</div>
						</div>
					</div>
					</ng-component>
					<c:if test="${loginUser != admin }">
						<div class="float_viewTab">
							<label for="fix"><a class="tab_fix"><span
									class="txt_fix"> <c:choose>
											<c:when test="${noticeDTO.fix == 1 }">
												<input type="checkbox" id="fix"
													onclick="noticeFix(${noticeDTO.num})">
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="fix"
													onclick="noticeFix(${noticeDTO.num})" checked>
											</c:otherwise>
										</c:choose> 상단고정
								</span></a></label>
							<a class="tab_delete" href="javascript:void(0);"
								onclick="noticeDelete(${noticeDTO.num})"><span
								class="txt_delete">글삭제</span></a>
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