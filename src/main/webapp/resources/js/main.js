// 로딩 이미지
var loadingImg = "<img src='//t1.kakaocdn.net/together_image/common/img_loading.gif' alt='로딩 중' class='img_loading'>";
// 새로고침 스크롤 위치
history.scrollRestoration = "manual";
//서비스안내 해쉬값
var serviceNotice = "#%EC%84%9C%EB%B9%84%EC%8A%A4%EC%95%88%EB%82%B4";
// 제안자안내 해쉬값
var suggestNotice = "#%EC%A0%9C%EC%95%88%EC%9E%90%EC%95%88%EB%82%B4";
// 캠페인안내 해쉬값
var campaignNotice = "#%EC%BA%A0%ED%8E%98%EC%9D%B8%EC%95%88%EB%82%B4";

var tit;

var page = 1;

var loadingList = false;

var tabNum = "";

// url 변경
function changeUrl(state, title, url){
	// 브라우저가 지원하는 경우
	if(typeof (history.pushState) != "undefined"){
		history.pushState(state, title, url);
	}
	// 브라우저가 지원하지 않는 경우
	else {
		// 페이지 이동 처리
		location.href = url;
	}
		
};

function autolink(id) {
	var container = document.getElementById(id);
	var doc = container.innerHTML;
	var regURL = new RegExp(
			"(http|https|ftp|telnet|news|irc)://([-/.a-zA-Z0-9_~#%$?&=:200-377()]+)",
			"gi");
	var regEmail = new RegExp(
			"([xA1-xFEa-z0-9_-]+@[xA1-xFEa-z0-9-]+\.[a-z0-9-]+)",
			"gi");
	var regImg = new RegExp(
			"<a href=\'(http|https|ftp|telnet|news|irc)://([-/.a-zA-Z0-9_~#%$?&=:200-377()]+)\.(jpg|png)' target='_blank'>(http|https|ftp|telnet|news|irc)://([-/.a-zA-Z0-9_~#%$?&=:200-377()]+)\.(jpg|png)</a>",
			"gi");

	container.innerHTML = doc
			.replace(regURL,
					"<a href='$1://$2' target='_blank'>$1://$2</a>")
			.replace(regEmail,
					"<a href='mailto:$1'>$1</a>")
			.replace(regImg,
					"<img src='$1://$2.$3' style='width: 770px;'>");
					
					autolink('view_body');
}

// 페이지 불러오기 https://kr.coderbridge.com/questions/798278bd133a42e7ae9fab14872d7616
function pageLoad(url, num){
	console.log("pageLoad 발동");
	console.log("pathname : "+location.pathname);
	
	$.ajax({
		url : url,
		type : "get",
		dataType : "html",
		success : function(html) {
			$($("router-outlet")[num]).next().replaceWith($(html).find("router-outlet:eq("+ num +")").next());
			},
			error : function() {
				alert("게시글 error");
				},
				complete : function() {					
					if(location.pathname == "/notices"){
						noticeList(tit, 1);	
					}
				}
				});
				};

