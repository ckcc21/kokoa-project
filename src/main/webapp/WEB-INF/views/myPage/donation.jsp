<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 '${maskingId }' : 코코아같이가치</title>
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/common.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/myPage.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var year = "";
var means = "";
var pathName = location.pathname;

history.scrollRestoration = "manual";

function donationList(year, means) {
	var yearAndMeans = {
		year : year,
		means : means
	}
	$.ajax({
		url : "${contextPath }/my/donationListSearch.do",
		type : "post",
		data : JSON.stringify(yearAndMeans),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		beforeSend : function(){
			$(".area_receipt").empty();
		},
		success : function(list) {
			var donateNumInfo = "";
			if(list.length != 0){
				var year;
				var month;
				donateNumInfo += "<h4 class='tit_area'></h4>"
				donateNumInfo += "<div class='box_receipt'><ul class='list_receipt list_donate'>";
				list.forEach(function(data) {
				var date = new Date(data.date);
				year = date.getFullYear();
				month = (1 + date.getMonth());
				month = month >= 10 ? month : '0' + month; 
				var day = date.getDate();
				day = day >= 10 ? day : '0' + day;
				var formatDate = year + '.' + month + '.' + day;
				donateNumInfo += "<li class='item_donate'><p class='txt_sumdata'>" + formatDate + "</p>";
				donateNumInfo += "<p class='tit_sum'><a class='link_sum' href='#'>" + data.title + "</a></p>";
				donateNumInfo += "<div class='donate_numinfo'>";
				if (data.likeMoney != 0) {
					donateNumInfo += "<strong class='num_sumprice'>" + data.likeMoney * 100 + "원</strong>";
					donateNumInfo += "<span class='txt_sumprice'> 참여기부 (응원참여) </span>";
				} else if (data.shareMoney != 0) {
					donateNumInfo += "<strong class='num_sumprice'>" + data.shareMoney * 100 + "원</strong>";
					donateNumInfo += "<span class='txt_sumprice'> 참여기부 (공유참여) </span>";
				} else if (data.replyMoney != 0) {
					donateNumInfo += "<strong class='num_sumprice'>" + data.replyMoney * 100 + "원</strong>";
					donateNumInfo += "<span class='txt_sumprice'> 참여기부 (댓글참여) </span>";
				} else {
					donateNumInfo += "<strong class='num_sumprice'>" + data.directMoney.toLocaleString() + "원</strong>"; // .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
					donateNumInfo += "<span class='txt_sumprice'> 직접기부 </span>";
				}
				donateNumInfo += "</div><div class='box_link'></div></li>";
				month = (1 + date.getMonth());
			})
			donateNumInfo += "</ul></div>";
			$(".area_receipt").append(donateNumInfo);
			$(".tit_area").html(" "+year+"년 "+month+"월  <span class='emph_num'>("+list.length+"건)</span>");
			} else {
				donateNumInfo += "<div class='box_receipt'><p class='txt_nodata'>";
				donateNumInfo += "기부내역이 없습니다.</p></div>";
				$(".area_receipt").append(donateNumInfo);
			}
		}
	})
};

$(function(){
	var checkedOption = "";
	
	$("#opPeriod").on("change", function(){
		if(this.value == ""){
			year = "";
			checkedOption = " 전체 ";
		} else {
			year = this.value.slice(3);
			checkedOption = " "+year+" ";
		}		
		let selectOption = document.getElementsByClassName("select_option")[0];
		selectOption.innerText = checkedOption;
		donationList(year, means);
	})
	
	$("#opMeans").on("change", function(){
		if(this.value == ""){
			means = "";
			checkedOption = " 전체 ";
		} else {
			means = this.value.slice(3);
			if(means == "0"){
				checkedOption = " 직접기부 ";
			} else {
				checkedOption = " 참여기부 ";
			}
		}
		let selectOption = document.getElementsByClassName("select_option")[1];
		selectOption.innerText = checkedOption;
		donationList(year, means);
	})
});

	function preferenceHTML(pathName){
		$.ajax({
			url : "${contextPath}/preferences",
			type : "get",
			dataType : "html",
			success : function(html){
				switch(pathName){
				case "${contextPath}/preferences/third-party-agreement":
					$("ng-component").replaceWith($(html).find("ng-component"));
					break;
					default:
						$("user-header").replaceWith($(html).find("ng-component"));
					break;
				}
			},
			error : function(){
				alert("error");
			}
		})
	};
	
	function thirdPartyAgreement(pathName){
		$.ajax({
			url : "${contextPath}/preferences/third-party-agreement",
			type : "get",
			dataType : "html",
			success : function(html){
				switch(pathName){
				case "${contextPath }/preferences":
					$("ng-component").replaceWith($(html).find("ng-component"));
				break;
				default:
					$("user-header").replaceWith($(html).find("ng-component"));
				break;
				}
			},
			error : function(){
				alert("error");
			}
		})
	};

	function myPageHTML(pathName){
		$.ajax({
			url : "${contextPath}/my",
			type : "get",
			dataType : "html",
			success : function(html){
				switch(pathName){
				case "${contextPath }/my/donations":
					$(".donate_cont").attr("class","mypage_cont");
				$(".group_profile").append($(html).find(".area_setting"));
				$("ng-component").replaceWith($(html).find("user-profile"));
				break;
				default:
					$("ng-component").replaceWith($(html).find("user-header"));
				break;
				}
			},
			error : function(){
				alert("error");
			},
		})
	};
	
	$(function() {
		$("a[href='${contextPath }/my']").click(function(event) {
			event.preventDefault();
			myPageHTML(location.pathname);
			history.pushState(location.pathname, "", "${contextPath }/my");
		});
	});
	
