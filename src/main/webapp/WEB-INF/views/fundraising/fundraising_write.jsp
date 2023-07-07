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
<script type="text/javascript"
	src="${contextPath }/resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
.wrap_suggest, .wrap_suggest .form_cont {
	padding-bottom: 80px;
}

.group_apply .area_form {
	width: 700px;
	margin: 50px auto 0;
}

.group_apply .tit_head {
	display: block;
	font-weight: 400;
	font-size: 20px;
	line-height: 26px;
	color: #444;
	font-family: sans-serif;
	box-sizing: border-box;
}

.group_apply .tit_head .ico_new {
	display: inline-block;
	margin: 5px 0 0 1px;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #dc287c;
	line-height: 0;
	text-indent: -9999px;
	vertical-align: top;
}

.group_apply .sub_head {
	margin-top: 8px;
	font-size: 14px;
	line-height: 23px;
	color: #444;
}

.group_apply .desc_form {
	margin-top: 16px;
}

.group_apply .group_tf {
	overflow: hidden;
	position: relative;
}

.group_apply .area_form .group_tf_title {
	width: 400px;
}

.group_apply .area_form .group_tf_content {
	width: 700px;
}

.tf_write {
	float: left;
	height: 44px;
	padding: 9px 13px;
	border: 1px solid #e8e8e8;
	border-radius: 2px;
	font-size: 16px;
	color: #444;
	background-color: #fafafa;
	box-sizing: border-box;
	outline: none;
}

html input[type=button], input[type=email], input[type=number], input[type=password],
	input[type=reset], input[type=search], input[type=submit], input[type=tel],
	input[type=text], input[type=url] {
	border-radius: 0;
}

.group_apply .group_tf .tf_write {
	width: 100%;
}

.group_apply .area_form .tf_write {
	width: 100%;
}

.area_form .box_select {
	overflow: hidden;
}

.opt_comm {
	display: inline-block;
	overflow: hidden;
	position: relative;
	z-index: 0;
	width: 100%;
	height: 44px;
	padding: 0;
	border: 1px solid #e8e8e8;
	border-radius: 2px;
	font-size: 12px;
	line-height: 44px;
	background-color: #fdfdfd;
	box-sizing: border-box;
	text-align: left;
}

.area_form .box_select .opt_comm {
	float: left;
	width: 197px;
	height: 44px;
	font-size: 16px;
	line-height: 42px;
}

.opt_comm .select_option {
	overflow: hidden;
	right: 0;
	margin: 0 30px 0 12px;
	padding: 0;
	line-height: 44px;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.opt_comm .opt_select, .opt_comm .select_option {
	position: absolute;
	left: 0;
	font-size: 16px;
	color: #444;
}

.opt_comm .opt_select {
	display: block;
	z-index: 10;
	top: 0;
	height: 44px;
	width: 100%;
	border: 0;
	background: none;
	opacity: .01;
}

.group_schproject .opt_comm .box_arrow, .opt_comm .opt_select {
	height: 100%;
}

.opt_comm .box_arrow {
	position: absolute;
	right: 0;
	width: 29px;
	height: 44px;
	background-color: #fff;
}

.ico_together {
	background:
		url(//t1.kakaocdn.net/together_image/common/ico_together_201008.png)
		no-repeat 0 0;
}

.ico_together, .ico_together2 {
	display: block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

.opt_comm .ico_arrow {
	width: 12px;
	height: 8px;
	margin: 17px 0 0 7px;
	background-position: -236px -116px;
}

.form_manage .list_write {
	position: relative;
	width: 700px;
	margin: 0 auto;
	font-size: 16px;
}

.group_apply .desc_form {
	margin-top: 16px;
}

.group_apply .area_form .file_upload {
	position: relative;
	width: 398px;
	height: 350px;
	border: 1px solid #e0e0e0;
	background-color: #fafafa;
}

.img_thumb {
	display: block;
}

.list_write .img_thumb {
	float: left;
	width: 100%;
	height: 100%;
	margin: -1px 0 0 -1px;
	border: 1px solid #e0e0e0;
}

.list_write .box_add {
	overflow: hidden;
	display: block;
	position: relative;
	width: 400px;
	height: 44px;
	margin-top: 12px;
	border: 1px solid #e8e8e8;
	border-radius: 2px;
	font-size: 15px;
	color: #626262;
	line-height: 42px;
	text-indent: 54px;
	box-sizing: border-box;
}

.group_apply .desc_attach .box_add {
	margin-top: 6px;
}

.box_add .ico_attach {
	position: absolute;
	top: 12px;
	left: 11px;
	width: 20px;
	height: 20px;
	background-position: -496px -72px;
}

.box_add .attach_lab {
	font-size: 15px;
}

.box_add .tf_attach {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 10;
	width: 100%;
	height: 100%;
	border: 0;
	opacity: 0;
	cursor: pointer;
	outline: 0 none;
}

.box_add:after {
	position: absolute;
	top: 0;
	left: 42px;
	width: 1px;
	height: 100%;
	background-color: #eee;
	content: "";
}
</style>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0] // 여기에 파일에 대한 정보가 있다.
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일의 정보를 토대로 파일을 읽고
			reader.onload = function(e) { // 파일을 로드한 값을 표현한다.
				// e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
				$('.img_thumb').attr('style', "");
				$('.img_thumb').attr('src', e.target.result);
			}
		}
	}

	$(function() {
		var checkedOption = "";
		$("#selectTarget").on("change", function() {
			switch (this.value) {
			case "1":
				checkedOption = "어린이";
				break;
			case "2":
				checkedOption = "어르신";
				break;
			case "3":
				checkedOption = "장애인";
				break;
			case "4":
				checkedOption = "어려운이웃";
				break;
			default:
				checkedOption = "대상 선택";
				break;
			}
			let selectOption = document.getElementsByClassName("select_on")[0];
			selectOption.innerText = checkedOption;
		});
		$(".link_step").click(function(event) {
			const form = document.form;
			form.method = "post";
			form.action = action = "${contextPath }/fundraisings/writeSave";
			form.submit();
		});
		CKEDITOR.replace('fundraising_content', {
			height : '500px',
			filebrowserUploadUrl : '${contextPath}/fundraisings/fileUpload.do'
		});

	});