// 공지사항 목록 불러오기
function noticeList(tit, page) {
	console.log("noticeList 발동");
	
	var titAndPage = {
		tit : tit,
		page : page
		}	
		$.ajax({
			url : "notices/noticeListSearch.do",
			type : "post",
			timeout : 5000,
			data : JSON.stringify(titAndPage),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			beforeSend : function() {
				$(".list_more").append(loadingImg);
				},
				success : function(list) {
					console.log(list);
					var html = "";
					if (list.length != 0) {
						list.forEach(function(data) {
							html += "<li><a class='link_official' href='/notices/"+ data.num + "'>";
							html += "<strong class='subject_official'>";
							// 상단 고정 아이콘
							if (data.fix == 0) {
								html += "<span class='icon_pin'></span>";
								}
								html += data.title + "</strong><span class='tit_official'>";
								switch (data.tit) {
									case 1:
									html += "서비스안내";
									break;
									case 2:
									html += "제안자안내";
									break;
									case 3:
									html += "캠페인안내";
									break;
									}
									// 날짜
									var date = new Date(data.date);
									var year = date.getFullYear();
									var month = (1 + date.getMonth());
									month = month >= 10 ? month : '0' + month;
									var day = date.getDate();
									day = day >= 10 ? day : '0' + day;
									var formatDate = year + '.' + month + '.' + day;
									html += "</span><span class='date_official'>" + formatDate + "</span></a></li>";					
									})
									$(".list_official").append(html);
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
																								
												// 게시물 링크 클릭
												$(".link_official").click(function(event){
													event.preventDefault();
													var url = $(this).attr("href");
													$("#dkContent").attr("class", "cont_etc");
													changeUrl("", "", url);
													pageLoad(url, 1);
													});
													}
													});
													};

// notice tab 라우터
function noticeTabRouter(){	
	$(".on").attr("class", "");
	
	$(".list_official").empty();
	
	switch (window.location.hash) {
		case serviceNotice:
		tit = 1;
		tabNum = "#tab_1 ";
		break;
		case suggestNotice:
		tit = 2;
		tabNum = "#tab_2 ";
		break;
		case campaignNotice:
		tit = 3;
		tabNum = "#tab_3 ";
		break;
		default:
		tit = 0;
		tabNum = "";
		break;
		}
		
		$("a[class='" + tabNum + "link_tab']").parent().attr("class", "on");
		
		if($("div").hasClass("group_official")){
			noticeList(tit, 1);
		} else {
			pageLoad(location.pathname, 1);
		}
		
}

// fundraising 라우터
function fundraisingRouter(url, sort, topicId) {
	
	$(".link_cate").click(function(event){
		event.preventDefault();
		url = "/fundraisings/now";
		switch($(this).find("span").text()) {
			case "전체":
			topicId = 0;
			break;
			case "어린이":
			topicId = 1;
			break;
			case "어르신":
			topicId = 2;
			break;
			case "장애인":
			topicId = 3;
			break;
			case "어려운이웃":
			topicId = 4;
			break;
			default:
			topicId = 0;
			break;
		}
		
		if(topicId != 0){
			url += "?sort="+ sort +"&topic_id="+ topicId;
			} else {
				url += "?sort="+ sort;
			}
		
		changeUrl("","",url);
		
		$(".on").attr("class", "");
		$(this).parent().attr("class", "on");
		
		$(".fund_raising").empty();
		fundraisingList(sort, topicId, 1);
		
		})
		
		$(".lab_sort").click(function(event){
		event.preventDefault();
		url = "/fundraisings/now";
		switch($(this).attr("for")) {
			case "sort0":
			sort = 1;
			break;
			case "sort1":
			sort = 2;
			break;
			default:
			sort = 1;
			break;
		}
		
		if(topicId != 0){
			url += "?sort="+ sort +"&topic_id="+ topicId;
			} else {
				url += "?sort="+ sort;
			}
		
		changeUrl("","",url);
		
		$(".sort_on").attr("class", "box_sorting");
		$(this).parent().attr("class", "box_sorting sort_on");
		
		$(".fund_raising").empty();
		fundraisingList(sort, topicId, 1);
		
		})
				
}

// 최초 이동 및 새로고침
window.onload = function() {
	console.log("onload 발동");
	console.log("pathname : "+location.pathname);
	
	switch(location.pathname){
		case "/notices":
		noticeTabRouter();
		noticeListScroll();
		break;
		case "/fundraisings/now":
		fundraisingList(1, 0, 1);
		fundraisingRouter("", 1, 0);
		break;
	}
	};

// 뒤로가기, 앞으로가기, 해쉬체인지 라우터
$(window).on("popstate", function(event){
	console.log("popstate 발동");
	var stateUrl = document.location.href;
	var sortOn;
	var topicOn;
	
	switch(stateUrl.slice(44,45)) {
		case "1":
		sortOn = "sort0";
		break;
		case "2":
		sortOn = "sort1";
		break;
		default:
		sortOn = "sort0";
		break;
	}
	
	switch(stateUrl.slice(55)) {
		case "0":
		topicOn = "all";
		break;
		case "1":
		topicOn = "children";
		break;
		case "2":
		topicOn = "silver";
		break;
		case "3":
		topicOn = "disabled";
		break;
		case "4":
		topicOn = "neighbor";
		break;
		default:
		topicOn = "all";
		break;
	}
	

	switch(location.pathname){
		case "/notices":
		$("#dkContent").attr("class", "cont_join");
		noticeTabRouter();
		break;
		case "/fundraisings/now":
		var sort = stateUrl.slice(44,45);
		var topicId = stateUrl.slice(55);
		
		if(sort == ""){
			sort = 1;
		}
		
		if(topicId == ""){
			topicId = 0;
		}
		
		$(".on").attr("class", "");
		$("#"+topicOn).parent().attr("class", "on");
		
		$(".sort_on").attr("class", "box_sorting");
		$("input[name="+sortOn+"]").parent().attr("class", "box_sorting sort_on");
		
		$(".fund_raising").empty();
		fundraisingList(sort, topicId, 1);
		break;
		default:
		pageLoad(location.pathname, 1);
		break;
		}
		
	});
				
$(function() {
	console.log("다큐먼트 레디 발동");
	console.log("pathname : "+location.pathname);
	
	var writeTab = document.getElementsByClassName('#tab_write');
	$(writeTab).hover(function() {
		$(this).parent().attr("class", "on");
		}, function() {
			$(this).parent().attr("class", "");
			});
			});

// 공지사항 목록 무한 스크롤
function noticeListScroll(){
				// 리스트 무한 스크롤
			$(window).scroll(function() {
				console.log("무한 스크롤 발동");
				var currentScroll = window.scrollY;
				var windowHeight = window.innerHeight;
				var bodyHeight = document.body.offsetHeight;
				
				if (((currentScroll + windowHeight) / bodyHeight * 100) > 75 && loadingList == true) {
					
					loadingList = false;
					page++;
					
					switch (window.location.hash) {
						case serviceNotice:
						tit = 1;
						break;
						case suggestNotice:
						tit = 2;
						break;
						case campaignNotice:
						tit = 3;
						break;
						default:
						tit = 0;
						break;
						}
						
						noticeList(tit, page);
						
						}
						})
}

function noticeFix(num){
	if($("#fix").is(":checked") == true){
		var fix = 0;
		//$("label[for='fix']").parent().attr("class", "on");
	} else {
		var fix = 1;
		//$("label[for='fix']").parent().attr("class", "");
	}
	console.log(fix);
	console.log(num);
	$.ajax({
			url : "noticeFix.do",
			type : "put",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify({
				fix : fix,
				num : num
			}),
			dataType : "json",
			success : function(str) {
				alert(str.execute);
			},
			error : function(){
				alert("error");
			}
		})
};

function noticeDelete(num){
		var confirmDelete = confirm("정말로 삭제하시겠습니까?");
		if(confirmDelete){
		$.ajax({
			url : "/noticeDelete.do",
			type : "post",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(num),
			dataType : "json",
			success : function(str){
				alert(str.execute);
				window.location.href = "/notices";
			},
			error : function(){
				alert("error");
			}
		})
		}else{
			return;
		}
}