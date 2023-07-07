<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기 : 코코아같이가치</title>
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/common.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/notice.css">
<style type="text/css">
.wrap_writeForm {
	padding-bottom: 100px;
	width: 700px;
	margin: 0 auto;
	padding-top: 40px;
}

.write_head {
	display: table;
	width: 700px;
	margin: 0 auto;
	padding: 0 0 25px;
	text-align: center;
}

.write_title, .notice_content {
	display: flex;
	flex-direction: column;
	font-size: 20px;
	font-weight: bold;
	justify-content: center;
	text-align: center;
	height: 25%;
	padding: 12px 10px;
}

.notice_writeTitle {
	border-radius: 2rem;
	height: 25px;
	padding: 12px 10px;
	display: table;
}

.notice_writeTitle #title {
	width: 650px;
	height: 50px;
	border: 1px solid #e0e0e0;
	font-weight: 400;
	font-family: sans-serif;
	font-size: 20px;
	color: #444;
	padding-left: 25px;
	border-radius: 5px;
}

.write_radio {
	padding-left: 85px;
	min-height: 44px;
	overflow: hidden;
	position: relative;
	width: 551px;
	font-size: 16px;
	align-items: center;
}

.write_content {
	padding-bottom: 12px;
}

.sep_choice {
	float: left;
	margin: 0 -1px;
	display: block;
	position: relative;
}

.sep_choice:first-child {
	width: 181px;
	margin-left: 0;
}

.sep_choice:nth-child(2) {
	width: 178px;
}

.sep_choice:nth-child(3) {
	width: 195px;
}

.sep_choice .sepChoice_btn {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 10;
	width: 100%;
	height: 100%;
	vertical-align: top;
	outline: none;
	opacity: .01;
}

.sep_choice .sep_txt {
	display: block;
	height: 44px;
	border: 1px solid #e0e0e0;
	line-height: 45px;
	color: #444;
	background-color: #fafafa;
	text-align: center;
}

.sep_choice .sepChoice_btn .sep_txt {
	padding: 0;
}

.sep_choice .sepChoice_btn:checked+.sep_txt {
	position: relative;
	z-index: 1;
	border-color: #e7e7e7;
	background-color: #ddd;
}

.notice_writeContent {
	border: 1px solid #e7e7e7;
	border-radius: 1rem;
	height: 400px;
	padding: 15px 10px;
}

.notice_save {
	display: inline-block;
	height: 40px;
	padding: 0 17px;
	border: 1px solid #e7e7e7;
	border-radius: 20px;
	font-size: 17px;
	line-height: 38px;
	font-family: sans-serif;
	box-sizing: border-box;
	vertical-align: top;
	background-color: white;
}

.notice_save:hover {
	cursor: pointer;
	background-color: #eee;
}

.notice_save:focus {
	outline: none;
}
</style>
<script type="text/javascript"
	src="./resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div id="dkWrap">
		<%@ include file="../main/header.jsp"%>
		<span id="rootContent">
			<div id="dkContent">
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
					<div class="wrap_writeForm">
						<div class="write_head">
							<form id="noticeWriteForm" action="noticeWriteSave" method="post"
								enctype="utf-8" autocomplete="off">
								<div class="write_title">
									<div class="notice_title">제 목</div>
									<div class="notice_writeTitle">
										<input type="text" size="100" id="title" name="title">
									</div>
								</div>
								<div class="write_radio">
									<span class="sep_choice"><input type="radio"
										class="sepChoice_btn" id="sep1" name="sep" value="1" checked><label
										for="sep1" class="sep_txt">서비스안내</label></span> <span
										class="sep_choice"><input type="radio"
										class="sepChoice_btn" id="sep2" name="sep" value="2"><label
										for="sep2" class="sep_txt">제안자안내</label></span> <span
										class="sep_choice"><input type="radio"
										class="sepChoice_btn" id="sep3" name="sep" value="3"><label
										for="sep3" class="sep_txt">캠페인안내</label></span>
								</div>
								<div class="write_content">
									<div class="notice_content">내 용</div>
									<textarea id="smartEditor" class="notice_writeContent"
										name="content" style="width: 100%;"></textarea>
								</div>
								<input class="notice_save" id="saveButton" type="button"
									value="저장">
							</form>
						</div>
					</div>
				</div>
			</div>
		</span>
	</div>
	<%@ include file="../main/footer.jsp"%>
</body>
<script type="text/javascript">
	// https://wooaoe.tistory.com/35
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smartEditor",
		sSkinURI : "./resources/smarteditor/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,

			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,

			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true
		}
	});

	$(function() {
		$("#saveButton").click(
				function() {
					oEditors.getById["smartEditor"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					//textarea의 id를 적어줍니다.

					var title = $("#title").val();
					var content = document.getElementById("smartEditor").value;

					if (title == null || title == "") {
						alert("제목을 입력해주세요.");
						$("#title").focus();
						return;
					}
					if (content == "" || content == null || content == '&nbsp;'
							|| content == '<br>' || content == '<br/>'
							|| content == '<p>&nbsp;</p>') {
						alert("본문을 작성해주세요.");
						oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
						return;
					} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.

					var confirmWrite = confirm("등록하시겠습니까?");

					if (confirmWrite) {
						alert("게시물이 등록되었습니다.");
						$("#noticeWriteForm").submit();
					} else {
						return;
					}
				});
	})
</script>
</html>