</script>
</head>
<body>
	<div id="dkWrap">
		<%@ include file="../main/header.jsp"%>
		<span id="rootContent"> <router-outlet></router-outlet> <ng-component>
			<div id="dkContent" class="cont_suggest">
				<div id="mArticle">
					<router-outlet></router-outlet>
					<ng-component>
					<div class="wrap_suggest">
						<form name="form" enctype="multipart/form-data" autocomplete="off">
							<fieldset>
								<div class="form_cont">
									<div class="group_apply">
										<div class="area_form">
											<strong class="tit_head">프로젝트팀 이름 <span
												class="ico_new">new</span>
											</strong>
											<p class="sub_head">프로젝트팀 이름은 제안자 이름으로 등록됩니다. 프로젝트팀 이름을
												입력해주세요.</p>
											<div class="desc_form">
												<div class="group_tf group_tf_title">
													<input name="proposer" type="text" id="proposer"
														placeholder="프로젝트를 진행하는 팀 명칭을 작성해주세요." maxlength="128"
														class="tf_write ng-untouched ng-pristine ng-valid">
												</div>
											</div>
										</div>
										<!---->
										<div class="area_form">
											<strong class="tit_head">대상 선택 <span class="ico_new">new</span>
											</strong>
											<p class="sub_head">모금함 개설 후 변경 불가! 신중하게 선택해주세요.</p>
											<div class="desc_form box_select">
												<div class="opt_comm">
													<span class="select_option select_on">대상 선택</span> <select
														name="topicId" id="selectTarget"
														class="opt_select ng-untouched ng-pristine ng-valid">
														<option value="">대상 선택</option>
														<option value="1">어린이</option>
														<option value="2">어르신</option>
														<option value="3">장애인</option>
														<option value="4">어려운이웃</option>
													</select> <span class="box_arrow"> <span
														class="ico_together ico_arrow"></span>
													</span>
												</div>
											</div>
										</div>
										<!---->
										<div class="area_form">
											<strong class="tit_head">제목 <span class="ico_new">new</span>
											</strong>
											<p class="sub_head">모금함에 사용될 제목을 입력해주세요.</p>
											<div class="desc_form">
												<div class="group_tf group_tf_title">
													<input name="title" type="text" id="title"
														placeholder="모금함의 제목을 작성해주세요." maxlength="128"
														class="tf_write ng-untouched ng-pristine ng-valid">
												</div>
											</div>
										</div>
										<!---->
										<div class="area_form">
											<strong class="tit_head">목표 금액 <span class="ico_new">new</span>
											</strong>
											<p class="sub_head">모금함의 목표 금액 설정해주세요. 모금액이 목표 금액에 미치지 못할
												수 있으며 초과할 수도 있습니다.</p>
											<div class="desc_form">
												<div class="group_tf group_tf_title">
													<input name="goal" type="text" id="goal"
														placeholder="목표 금액을 작성해주세요." maxlength="128"
														class="tf_write ng-untouched ng-pristine ng-valid">
												</div>
											</div>
										</div>
										<!---->
										<div class="area_form">
											<strong class="tit_head">대표 이미지 <span
												class="ico_new">new</span>
											</strong>
											<p class="sub_head">모금함을 대표할 수 있는 이미지를 등록해주세요.</p>
											<div class="desc_form desc_attach list_write">
												<div class="group_tf file_upload">
													<img alt="대표 이미지" style="display: none;" src=""
														class="img_thumb">
												</div>
												<div class="box_add">
													<span class="ico_together ico_attach"></span> <label
														class="attach_lab">첨부하기</label>
													<!---->
													<!---->
													<input type="file" name="img" class="tf_attach"
														accept="image/*, .jpg, .jpeg, .png, .gif, .bmp"
														onchange="readURL(this);" />
												</div>
											</div>
										</div>
										<!---->
										<div class="area_form">
											<strong class="tit_head">종료 날짜 <span class="ico_new">new</span>
											</strong>
											<p class="sub_head">모금함이 종료될 날짜를 지정해주세요.</p>
											<div class="desc_form">
												<div class="group_tf group_tf_title">
													<input name="endDate" type="date" maxlength="128"
														class="tf_write ng-untouched ng-pristine ng-valid">
												</div>
											</div>
										</div>
										<!---->
										<div class="area_form">
											<strong class="tit_head">글작성 <span class="ico_new">new</span>
											</strong>
											<p class="sub_head">모금함의 내용을 작성해주세요. 이미지도 첨부해주시면 좋습니다.</p>
											<div class="desc_form">
												<div class="group_tf group_tf_content">
													<textarea id="fundraising_content"
														class="fundraising_content" name="content"></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="btn_step step_type1 btn_float btn_static">
									<button type="button" class="link_step link_type3 #save">
										등록</button>
								</div>
							</fieldset>
						</form>
					</div>
					</ng-component>
				</div>
			</div>
			</ng-component>
		</span>
		<%@ include file="../main/footer.jsp"%>
	</div>
</body>
</html>