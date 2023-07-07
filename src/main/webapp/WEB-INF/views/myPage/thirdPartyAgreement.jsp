<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<base href="/">
<meta charset="UTF-8">
<title>제 3자 정보 제공 동의 : 코코아같이가치</title>
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/common.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/myPage.css">
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

function donationHTML(pathName) {
		$.ajax({
			url : "${contextPath }/my/donations",
			type : "get",
			dataType : "html",
			success : function(html) {
				switch(pathName){
				case "${contextPath }/my":
					$(".mypage_cont").attr("class","donate_cont");
				$(".area_setting").remove();
				$("user-profile").replaceWith($(html).find("ng-component"));
				break;
				default:
					$("ng-component").replaceWith($(html).find("user-header"));
				break;
				}
				donationList("", "");
			},
			error : function() {
				alert("error");
			},
			complete : function() {
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

function preferenceHTML(pathName){
	$.ajax({
		url : "${contextPath}/preferences",
		type : "get",
		dataType : "html",
		success : function(html){
			switch(pathName){
			case "${contextPath}/preferences":
				$("ng-component").replaceWith($(html).find("ng-component"));
				break;
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

window.onload = function() {
	pathName = history.state;

}

window.onpopstate = function(event) {		
// 	console.log("pathName : " + pathName);
// 	console.log("location.pathname : " + location.pathname);
	switch(location.pathname){
	case "${contextPath }/my":
		myPageHTML(pathName);
	pathName = "${contextPath }/my";
	break;
	case "${contextPath }/my/donations":
		donationHTML(pathName);
		pathName = "${contextPath }/my/donations";
	break;
	case "${contextPath }/preferences":
		preferenceHTML(pathName);
		pathName = "${contextPath }/preferences";
	break;
	case "${contextPath }/preferences/third-party-agreement":
		thirdPartyAgreement(pathName);
		pathName = "${contextPath }/preferences/third-party-agreement";
	break;
	default :
		location.href = "${contextPath }/" + location.pathname;
	break;
	}
}
</script>
</head>
<body>
	<div id="dkWrap">
		<%@ include file="../main/header.jsp"%>
		<span id="rootContent">
		<router-outlet></router-outlet>
		<ng-component>
			<div id="dkContent">
				<div id="mArticle">
					<div class="ppi_info">
						<h3 class="tit_ppi">개인정보 제 3자 제공 동의</h3>
						<p class="txt_ppi provide_none">현재, 회원님의 개인정보를 제 3자에게 제공하고 있지
							않습니다. 서비스 이용 중 제 3자 정보 제공에 동의하신 경우에만 개인정보가 제공되며 본 메뉴를 통해 제공 중인
							파트너사를 열람할 수 있습니다.</p>
					</div>
				</div>
			</div>
			</ng-component>
		</span>
		<%@ include file="../main/footer.jsp"%>
	</div>
</body>
</html>