</script>
</head>
<body>
	<div id="dkWrap">
		<%@ include file="../main/header.jsp"%>
		<span id="rootContent">
		<router-outlet></router-outlet>
		<user-header>
			<div id="dkContent">
				<div id="mArticle">
					<div class="donate_cont">
						<div class="group_profile">
							<div class="area_name">
								<div class="link_myprofile">
									<strong class="txt_nick">초심자</strong>
									<div class="box_name">
										<strong class="txt_name">${maskingId }</strong>
									</div>
								</div>
							</div>
							<div class="area_thumb">
								<a class="link_badge" href="#"><span class="badge_thumb">
										<img class="img_thumb"
										alt="카카오같이가치에 오신 것을 환영합니다!
세상의 변화를 만드는 활동에 함께해요."
										src="https://mud-kage.kakaocdn.net/dn/cdS2zq/btqcKJyBiPS/SDkrVVYcKkxHXkcD8l68i0/img.png">
								</span> </a> <a class="link_thumb" href="/preferences/profile"> <span
									class="profile_thumb">
									<c:if test="${profileImage == 1 }"><img alt="프로필 사진" class="img_thumb" src="/image/1.png"></c:if>
									<c:if test="${profileImage == 2 }"><img alt="프로필 사진" class="img_thumb" src="/image/2.jpg"></c:if>
									<c:if test="${profileImage == 3 }"><img alt="프로필 사진" class="img_thumb" src="/image/3.png"></c:if>
								</span>
								</a>
							</div>
						</div>
						<router-outlet></router-outlet>
						<ng-component>
						<div class="group_donate">
							<h3 class="tit_section section_type6">기부내역</h3>
							<div class="area_doselect">
								<div class="box_select">
									<div class="inner_box">
										<div class="opt_comm">
											<label for="opPeriod" class="screen_out">기간</label> <select
												id="opPeriod"
												class="opt_select ng-untouched ng-pristine ng-valid">
												<option value="">전체</option>
												<option value="1: 2022">2022</option>
												<option value="2: 2021">2021</option>
												<option value="3: 2020">2020</option>
												<option value="4: 2019">2019</option>
												<option value="5: 2018">2018</option>
											</select> <span class="box_arrow"><span
												class="ico_together ico_arrow"></span></span> <span
												class="select_option select_on"> 전체 </span>
										</div>
									</div>
									<div class="inner_box">
										<div class="opt_comm">
											<label for="opMeans" class="screen_out">기부방식</label> <select
												id="opMeans"
												class="opt_select ng-untouched ng-pristine ng-valid">
												<option value="">전체</option>
												<option value="1: 0">직접기부</option>
												<option value="2: 1">참여기부</option>
											</select> <span class="box_arrow"><span
												class="ico_together ico_arrow"></span></span> <span
												class="select_option select_on"> 전체 </span>
										</div>
									</div>
								</div>
							</div>
							<div class="area_receipt">
							<!---->
							</div>
						</div>
						</ng-component>
					</div>
				</div>
			</div>
			</user-header>
		</span>
		<%@ include file="../main/footer.jsp"%>
	</div>
</body>
</html>