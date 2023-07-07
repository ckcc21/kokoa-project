<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<base href="/">
<meta charset="UTF-8">
<title>모금중 : 카카오같이가치</title>
<meta name="viewport" content="width=device-width">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.group_catelist {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}

.group_catelist .inner_catelist {
	display: inline-block;
}

.group_catelist .list_cate {
	overflow: hidden;
	padding: 57px 17px 48px;
	text-align: center;
}

.group_catelist .list_cate li {
	float: left;
	width: 80px;
}

.group_catelist .list_cate .link_cate {
	display: block;
}

.group_catelist .list_cate .on svg {
	filter: saturate(100%);
}

.group_catelist .list_cate svg {
	width: 34px;
	height: 34px;
	filter: saturate(0);
}

.group_catelist .list_cate .txt_cate {
	display: block;
	padding-top: 5px;
	font-size: 13px;
	color: #bbb;
	font-family: sans-serif;
	font-weight: bold;
}

.group_catelist .list_cate .on .txt_cate {
	color: #444;
}

.group_catelist .list_cate .on image {
	filter: none;
}

.group_catelist .list_cate image {
	filter: grayscale(1);
}

.group_fundlist {
	position: relative;
	width: 1000px;
	margin: 0 auto 100px;
}

.group_fundlist .sort_cate {
	text-align: right;
}

.sort_cate {
	overflow: hidden;
	width: 1000px;
	height: 25px;
	margin: 0 auto;
	text-align: center;
}

.sort_cate .inner_sort_cate {
	position: relative;
	z-index: 10;
	display: inline-block;
}

.group_fundlist .sort_cate .box_sorting {
	margin-left: 27px;
}

.sort_cate .box_sorting {
	float: left;
	position: relative;
}

.box_sorting .inp_sort {
	overflow: hidden;
	position: absolute;
	left: 0;
	top: 0;
	z-index: -1;
	width: 100%;
	height: 100%;
	border: 0;
	opacity: .01;
}

.sort_on .inp_sort+.lab_sort {
	font-family: sans-serif;
	font-weight: bold;
	color: #444;
}

.box_sorting .lab_sort {
	display: block;
	position: relative;
	padding-left: 12px;
	font-size: 16px;
	color: #aaa;
	cursor: pointer;
}

.sort_on .inp_sort+.lab_sort:before {
	position: absolute;
	left: 0;
	top: 10px;
	width: 6px;
	height: 6px;
	border-radius: 10px;
	background-color: #444;
	content: "";
}

.group_fundlist .list_fund {
	margin-top: -25px;
}

.list_fund {
	overflow: hidden;
	margin-top: 24px;
	margin-left: -19px;
}

.list_fund li {
	float: left;
	position: relative;
	width: 236px;
	margin: 40px 0 0 18px;
}

.list_fund .link_pack {
	display: block;
	position: relative;
	width: 100%;
	height: 100%;
}

.list_fund .box_thumb {
	display: block;
	overflow: hidden;
	border-radius: 10px;
}

.box_together {
	background-color: #fff;
}

.list_fund .box_together {
	display: block;
	position: relative;
	height: 137px;
	padding-top: 13px;
	color: #444;
	background-color: #fff;
	vertical-align: bottom;
	white-space: normal;
	box-sizing: border-box;
}

.img_thumb {
	display: block;
}

.list_fund .img_thumb {
	overflow: hidden;
	position: relative;
	width: 100%;
	height: 134px;
	border-radius: 10px;
	background-repeat: no-repeat;
	background-position: 50%;
	background-size: cover;
	transition: .2s;
}

.list_fund .box_together .bundle_tit {
	display: block;
	height: 73px;
}

.ellipsis_type1, .ellipsis_type2 {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
}

.box_together .tit_together {
	display: block;
	font-weight: 400;
	font-size: 19px;
	color: #444;
}

.list_fund .box_together .tit_together {
	display: -webkit-box;
	max-height: 50px;
	font-size: 15px;
	line-height: 23px;
}

.tag_bundle {
	position: absolute;
	top: -123px;
	left: 10px;
	max-width: 200px;
}

.list_fund .box_together .txt_proposer {
	display: block;
	overflow: hidden;
	margin-top: 6px;
	font-size: 13px;
	color: #999;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.list_fund .wrap_state {
	float: left;
	position: relative;
	width: calc(100% - 132px);
	height: 2px;
	margin-top: 22px;
}

.list_fund .wrap_state .state_bar {
	display: block;
	overflow: hidden;
	position: relative;
	width: 100%;
	height: 2px;
	border-radius: 1px;
	background-color: #ebebeb;
}

.list_fund .wrap_state .state_gage {
	position: absolute;
	left: 0;
	top: 0;
	height: 2px;
	border-radius: 1px;
}

.list_fund .wrap_state .state_ing {
	background-color: #e35396;
}

.list_fund .wrap_state .txt_per {
    overflow: hidden;
    position: absolute;
    left: 0;
    top: -27px;
    font-size: 13px;
    line-height: 0;
    color: #444;
    font-family: sans-serif;
    font-weight: bold;
    text-align: right;
    text-indent: -99999px;
}

.list_fund .price_give, .list_fund .price_goal {
	display: block;
	color: #444;
	font-family: sans-serif;
	font-weight: bold;
	text-align: right;
}

