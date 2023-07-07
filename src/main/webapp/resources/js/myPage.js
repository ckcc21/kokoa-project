var year = "";
var means ="";

var donationList = function donationListSearch(year, means) {
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
			$(".list_receipt").empty();
		},
		success : function(list) {
			var donateNumInfo = "";
			list.forEach(function(data) {
				donateNumInfo += "<li class='item_donate'><p class='txt_sumdata'>" + data.date + "</p>";
				donateNumInfo += "<p class='tit_sum'><a class='link_sum' href='#'>" + data.title + "</a></p>";
				donateNumInfo += "<div class='donate_numinfo'>";
				if (data.directMoney != 0) {
					donateNumInfo += "<strong class='num_sumprice'>" + data.directMoney + "원</strong>";
					donateNumInfo += "<span class='txt_sumprice'> 직접기부 </span>";
				} else if (data.likeMoney != 0) {
					donateNumInfo += "<strong class='num_sumprice'>" + data.likeMoney + "원</strong>";
					donateNumInfo += "<span class='txt_sumprice'> 참여기부 (응원참여) </span>";
				} else if (data.shareMoney != 0) {
					donateNumInfo += "<strong class='num_sumprice'>" + data.shareMoney + "원</strong>";
					donateNumInfo += "<span class='txt_sumprice'> 참여기부 (공유참여) </span>";
				} else if (data.replyMoney != 0) {
					donateNumInfo += "<strong class='num_sumprice'>" + data.replyMoney + "원</strong>";
					donateNumInfo += "<span class='txt_sumprice'> 참여기부 (댓글참여) </span>";
				} else {
					donateNumInfo += "<p class='txt_nodata'>기부내역이 없습니다.</p>"
				}
				donateNumInfo += "</div><div class='box_link'></div></li>";
			})
			$(".list_receipt").append(donateNumInfo);
		}
	})
};

$(function(){
	$("#opPeriod").on("change", function(){
		if(this.value != ""){
			year = this.value.slice(3);
		}
		donationList(year, means);
	})
	
	$("#opMeans").on("change", function(){
		if(this.value != ""){
			means = this.value.slice(3);
		}
		donationList(year, means);
	})
});