.list_fund .price_goal {
	overflow: hidden;
	margin-top: 14px;
	font-size: 14px;
	line-height: 18px;
}
</style>
<script type="text/javascript">
function fundraisingList(sort, topicId, page) {
	console.log("sort : "+sort);
	console.log("topicId : "+topicId);
	
	var sortAndTopicIdAndPage = {
			sort : sort,
			topicId : topicId,
			page : page
			}
	
		$.ajax({
			url : "fundraisings/fundraisingListSearch.do",
			type : "post",
			timeout : 5000,
			data : JSON.stringify(sortAndTopicIdAndPage),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			beforeSend : function() {
				$(".list_more").append(loadingImg);
				},
				success : function(list) {
					if (list.length != 0) {
						console.log("listLength : "+ list.length);
						let html = "";
						list.forEach(function(data) {
							html += "<li class='listcard'><intersection-obseerver><fundraising-card>";
							html += "<a class='link_pack' href='/fundraisings/"+ data.num +"'>";
							html += "<span class='box_thumb'>";
							html += "<img class='img_thumb' src='${contextPath}/imageLoad?imageFileName="+ data.img +"'>";
							html += "</span><span class='box_together'><span class='bundle_tit'>";
							html += "<strong class='tit_together ellipsis_type1'><span class='tag_bundle'><!---->";
							html += "</span> "+ data.title +" </strong> <span class='txt_proposer'>";
							html += "<span class='screen_out'>제안자</span>"+ data.proposer +"</span></span>";
							html += "<span class='wrap_state'><span class='state_bar'>";
							html += "<span class='state_gage state_ing' style='width: ";
							html += Math.floor(data.totalDonation / data.goal * 100)+"%;'></span></span>";
							html += "<span class='screen_out'>달성률</span><span class='txt_per'>"
							html += Math.floor(data.totalDonation / data.goal * 100)+"%</span></span>";
							html += "<span class='price_goal'> "+ data.totalDonation.toLocaleString()+"원 </span>";
							html += "</span></a></fundraising-card></intersection-obseerver></li>";	
						})
						$(".fund_raising").append(html);
						loadingList = true;
						} else {
							loadingList = false;
							$(".list_more").remove();
							}
					},
					error : function() {
						alert("error");
						},
						complete : function() {
							$(".list_more").empty();
							}
						});
	};
</script>
</head>
<body>
	<div id="dkWrap">
		<%@ include file="../main/header.jsp"%>
		<span id="rootContent"> <router-outlet></router-outlet> <fundraising-list>
			<div id="dkContent" class="cont_join">
				<div id="mArticle">
					<div class="wrap_tab">
						<ul class="list_tab tab_type6">
							<li class="on"><a class="link_tab"
								href="${contextPath }/fundraisings/now"> <span
									class="txt_tab">모금중</span>
							</a></li>
							<li><a class="link_tab"
								href="${contextPath }/fundraisings/epilogue"> <span
									class="txt_tab">모금후기</span>
							</a></li>
							<li><a class="link_tab"
								href="${contextPath }/fundraisings/campaigns"> <span
									class="txt_tab">나눔캠페인</span>
							</a></li>
						</ul>
					</div>
					<div class="group_catelist">
						<div class="inner_catelist">
							<ul class="list_cate">
								<li class="on"><a class="link_cate" id="all"> <svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"
											ara-hidden="true">
				<image x="0" y="0" width="100%" height="100%"
												xmlns:xlink="http://www.w3.org/1999/xlink"
												xlink:href="//t1.kakaocdn.net/together_image/ico_all.png"></image>
				</svg> <span class="txt_cate">전체</span>
								</a></li>
								<li class=""><a class="link_cate" id="children"> <svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"
											ara-hidden="true">
				<image x="0" y="0" width="100%" height="100%"
												xmlns:xlink="http://www.w3.org/1999/xlink"
												xlink:href="https://t1.kakaocdn.net/together_image/ico_kidz.png"></image>
				</svg> <span class="txt_cate">어린이</span>
								</a></li>
								<li class=""><a class="link_cate" id="silver"> <svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"
											ara-hidden="true">
				<image x="0" y="0" width="100%" height="100%"
												xmlns:xlink="http://www.w3.org/1999/xlink"
												xlink:href="https://t1.kakaocdn.net/together_image/ico_old_221018.png"></image>
				</svg> <span class="txt_cate">어르신</span>
								</a></li>
								<li class=""><a class="link_cate" id="disabled"> <svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"
											ara-hidden="true">
				<image x="0" y="0" width="100%" height="100%"
												xmlns:xlink="http://www.w3.org/1999/xlink"
												xlink:href="https://t1.kakaocdn.net/together_image/ico_accessible.png"></image>
				</svg> <span class="txt_cate">장애인</span>
								</a></li>
								<li class=""><a class="link_cate" id="neighbor"> <svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"
											ara-hidden="true">
				<image x="0" y="0" width="100%" height="100%"
												xmlns:xlink="http://www.w3.org/1999/xlink"
												xlink:href="https://t1.kakaocdn.net/together_image/ico_neighborhood.png"></image>
				</svg> <span class="txt_cate">어려운이웃</span>
								</a></li>
								<!---->
							</ul>
						</div>
					</div>
					<div class="group_fundlist">
						<div class="sort_cate">
							<span class="inner_sort_cate"> <span
								class="box_sorting sort_on"> <input type="radio"
									class="inp_sort" name="sort0"> <label class="lab_sort"
									for="sort0">최신순</label>
							</span> <span class="box_sorting"> <input type="radio"
									class="inp_sort" name="sort1"> <label class="lab_sort"
									for="sort1">종료임박순</label>
							</span> <!---->
							</span>
						</div>
						<!---->
						<ul class="list_fund fund_raising">
							<!---->
							<!---->
						</ul>
						<!---->
						<!---->
						<div class="list_more">
							<!---->
						</div>
						<!---->
					</div>
				</div>
			</div>
			</fundraising-list>
		</span>
		<%@ include file="../main/footer.jsp"%>
	</div>
<script type="text/javascript" src="${contextPath }/resources/js/main.js"></script>
</body>
</html>