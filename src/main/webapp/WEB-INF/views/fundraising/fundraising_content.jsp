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
<title>${fundraisingDTO.title }:카카오같이가치</title>
<meta name="viewport" content="width=device-width">
<link type="text/css" rel="stylesheet"
	href="${contextPath }/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.wrap_visual {
	position: relative;
	width: 100%;
	height: 376px;
	margin-bottom: 20px;
}

.wrap_visual .cont_visual {
	display: table;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-color: #666;
	background-position: 50% 50%;
	table-layout: fixed;
}

.wrap_visual .front_pack {
	display: table-cell;
	position: relative;
	z-index: 10;
	text-align: center;
	vertical-align: middle;
}

.link_tag, .tag_group {
	text-align: center;
}

.wrap_visual .tit_visual {
	width: 620px;
	max-height: 100px;
	margin: auto;
	font-weight: 400;
	font-size: 32px;
	line-height: 44px;
	font-family: sans-serif;
	color: #fff;
}

/* fundraising_now 중복 */
.ellipsis_type1, .ellipsis_type2 {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
}

.ellipsis_g {
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	word-break: break-all;
}

.wrap_visual .txt_sponsor {
	width: 620px;
	max-height: 57px;
	margin: 0 auto 55px;
	padding-top: 7px;
	font-size: 15px;
	color: #fff;
	opacity: .6;
}

.wrap_visual .tag_group {
	display: block;
	margin-bottom: 16px;
}

.wrap_visual:after {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	bottom: -1px;
	background-image:
		url(//t1.kakaocdn.net/together_image/common/bg_cover_190613.png);
	background-repeat: no-repeat;
	background-position: 50% 100.5%;
	background-color: #0006;
	content: "";
}

.wrap_subject {
	overflow: hidden;
	position: relative;
}

.cont_subject {
	width: 700px;
	margin: 0 auto;
}

.cont_subject .tit_subject {
	display: block;
	font-weight: 400;
	font-size: 20px;
	font-family: KakaoBig Bold, sans-serif;
	color: #444;
	word-break: break-all;
}

.cont_subject .tit_subject {
	margin-top: 48px;
}

.cont_subject .photo_slide+.tit_subject {
	margin-top: 54px;
}

.cont_subject .desc_subject {
	margin-top: 5px;
}

.photo_slide {
	position: relative;
	height: auto;
	margin-top: 28px;
}

.cont_subject .photo_slide {
	margin-top: 28px;
}

.photo_slide .inner_photo {
	overflow: hidden;
	position: relative;
	height: 424px;
	color: #6b6b6b;
}

.photo_slide .list_photo {
	position: absolute;
	top: 0;
	left: 0;
	height: 424px;
}

.photo_slide .list_photo li {
	float: left;
	height: 100%;
	background: #fff;
}

.photo_slide .list_photo .img_slide {
	display: block;
	height: 394px;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover;
}

.photo_slide .list_photo .txt_caption {
	display: block;
	overflow: hidden;
	padding-top: 9px;
	font-size: 15px;
	color: #999;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.photo_slide .paging_slide {
	position: absolute;
	top: 0;
	left: 50%;
	width: 700px;
	height: 394px;
	margin-left: -350px;
	color: #cacaca;
	text-align: center;
}

.paging_slide .num_paging {
	display: inline-block;
	margin-top: 355px;
	padding: 2px 7px;
	border-radius: 25px;
	font-size: 13px;
	color: #fff;
	background: #00000080;
}

.paging_slide .num_page {
	float: left;
	width: auto;
	padding: 0;
	margin-right: 4px;
}

.paging_slide .btn_prev {
	position: absolute;
	top: 0;
	left: -65px;
	width: 100px;
	height: 100%;
}

.ico_together, .ico_together2 {
	display: block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

.ico_together2 {
	background:
		url(//t1.kakaocdn.net/together_image/common/ico_together2_210820.png)
		no-repeat 0 0;
}

.paging_slide .ico_prev {
	left: 0;
	margin: -20px 0 0 15px;
	background-position: -180px -835px;
}

.paging_slide .ico_next, .paging_slide .ico_prev {
	position: absolute;
	top: 50%;
	width: 23px;
	height: 40px;
}

.paging_slide .btn_next {
	position: absolute;
	top: 0;
	right: -65px;
	width: 100px;
	height: 100%;
}

.paging_slide .ico_next {
	right: 0;
	margin: -20px 15px 0 0;
	background-position: -205px -835px;
}

.cont_subject .desc_subject {
	font-size: 16px;
	line-height: 30px;
	color: #444;
	white-space: pre-line;
	word-break: break-all;
}

.info_state {
	width: 800px;
	margin: 0 auto;
	padding-bottom: 86px;
}

.info_story+.info_state {
	margin-top: -23px;
}

.cont_project .info_state {
	position: relative;
	width: 100%;
	margin: 0 auto;
	padding-bottom: 250px;
}

.total_fund {
	display: block;
	font-size: 30px;
	color: #dc287c;
	text-align: center;
}

.cont_project .total_fund {
	font-weight: 400;
	font-size: 50px;
	font-family: sans-serif;
}

.cont_project .total_fund .txt_won {
	font-size: 17px;
	font-family: KakaoBig Regular, sans-serif;
}

.cont_project .txt_goal {
	display: block;
	padding-top: 1px;
	font-size: 17px;
	text-align: center;
}

.chart_fund {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 317px;
	border-bottom: 1px solid #fff;
	background:
		url(//t1.kakaocdn.net/together_image/common/bg_fund_graph.png)
		repeat-x 0 0;
}

.cont_project .chart_fund {
	bottom: 30px;
	height: 220px;
	background-size: 465px 213px;
}

#animate-area {
	animation: animatedBackground 60s linear infinite;
	-moz-animation: animatedBackground 60s linear infinite;
	-webkit-animation: animatedBackground 60s linear infinite;
	-ms-animation: animatedBackground 60s linear infinite;
	-o-animation: animatedBackground 60s linear infinite;
}

.chart_fund .progress_road {
	display: block;
	position: relative;
	width: 693px;
	height: 100%;
	margin: 0 auto;
}

.cont_project .chart_fund .progress_road {
	width: 700px;
}

.chart_fund .mark_pack {
	display: block;
	position: absolute;
	bottom: 0;
	height: 100px;
}

.pack_type1 .mark_pack {
	left: -161px;
	width: 843px;
}

.cont_project .pack_type1 .mark_pack, .cont_project .pack_type2 .mark_pack
	{
	left: -5px;
	width: 700px;
}

.chart_fund .inner_mark_pack {
	display: block;
	position: relative;
	height: 100%;
}

.pack_type1 .inner_mark_pack {
	margin-right: 197px;
}

.cont_project .pack_type1 .inner_mark_pack, .cont_project .pack_type2 .inner_mark_pack
	{
	margin-right: 145px;
}

.chart_fund .mark_point {
	position: absolute;
	left: 0;
	top: auto;
}

.pack_type1 .mark_point {
	bottom: 26px;
	width: 230px;
	height: 230px;
	background-image:
		url(//t1.kakaocdn.net/together_image/walk_move_ing_221018.gif);
}

.cont_project .pack_type1 .mark_point, .cont_project .pack_type2 .mark_point
	{
	bottom: 1px;
	width: 165px;
	height: 165px;
	background-size: 165px 165px;
}

.info_state .ico_chart {
	background-image:
		url(//t1.kakaocdn.net/together_image/common/img_chart.png);
	background-repeat: no-repeat;
}

.chart_fund .txt_result {
	position: absolute;
	width: 60px;
	height: 64px;
	padding-right: 14px;
	font-size: 26px;
	line-height: 59px;
	font-family: sans-serif;
	font-weight: bold;
	color: #fff;
	background-position: 0 0;
	text-align: center;
}

.pack_type1 .txt_result {
	top: -24px;
	right: 52px;
}

.pack_type1 .txt_result {
	top: -22px;
	right: 11px;
}

.cont_project .info_state .ico_chart {
	background-size: 510px 91.5px;
}

.cont_project .chart_fund .txt_result {
	width: 45px;
	height: 48px;
	font-size: 20px;
	line-height: 44px;
	font-family: sans-serif;
	font-weight: bold;
}

.chart_fund .txt_result .num_per {
	margin-left: -1px;
}

.chart_fund .txt_per {
	display: block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

.chart_fund .graph_road {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 32px;
	border-bottom: 1px solid #e5e5e5;
	background-color: #f0f1f2;
}

.cont_project .chart_fund .graph_road {
	height: auto;
	border: 0;
	background: none;
}

.chart_fund .graph_bar {
	display: block;
	width: 100%;
	height: 10px;
	background-color: #dadbdc;
}

.cont_project .chart_fund .graph_bar {
	width: 700px;
	height: 6px;
	margin: 0 auto;
	border-radius: 5px;
}

.chart_fund .inner_graph_bar {
	display: block;
	position: relative;
	width: 753px;
	height: 10px;
	margin: 0 auto;
}

.cont_project .chart_fund .inner_graph_bar {
	width: 700px;
	height: 6px;
}

.chart_fund .sign_graph {
	position: absolute;
	top: 0;
	left: 0;
	width: 11px;
	height: 10px;
	border-radius: 5px;
}

.pack_type1 .sign_graph, .pack_type2 .sign_graph {
	background-color: #238bd6;
}

.cont_project .chart_fund .sign_graph {
	height: 6px;
}

.cont_project .pack_type1 .sign_graph, .cont_project .pack_type2 .sign_graph
	{
	background-color: #444;
}

.detail_fund {
	overflow: hidden;
	width: 394px;
	margin: 20px auto 0;
}

.detail_fund dt {
	overflow: hidden;
	position: relative;
	float: left;
	width: 254px;
	height: 30px;
	font-size: 17px;
	line-height: 30px;
	color: #444;
	text-align: left;
}

.detail_fund dd {
	overflow: hidden;
	position: relative;
	float: right;
	width: 140px;
	height: 30px;
	font-size: 17px;
	line-height: 30px;
	color: #444;
	text-align: right;
}

.detail_fund+.detail_fund {
	margin-top: 5px;
}

.detail_fund.fund_belong {
	margin-top: 3px;
}

.detail_fund dt {
	overflow: hidden;
	position: relative;
	float: left;
	width: 254px;
	height: 30px;
	font-size: 17px;
	line-height: 30px;
	color: #444;
	text-align: left;
}

.detail_fund.fund_belong dt {
	height: 24px;
	font-size: 14px;
	line-height: 24px;
}

.detail_fund dd {
	overflow: hidden;
	position: relative;
	float: right;
	width: 140px;
	height: 30px;
	font-size: 17px;
	line-height: 30px;
	color: #444;
	text-align: right;
}

.detail_fund.fund_belong dd {
	height: 24px;
	font-size: 14px;
	line-height: 24px;
	color: #444;
}

.detail_fund {
	overflow: hidden;
	width: 394px;
	margin: 20px auto 0;
}

.detail_fund+.detail_fund {
	margin-top: 5px;
}

.wrap_plan {
	overflow: hidden;
}

.cont_plan {
	position: relative;
	margin: 15px 0 0;
}

.cont_plan .inner_plan {
	position: relative;
	width: 700px;
	padding: 0;
	margin: 0 auto;
}

.story_date {
	overflow: hidden;
	margin: 3px 0 12px;
	font-size: 14px;
	line-height: 24px;
	color: #444;
}

.story_date .tit_date {
	float: left;
	margin-right: 4px;
	font-weight: 400;
	clear: both;
}

.story_date .txt_date {
	float: left;
}

.wrap_cmt {
	width: 700px;
	margin: 0 auto;
	background-color: #f5f5f5;
}

.write_cmt {
	padding: 32px 0 58px;
	background-color: #fff;
}

.cmt_type3 .write_cmt {
	padding-bottom: 60px;
	border-bottom: 1px solid #e8e8e8;
}

.cont_memory .write_cmt, .cont_mind .write_cmt, .cont_project .write_cmt,
	.cont_yearbest .write_cmt {
	padding-top: 57px;
}

.write_cmt .inner_write {
	width: 700px;
	margin: 0 auto;
}

.write_cmt .info_append {
	margin-bottom: 18px;
	font-size: 19px;
	font-family: sans-serif;
	font-weight: bold;
}

.cmt_type3 .write_cmt .info_append {
	padding-bottom: 10px;
	border-bottom: 1px solid #e8e8e8;
	font-size: 20px;
	font-family: sans-serif;
	font-weight: bold;
}

.write_cmt .info_append .txt_heading {
	color: #444;
}

.emph_sign {
	color: #dc287c;
}

.link_profile {
	display: block;
	overflow: hidden;
	position: relative;
	width: 58px;
	height: 58px;
	font-size: 0;
	line-height: 0;
	border-radius: 50%;
	text-indent: -9999px;
}

.write_cmt .link_profile {
	float: left;
	width: 54px;
	height: 54px;
}

.img_thumb {
	display: block;
}

.link_profile .img_thumb {
	width: 54px;
	height: 54px;
	border-radius: 50%;
}

.write_cmt .cmt_info {
	margin-left: 64px;
}

.write_cmt .txt_cmt {
	display: block;
	position: relative;
	margin-top: 6px;
	padding: 12px 11px 16px;
	border: 1px solid #e0e0e0;
	border-radius: 2px;
	font-size: 15px;
	color: #444;
	background-color: #fafafa;
}

.cmt_type3 .write_cmt .txt_cmt {
	padding-left: 14px;
	padding-right: 14px;
	border: none;
	border-radius: 9px;
	background-color: #f7f8f9;
}

.fld_cmt .tf_cmt {
	overflow: hidden;
	width: 100%;
	height: 26px;
	font-size: 16px;
	line-height: 26px;
	color: #444;
	border: 0;
	background-color: #fafafa;
	resize: none;
	outline: none;
}

.cmt_type3 .fld_cmt .tf_cmt {
	height: 42px;
	font-size: 15px;
	line-height: 24px;
	background-color: #f7f8f9;
}

.cmt_type3 .fld_cmt .tf_cmt:disabled {
	opacity: 1;
}

.write_cmt .btn_comment {
	position: absolute;
	bottom: -39px;
	right: 0;
	width: 88px;
	height: 34px;
	border-radius: 2px;
	font-size: 15px;
	line-height: 34px;
	color: #fff;
	background-color: #828282;
}

.cmt_type3 .write_cmt .btn_comment {
	bottom: -40px;
	width: 80px;
	height: 35px;
	border-radius: 18px;
	line-height: 35px;
	background-color: #999;
}

.wrap_info {
	border-top: 1px solid #e6e6e6;
	font-size: 17px;
	text-align: left;
	background-color: #fff;
}

.cmt_type3 .wrap_info {
	border-top: none;
}

.wrap_info .inner_info {
	position: relative;
	width: 700px;
	padding: 17px 0 0;
	margin: 0 auto -2px;
}

.cmt_type3 .wrap_info .inner_info {
	padding-top: 12px;
}

.wrap_info .txt_cmt {
	color: #444;
	font-family: sans-serif;
	font-weight: bold;
}

.cmt_type3 .wrap_info .txt_cmt {
	font-size: 20px;
}

.emph_sign {
	color: #dc287c;
}

.wrap_info .emph_sign {
	position: relative;
}

.list_cmt {
	background-color: #fff;
}

.wrap_cmt .list_cmt {
	padding-top: 10px;
	padding-bottom: 51px;
}

.cmt_type3.wrap_cmt .list_cmt {
	padding-top: 7px;
	padding-bottom: 71px;
}

.wrap_cmt .wrap_info+.list_cmt {
	padding-top: 0;
}

.cmt_type3.wrap_cmt .wrap_info+.list_cmt {
	padding-top: 5px;
}

.list_cmt li {
	width: 700px;
	margin: 0 auto;
	padding: 30px 0 25px;
	background: url(//t1.kakaocdn.net/together_image/common/bg_line.png)
		repeat-x 0 100%;
}

.cmt_type3 .list_cmt li {
	padding: 30px 0 0;
	background: none;
}

.list_cmt li:last-child {
	background: none;
}

.link_profile {
	display: block;
	overflow: hidden;
	position: relative;
	width: 58px;
	height: 58px;
	font-size: 0;
	line-height: 0;
	border-radius: 50%;
	text-indent: -9999px;
}

.list_cmt .link_profile {
	overflow: visible;
	float: left;
	width: 54px;
	height: 54px;
}

.link_profile .img_thumb {
	width: 54px;
	height: 54px;
	border-radius: 50%;
}

.list_cmt .cmt_info {
	margin-left: 64px;
}

.cmt_type3 .list_cmt .cmt_info {
	position: relative;
	top: -7px;
}

.list_cmt .info_append {
	display: block;
}

.cmt_type3 .list_cmt .info_append {
	padding-left: 5px;
}

.list_cmt .tit_nickname {
	font-weight: 400;
	font-size: 15px;
}

.list_cmt .link_nickname {
	font-size: 15px;
	color: #444;
	vertical-align: 0;
}

.cmt_type3 .list_cmt .link_fund, .cmt_type3 .list_cmt .link_nickname {
	font-family: sans-serif;
	font-weight: bold;
}

.list_cmt .txt_money {
	position: relative;
	font-size: 15px;
	color: #dc287c;
}

.cmt_type3 .list_cmt .txt_money {
	color: #444;
}

.list_cmt .txt_cmt {
	display: block;
	margin-top: 3px;
	padding: 15px 11px;
	border-radius: 2px;
	font-size: 15px;
	color: #444;
	background-color: #fafafa;
	word-break: break-all;
	word-wrap: break-word;
}

.cmt_type3 .list_cmt .txt_cmt {
	margin-top: 5px;
	padding: 13px 14px 17px;
	border-radius: 9px;
	background-color: #f7f8f9;
	word-break: break-word;
}

.list_cmt .txt_cmt .desc_cmt {
	display: block;
	line-height: 22px;
	white-space: pre-line;
}

.list_cmt .txt_cmt .emoticon_pack {
	display: block;
	white-space: normal;
}

.list_cmt .info_append {
	display: block;
}

.cmt_type3 .list_cmt .info_append {
	padding-left: 5px;
}

.list_cmt .txt_cmt+.info_append {
	padding-top: 10px;
	text-align: right;
}

.cmt_type3 .list_cmt .txt_cmt+.info_append {
	padding-top: 2px;
}

.list_cmt .txt_time {
	float: left;
	padding-left: 4px;
	font-size: 15px;
	color: #9f9f9f;
}

.cmt_type3 .list_cmt .txt_time {
	padding-left: 7px;
	font-size: 14px;
	color: #999;
}

.list_cmt .btn_like {
	overflow: visible;
	position: relative;
	padding-left: 20px;
	color: #999;
	vertical-align: 0;
}

.list_cmt .on.btn_like {
	color: #444;
}

.list_cmt .btn_like .num_like {
    margin-left: 1px;
    font-family: sans-serif;
    font-weight: bold;
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

.list_cmt .btn_like .ico_like {
	display: inline-block;
	overflow: hidden;
	position: absolute;
	top: 0;
	left: 0;
	width: 20px;
	height: 18px;
	margin: 3px 1px 0 0;
	background-position: -208px -1396px;
	vertical-align: top;
}

.list_cmt .on.btn_like .ico_like {
	background-position: 0 -1609px;
	width: 26px;
	height: 26px;
	margin: 0;
	top: -1px;
	left: -4px;
	transform: scale(.7);
	animation-name: likeAni;
	animation-timing-function: ease-out;
	animation-duration: .5s;
	animation-iteration-count: 1;
}

.list_cmt .btn_like .num_like {
	margin-left: 1px;
	font-family: KakaoBig Bold, sans-serif;
}

.list_cmt .txt_cmt+.info_append:after {
	content: "";
	display: table;
	clear: both;
}

.wrap_cmt .list_more {
	position: relative;
	margin: -50px 0 0;
	background-color: #fff;
}

.cmt_type3.wrap_cmt .list_more {
	padding-top: 15px;
	border-top: 1px solid #e8e8e8;
}

.link_round {
	display: inline-block;
	height: 40px;
	padding: 0 17px;
	border: 1px solid #e7e7e7;
	border-radius: 20px;
	font-size: 13px;
	line-height: 38px;
	font-family: sans-serif;
	box-sizing: border-box;
	vertical-align: top;
}

.link_round.link_other2 {
	padding: 0 20px;
	font-size: 15px;
	line-height: 38px;
}

.fund_float {
	position: fixed;
	left: 0;
	bottom: 0;
	z-index: 99998;
}

.condition_type3, .fund_float {
	display: none;
}

.btn_static {
	position: relative;
	padding-bottom: 10px;
}

.fund_float, .plan_open .info_detail, .plan_open .info_goal {
	display: block;
}

.fund_float {
	left: 50%;
	bottom: 10px;
	width: 700px;
	height: 60px;
	margin-left: -350px;
	background: none;
}

.fund_float.btn_static {
	padding-bottom: 0;
}

.cont_memory .fund_float.btn_static, .cont_project .fund_float.btn_static
	{
	margin-top: 100px;
	margin-bottom: -100px;
}

.fund_float .btn_g {
	float: left;
	overflow: hidden;
	position: relative;
	width: 25%;
	height: 60px;
	line-height: 60px;
	background: #434343;
}

.fund_float .btn_g:first-of-type {
	border-radius: 4px 0 0 4px;
}

.fund_float .ico_together {
	display: inline-block;
	vertical-align: top;
}

.fund_float .ico_cheer {
	width: 22px;
	height: 20px;
	margin: 19px 4px 0 0;
	background-position: -465px -1325px;
}

.fund_float .on .ico_cheer {
	background-position: -490px -1325px;
}

.fund_float .txt_float {
	display: inline-block;
	margin-top: -2px;
	font-size: 18px;
	color: #fff;
	vertical-align: top;
}

.fund_float .num_active {
	font-size: 14px;
	color: #d9d9d9;
}

.fund_float .num_active, .fund_float .num_angkor {
	display: inline-block;
	padding: 20px 0 0 7px;
	line-height: 16px;
	vertical-align: top;
}

.fund_float .btn_give:last-of-type:after {
	display: none;
}

.fund_float .btn_cheer:after, .fund_float .btn_g:last-of-type:after {
	content: "";
	position: absolute;
	top: 10px;
	width: 1px;
	height: 35px;
	background-color: #555;
}

.fund_float .btn_g:last-of-type:after {
	left: 0;
}

.fund_float .btn_cheer:after {
	right: 0;
}

.fund_float .ico_share {
	width: 17px;
	height: 20px;
	margin: 18px 5px 0 0;
	background-position: -515px -1325px;
}

.fund_float .btn_give {
	background-color: #dc287c;
}

.fund_float .btn_g:last-of-type {
	width: 50%;
	border-radius: 0 4px 4px 0;
}

.fund_float .ico_give {
	display: inline-block;
	width: 24px;
	height: 55px;
	margin: 3px 4px 0 0;
	background: url(//t1.kakaocdn.net/together_image/common/ani_give.gif)
		no-repeat 0 0;
	background-size: 24px 55px;
	vertical-align: top;
}

.ngdialog-content {
	overflow: hidden;
	position: absolute;
	z-index: 999999;
	top: 50%;
	left: 50%;
}

.inner_together_layer {
	background-color: #fff;
}

.inner_together_layer6 {
	width: 392px;
}

.inner_together_layer6 .wrap_fund {
	padding: 35px 24px 25px;
}

.inner_together_layer6 .form_manage .list_pay {
	width: 100%;
}

.inner_together_layer6 .list_pay .cate_write {
	display: block;
	font-size: 16px;
	color: #444;
	font-family: sans-serif;
	font-weight: bold;
}

.inner_together_layer6 .wrap_fund .txt_info {
	display: block;
	margin-top: 11px;
	font-size: 13px;
	color: #666;
}

.inner_together_layer6 .box_digit {
	width: 100%;
	height: 80px;
	margin: 14px 0 8px;
}

.inner_together_layer6 .box_digit .btn_digit {
	float: left;
	width: 83px;
	height: 38px;
	margin: 0 0 4px 4px;
	border-radius: 2px;
	font-size: 15px;
	line-height: 37px;
	color: #fff;
	background-color: #9f9f9f;
	box-sizing: border-box;
}

.inner_together_layer6 .box_digit .btn_digit.on_digit,
	.inner_together_layer6 .box_digit .btn_digit:active {
	background-color: #dc287c;
	transform: translate(1px, 1px);
}

.inner_together_layer6 .box_digit .btn_digit:first-child,
	.inner_together_layer6 .box_digit .btn_digit:nth-child(5) {
	margin-left: 0;
}

.inner_together_layer6 .box_digit .btn_modify {
	float: left;
	width: 83px;
	height: 38px;
	margin: 0 0 4px 4px;
	border: 1px solid #e0e0e0;
	border-radius: 2px;
	font-size: 15px;
	line-height: 37px;
	color: #767676;
	box-sizing: border-box;
}

.inner_together_layer .wrap_tf {
	position: relative;
}

.inner_together_layer6 .info_fund .wrap_tf {
	font-size: 15px;
	color: #444;
	text-align: right;
	clear: both;
}

.inner_together_layer6 .info_fund .wrap_tf .num_point {
	padding-right: 4px;
	font-family: KakaoBig Bold, sans-serif;
	font-size: 22px;
	color: #dc287c;
}

.inner_together_layer6 .list_pay .cate_reply {
	padding: 4px 0 5px;
}

.inner_together_layer .wrap_tf {
	position: relative;
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

.inner_together_layer6 .wrap_fund .tf_write {
	width: 100%;
	font-size: 15px;
}

.inner_together_layer6 .list_pay .info_reply .tf_reply {
	height: 84px;
}

.inner_together_layer6 .txt_msg {
	margin-top: 10px;
	font-size: 13px;
	color: #999;
}

.inner_together_layer .wrap_btn {
	padding-bottom: 30px;
	text-align: center;
}

.inner_together_layer .wrap_btn_type {
	margin: 0 30px;
}

.inner_together_layer .form_manage .wrap_btn_type {
	padding-bottom: 70px;
}

.inner_together_layer6 .form_manage .wrap_btn_type {
	position: relative;
	margin: 0 24px;
	padding-bottom: 35px;
}

.inner_together_layer .wrap_btn .btn_set {
	position: relative;
	display: inline-block;
	width: 160px;
	height: 48px;
	margin: 0 4px;
	vertical-align: top;
	color: #fff;
	font-size: 16px;
	line-height: 49px;
}

.inner_together_layer .wrap_btn .btn_type1 {
	background-color: #dc287c;
}

.inner_together_layer .wrap_btn_type .btn_set {
	width: 100%;
	margin: 0 0 12px;
}

.inner_together_layer .wrap_btn .btn_type1:hover {
	background-color: #9b1c57;
}

.inner_together_layer .wrap_btn_type .btn_set:last-child {
	width: 100%;
	margin-bottom: 0;
}

.inner_together_layer6 .form_manage .wrap_btn_type .btn_set {
	border-radius: 4px;
}

.inner_together_layer .layer_foot {
	position: absolute;
	top: 0;
	right: 0;
}

.inner_together_layer .layer_foot .btn_close {
	display: block;
	overflow: hidden;
}

.inner_together_layer .layer_foot .ico_together {
	width: 17px;
	height: 17px;
	margin: 22px;
	background-position: -184px 0;
}

.inner_together_layer {
    background-color: #fff;
}

.inner_together_layer12 {
    width: 400px;
    background-color: initial;
}

.box_heart {
    position: relative;
    margin-top: 10px;
    width: 400px;
    height: 250px;
}

.box_heart .paticle_n1 {
    top: 101px;
    left: 50%;
    background-color: #7ab034;
    animation: move1 1.5s ease-out;
    animation-delay: .4s;
    animation-fill-mode: both;
}

.box_heart .paticle_n1, .box_heart .paticle_n2 {
    position: absolute;
    width: 12px;
    height: 12px;
    margin-left: -6px;
    border-radius: 50%;
}

.box_heart .paticle_n1, .box_heart .paticle_n2 {
    position: absolute;
    width: 12px;
    height: 12px;
    margin-left: -6px;
    border-radius: 50%;
}

.box_heart .paticle_n2 {
    top: 106px;
    left: 42%;
    background-color: #fe433f;
    animation: move2 .8s ease-out;
    animation-delay: .4s;
    animation-fill-mode: both;
}

.box_heart .paticle_n3 {
    position: absolute;
    top: 56px;
    left: 40%;
    width: 16px;
    height: 16px;
    margin-left: -8px;
    background-color: #00adb8;
    border-radius: 50%;
    animation: move3 1.8s ease-out;
    animation-delay: .4s;
    animation-fill-mode: both;
}

.box_heart .paticle_n4 {
    position: absolute;
    top: 113px;
    left: 50%;
    width: 10px;
    height: 10px;
    margin-left: -5px;
    background-color: #8d32ef;
    border-radius: 50%;
    animation: move4 .7s ease-out;
    animation-delay: .35s;
    animation-fill-mode: both;
}

.box_heart .paticle_n5 {
    position: absolute;
    top: 51px;
    left: 62%;
    width: 8px;
    height: 8px;
    margin-left: -4px;
    background-color: #fcdc00;
    border-radius: 50%;
    animation: move5 1s ease-out;
    animation-delay: .35s;
    animation-fill-mode: both;
}

.box_heart .paticle_n6 {
    position: absolute;
    top: 141px;
    left: 46%;
    width: 12px;
    height: 12px;
    margin-left: -6px;
    background-color: #0078e1;
    border-radius: 50%;
    animation: move6 1.5s ease-out;
    animation-delay: .4s;
    animation-fill-mode: both;
}

.box_heart .heart {
    position: absolute;
    top: 60px;
    left: 50%;
    width: 118px;
    height: 77px;
    margin-left: -59px;
    padding-top: 37px;
    font-size: 20px;
    line-height: 22px;
    color: #fff;
    font-family: KakaoBig Bold;
    text-align: center;
    background-position: 0 -826px;
    text-indent: 0;
    animation: scaleup .3s ease-in-out backwards;
    animation-delay: .48s;
    animation-fill-mode: both;
}

.box_heart .bomb {
    top: 20px;
    z-index: 10;
    width: 200px;
    height: 200px;
    margin-left: -100px;
    background-color: #9370db;
    animation: bomb .25s ease-in;
    animation-delay: .3s;
    animation-fill-mode: both;
}

.box_heart .bomb, .box_heart .inner_bomb {
    position: absolute;
    left: 50%;
    border-radius: 50%;
}

.box_heart .bomb, .box_heart .inner_bomb {
    position: absolute;
    left: 50%;
    border-radius: 50%;
}

.box_heart .inner_bomb {
    top: 30px;
    z-index: 11;
    width: 180px;
    height: 180px;
    margin-left: -90px;
    background-color: #fff;
    animation: bomb .2s ease-in;
    animation-delay: .38s;
    animation-fill-mode: both;
}



.dimmed_layer {
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99999;
	width: 100%;
	background-color: #000;
	opacity: .3;
	filter: alpha(opacity = 30);
}

.toast-bottom-center {
    bottom: 76px;
}

#toast-container {
    position: fixed;
    z-index: 100000002;
    width: 100%;
}

.toast {
    position: relative;
    left: 50%;
    z-index: 100;
    margin-left: -400px;
    margin-top: 10px;
}

.toaster-icon {
    position: absolute;
    left: 0;
    top: 0;
    font-weight: 400;
    color: #fff;
}

.toast-title {
    font-weight: 700;
}

.toast .toast-message {
    width: 760px;
    padding: 13px 20px;
    border-radius: 5px;
    font-size: 16px;
    color: #fff;
    background-color: #000000b3;
    text-align: center;
    letter-spacing: -.05em;
}

.toast .toast-message>div {
    white-space: pre-line;
}

.toast .toast-message>div {
    white-space: pre-line;
}

</style>
<script type="text/javascript">
function commentLike(commentNum, liked){
	$.ajax({
		url : "commentLike.do",
		type : "post",
		data : JSON.stringify({
			"liked" : liked,
			"commentNum" : commentNum
		}),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data){
			console.log(data);
		}
		
	});
};

function commentLoad(fundraisingNum, num, page){
	let numbers = {
			"fundraisingNum" : fundraisingNum,
			"num" : num,
			"page" : page
	};
	
	$.ajax({
		url : "commentLoad.do",
		type : "post",
		data : JSON.stringify(numbers),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(comments){
			console.log(comments);
			let html = "";
			comments.forEach(function(data){
			html += "<comment><li id='"+data.commentNum+"'><button type='button' class='link_profile'>";
			html += "<img class='img_thumb' alt='프로필' src='";
			
			if(data.profileImg == null){
				html += "https://t1.kakaocdn.net/together_image/common/avatar/avatar_angel.png";
			} else {
				html += data.profileImg;
			}
			
			html += "'><!----></button><div class='cmt_info'>";
			html += "<span class='info_append'><!----><strong class='tit_nickname'>";
			html += "<a href='javascript:;' class='link_nickname'><!---->";
			html += "<span class='screen_out'>닉네임</span> "+data.id+" </a></strong>";
			
			let money = 0;
			
			if(data.donationDirect != 0 && data.donationComment == 0){
				money = data.donationDirect
				html += "<span class='txt_money'><span class='screen_out'>기부금액</span> ";
				html += money.toLocaleString()+"원 <!----></span>";
			} else if(data.donationDirect == 0 && data.donationComment != 0) {
				money = data.donationComment * 100
				html += "<span class='txt_money'><span class='screen_out'>기부금액</span> ";
				html += money+"원 <!----></span>";
			} else {
				html += "";
			}
			
			html += "<!----></span><span class='txt_cmt'>";
			html += "<span class='desc_cmt'>"+data.content+"</span>";
			html += "<span class='emoticon_pack'><!----></span></span><!---->";
			html += "<!----><span class='info_append'><span class='txt_time'>";
			
			let time = "";
			
			let today = new Date();
			let year1 = today.getFullYear();
			let month1 = today.getMonth()+1;
			let date1 = today.getDate();
			let hour1 = today.getHours();
			let minute1 = today.getMinutes();
			let second1 = today.getSeconds();
			
			let date = new Date(data.date);
			let year2 = date.getFullYear();
			let month2 = date.getMonth()+1;
			let date2 = date.getDate();
			let hour2 = date.getHours();
			let minute2 = date.getMinutes();
			let second2 = date.getSeconds();
			
			if(year1 - year2 == 0 && month1 - month2 == 0 && date1 - date2 == 0 && hour1 - hour2 == 0 && minute1 - minute2 == 0){
				time += "방금 전";
			} else if (year1 - year2 == 0 && month1 - month2 == 0 && date1 - date2 == 0 && hour1 - hour2 == 0){
				time += minute1 - minute2 + "분 전";
			} else if (year1 - year2 == 0 && month1 - month2 == 0 && date1 - date2 == 0){
				time += hour1 - hour2 + "시간 전";
			} else {
				time += year2 + "년 " + month2 + "월 " + date2 + "일";
			}
			
			html += time + "</span><like-comment><button type='button' ";
			if(data.liked == 0){
				html += "class='btn_like'";
			} else {
				html += "class='btn_like on'";
			}
			html += " data-tiara-id='"+data.commentNum+"'>";
			html += "<span class='ico_together ico_like'></span>&nbsp;좋아요&nbsp;";
			if(data.totalLike != 0){
				html += "<span class='num_like'>"+data.totalLike+"</span>";
			}
			html += "<!----></button><!----></like-comment></span></div></li>";
			html += "</comment>";
			})
			if(num == 1){
				$(".list_cmt").prepend(html);
			} else {
				$(".list_cmt").append(html);
			}
		},
		error : function() {
			alert("error");
			},
			complete : function() {
				let pageCheck = page + 1;
				let fundraisingNumAndPage = {
					"fundraisingNum" : fundraisingNum,
					"page" : pageCheck
				};
				
				$.ajax({
					url : "restCommentCheck.do",
					type : "post",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(fundraisingNumAndPage),
					dataType : "json",
					success : function(data){
						if(data.length == 0){
							$(".link_other2").remove();
						}
						
					}
				});
			}
	})
};

$(document).on('click', '.btn_like', function(){
	var numLike = 0;
	if($(this).hasClass("btn_like on")){
		console.log("버튼 오프");
		$(this).removeClass("on");
		commentLike($(this).attr("data-tiara-id"), 0);
		numLike = $(this).find(".num_like").text() - 1;
		if($(this).find(".num_like").text() == "1"){
			$(this).find(".num_like").remove();
		} else {
			$(this).find(".num_like").text(numLike);
		}
		
	} else {
		console.log("버튼 온");
		$(this).addClass("on");
		commentLike($(this).attr("data-tiara-id"), 1);
		if($(this).find("span").is(".num_like")){
			numLike = $(this).find(".num_like").text();
			$(this).find(".num_like").text(parseInt(numLike)+1);
		} else {
			$(this).append("<span class='num_like'>1</span>");
		}
		
	}
});

function commentInsert(content, donationDirect){
	let fundraisingNum = document.location.href.slice(35);
	
	let form = {
			"fundraisingNum" : fundraisingNum,
			"content" : content,
			"donationDirect" : donationDirect
	};
	
	$.ajax({
		url : "commentInsert.do",
		type : "post",
		data : JSON.stringify(form),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data){
			if(data.donationComment == 0){
				donationInsert(0, 0, 0, 1);
			}
			
			let num = $(".emph_sign:eq(1)").text();
			$(".emph_sign:eq(1)").text(parseInt(num) + 1);
			
			commentLoad(data.fundraisingNum, 1, 1);
			
		}
	});
};

function donationInsert(donationDirect, donationCheer, donationShare, donationComment) {
	let fundraisingNum = document.location.href.slice(35);
	
	let form = {
			"fundraisingNum" : fundraisingNum,
			"donationDirect" : donationDirect,
			"donationCheer" : donationCheer,
			"donationShare" : donationShare,
			"donationComment" : donationComment
	};
	
	$.ajax({
		url : "donationInsert.do",
		type : "post",
		data : JSON.stringify(form),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(data){
			$(".total_fund").text(data.donationTotal.toLocaleString());
			$(".mark_point").css("left: "+Math.floor(data.donationTotal / data.goal * 100)+"%");
			$(".num_per").text(Math.floor(data.donationTotal / data.goal * 100));
			$(".detail_fund").find("dt:eq(0)").text(" 직접기부 ("+data.sumDirectCount.toLocaleString()+"명) ");
			$(".detail_fund").find("dd:eq(0)").text(" "+data.sumDirect.toLocaleString()+"원 ");
			$(".detail_fund").find("dt:eq(1)").text(" 참여기부 ("+data.donationParticipateCount.toLocaleString()+"명) ");
			$(".detail_fund").find("dd:eq(1)").text(" "+data.donationParticipate.toLocaleString()+"원 ");
			$(".fund_belong").find("dt:eq(0)").text(" ㄴ 응원기부 ("+data.sumCheerCount.toLocaleString()+"명) ");
			$(".fund_belong").find("dd:eq(0)").text(" "+data.sumCheer.toLocaleString()+"원 ");
			$(".fund_belong").find("dt:eq(1)").text(" ㄴ 공유기부 ("+data.sumShareCount.toLocaleString()+"명) ");
			$(".fund_belong").find("dd:eq(1)").text(" "+data.sumShare.toLocaleString()+"원 ");
			$(".fund_belong").find("dt:eq(2)").text(" ㄴ 댓글기부 ("+data.sumCommentCount.toLocaleString()+"명) ");
			$(".fund_belong").find("dd:eq(2)").text(" "+data.sumComment.toLocaleString()+"원 ");
			$(".info_append").find(".emph_sign").text(data.sumShareCount.toLocaleString()+"원");
			$(".txt_cmt").find(".emph_sign").text(data.commentCount.toLocaleString());
			
			
		}
	});
}

function modalOff(){
	
	$("body").attr("style", "");
	$(".dimmed_layer").remove();
	$(".cont_project").removeAttr("aria-hidden");
	$(".ngdialog-content").attr({
		"class" : "ngdialog-content",
		id : "modalOFF"
		});
	$(".ngdialog-content").css({
		position : "fixed",
		display : "none",
		top : "15%",
		"margin-left" : "-196px"
		});
	
};

function cheerOnClick(){
		let html = "<div class='toast toast-info'>";
		html += "<i class='toaster-icon icon-info'></i>";
		html += "<div class='toast-content'><div class='toast-title'></div>";
		html += "<div class='toast-message'><!---->";
		html += "<div>이미 응원한 모금함이에요.</div><!----><!---->";
		html += "</div></div><!----></div>";
		$("#toast-container").append(html);
		setTimeout(function(){
			$("#toast-container").empty();
		}, 7000);
}

$(document).ready(function() {
	let fundraisingNum = document.location.href.slice(35);
	commentLoad(fundraisingNum, 5, 1);
	
	$(".btn_comment").click(function(event){
		let content = $("#txtCmt").val();
		let html = "";
		if(content.length < 2){
			html += "<div class='toast toast-success'>";
			html += "<i class='toaster-icon icon-success'></i>";
			html += "<div class='toast-content'><div class='toast-title'></div>";
			html += "<div class='toast-message'><!---->";
			html += "<div>최소 2글자 이상 입력해주세요</div><!----><!---->";
			html += "</div></div></div>";			
			$("#toast-container").append(html);
			setTimeout(function(){
				$("#toast-container").empty();
			}, 7000);
		} else {
			commentInsert(content, 0);
			$("#txtCmt").val('');
		};
		
	});
	
	let page = 1;
	$(".link_other2").click(function(event){
		let fundraisingNum = document.location.href.slice(35);
		page++;
		commentLoad(fundraisingNum, 10, page);
	});
	
	var money = 0;
	$(".box_digit button").click(function(event) {
		var addMoney = $(this).attr("data-tiara-layer");
		addMoney = parseInt(addMoney);
		if (addMoney > 0) {
			money += addMoney;
			} else {
				money = 0;
				}
		$(".num_point").text(money.toLocaleString());
		});
	
	let flag = false;
	
	$(".btn_cheer").click(function(event){
		
		if(flag == true){
			cheerOnClick();
		} else {
			flag = true; 
			$(this).addClass("on");
			donationInsert(0,1,0,0);
			
			
			
			// 		let html = "<div class='ngdialog-content' style='position: fixed; margin-top: -130px; margin-left: -200px;'>";
			// 		html += "<div class='inner_together_layer inner_together_layer12'><div class='layer_body'>";
			// 		html += "<div class='stage'><div class='box_heart'>";
			// 		html += "<div class='paticle_n1'></div><div class='paticle_n2'></div>";
			// 		html += "<div class='paticle_n3'></div><div class='paticle_n4'></div>";
			// 		html += "<div class='paticle_n5'></div><div class='paticle_n6'></div>";
			// 		html += "<div class='ico_together2 heart'></div><div class='bomb'></div>";
			// 		html += "<div class='inner_bomb'></div></div></div></div></div></div>";
			// 		$("fundraising").append(html);
		}
	});
		
	$(".btn_give").click(function(event) {
		$("body").css({
			position : "fixed",
			top : "0px",
			left : "0px",
			right : "0px"
			});
		$(".together_top").append("<div class='dimmed_layer' style='height: 100%; position: fixed; top: 0px; left: 0px; right: 0px; display: block;'></div>");
		$(".cont_project").attr("aria-hidden", "true");
		$(".ngdialog-content").attr({
			"class" : "ngdialog-content opened_modal",
			id : "modalON"
			});
		$(".ngdialog-content").css({
			position : "fixed",
			display : "block",
			top : "15%",
			"margin-left" : "-196px"
			});
		
		$(".btn_type1").click(function(event){
			let html = "";
			if(money < 1000) {
				html += "<div class='toast toast-info'>";
				html += "<i class='toaster-icon icon-info'></i>";
				html += "<div class='toast-content'><div class='toast-title'>";
				html += "</div><div class='toast-message'><!---->";
				html += "<div>결제는 1천원부터 가능합니다</div><!----><!---->";
				html += "</div></div><!----></div>";
				$("#toast-container").append(html);
				setTimeout(function(){
					$("#toast-container").empty();
				}, 7000);
			} else {
				let content = $("#tfReply").val();
				
				if(content.length != 0){
					commentInsert(content, money);
				}
				
				donationInsert(money, 0, 0, 0);
				
				modalOff();
				
			};
			});
		
		$(".btn_close").click(function(event) {
			modalOff();
			});
		});
	
	});
	
</script>
</head>
<body>
	<div id="dkWrap" class="together_top">
		<%@ include file="../main/header.jsp"%>
		<span id="rootContent"> <router-outlet></router-outlet> <fundraising>
			<div id="dkContent" class="cont_project">
				<article id="mArticle">
					<div class="wrap_visual">
						<div class="cont_visual"
							style="background-size: cover; background-color: rgb(59, 56, 32); background-image: url('${contextPath}/imageLoad?imageFileName=${fundraisingDTO.img }');">
							<div class="front_pack">
								<span class="tag_group"> </span>
								<h4 class="tit_visual ellipsis_type1">${fundraisingDTO.title }</h4>
								<span class="txt_sponsor ellipsis_g">by
									${fundraisingDTO.proposer }</span>
								<!---->
								<!---->
							</div>
						</div>
					</div>
					<div class="wrap_subject">
						<router-outlet></router-outlet>
						<ng-component> <fundraising-content>
						<div class="cont_subject #content">
						${fundraisingDTO.content }
						</div>
						</fundraising-content> </ng-component>
						<div class="info_state">
							<span class="total_fund"><fmt:formatNumber
									value="${donationDTO.donationTotal }" type="number" /><span
								class="txt_won">원</span> </span> <span class="txt_goal"><fmt:formatNumber
									value="${fundraisingDTO.goal }" type="number" />원 목표</span>
							<div id="animate-area" class="chart_fund pack_type1">
								<span class="progress_road"> <span class="mark_pack">
										<span class="inner_mark_pack">
										<fmt:parseNumber var="donationPer" integerOnly="true" value="${donationDTO.donationTotal / fundraisingDTO.goal * 100 }" />
										<span class="mark_point"
											style="left: ${donationPer }%;">
												<span class="ico_chart txt_result"> <span
													class="num_per">${donationPer }</span>
													<span class="txt_per">%</span>
											</span>
										</span>
									</span>
								</span>
								</span> <span class="graph_road"> <span class="graph_bar">
										<span class="inner_graph_bar"> <!----> <span
											class="sign_graph"
											style="width: ${donationPer }%;"></span>
											<!---->
									</span>
								</span>
								</span>
							</div>
							<dl class="detail_fund">
								<dt class="tit_fund">직접기부 (<fmt:formatNumber
									value="${donationDTO.sumDirectCount }" type="number" />명)</dt>
								<dd class="txt_fund"><fmt:formatNumber
									value="${donationDTO.sumDirect }" type="number" />원</dd>
								<!---->
								<!---->
								<dt class="tit_fund">참여기부 (<fmt:formatNumber
									value="${donationDTO.donationParticipateCount }" type="number" />명)</dt>
								<dd class="txt_fund"><fmt:formatNumber
									value="${donationDTO.donationParticipate }" type="number" />원</dd>
								<!---->
								<!---->
							</dl>
							<dl class="detail_fund fund_belong">
								<dt class="tit_fund">ㄴ 응원기부 (<fmt:formatNumber
									value="${donationDTO.sumCheerCount }" type="number" />명)</dt>
								<dd class="txt_fund"><fmt:formatNumber
									value="${donationDTO.sumCheer }" type="number" />원</dd>
								<!---->
								<!---->
								<dt class="tit_fund">ㄴ 공유기부 (<fmt:formatNumber
									value="${donationDTO.sumShareCount }" type="number" />명)</dt>
								<dd class="txt_fund"><fmt:formatNumber
									value="${donationDTO.sumShare }" type="number" />원</dd>
								<!---->
								<!---->
								<dt class="tit_fund">ㄴ 댓글기부 (<fmt:formatNumber
									value="${donationDTO.sumCommentCount }" type="number" />명)</dt>
								<dd class="txt_fund"><fmt:formatNumber
									value="${donationDTO.sumComment }" type="number" />원</dd>
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
							</dl>
							<dl class="detail_fund">
								<!---->
								<!---->
							</dl>
						</div>
					</div>
					<fundraisings-plan>
					<div class="wrap_plan receipt_none">
						<div class="cont_plan plan_type2">
							<div class="inner_plan">
								<dl class="story_date">
									<dt class="tit_date">모금기간 :</dt>
									<dd class="txt_date">
										<fmt:formatDate value="${fundraisingDTO.startDate }"
											pattern="yyyy.MM.dd" />
										~
										<fmt:formatDate value="${fundraisingDTO.endDate }"
											pattern="yyyy.MM.dd" />
									</dd>
								</dl>
							</div>
						</div>
					</div>
					<!----> </fundraisings-plan>
					<comments>
					<div class="wrap_cmt cmt_type3">
						<div class="write_cmt">
							<div class="inner_write">
								<!---->
								<div class="info_append">
									<span class="txt_heading">카카오 지원 댓글 기부금 </span> <span
										class="emph_sign"><fmt:formatNumber
									value="${donationDTO.sumComment }" type="number" />원</span>
									<!---->
									<!---->
									<!---->
								</div>
								<!---->
								<!---->
								<a class="link_profile" href="/my"> <!----> <img
									src="//t1.kakaocdn.net/together_image/common/avatar/avatar.png"
									alt="프로필사진" class="img_thumb"> <!---->
								</a>
								<div class="cmt_info">
									<div class="txt_cmt">
										<fieldset class="fld_cmt">
										<c:choose>
										<c:when test="${loginUser == null}">
											<textarea name="txtCmt" id="txtCmt"
												class="tf_cmt ng-untouched ng-pristine"
												placeholder="댓글만 써도 코코아가 대신 기부합니다. 같이가치해요♡" disabled
												style="height: 44px; overflow: hidden;"></textarea></c:when>
												<c:otherwise>
												<textarea name="txtCmt" id="txtCmt"
												class="tf_cmt ng-untouched ng-pristine"
												placeholder="댓글만 써도 코코아가 대신 기부합니다. 같이가치해요♡"
												style="height: 44px; overflow: hidden;"></textarea>
												</c:otherwise>
												</c:choose>
											<button type="button" class="btn_comment">등록</button>
										</fieldset>
									</div>
								</div>
							</div>
						</div>
						<div class="wrap_info">
							<div class="inner_info">
								<span class="txt_cmt">댓글 <span class="emph_sign"><fmt:formatNumber
									value="${donationDTO.commentCount }" type="number" /></span>
								</span>
							</div>
						</div>
						<!---->
						<ul class="list_cmt">
						<!---->
						</ul>
						<!---->
						<!---->
						<div class="list_more">
							<button type="button" class="link_round link_other2">
								더보기</button>
							<!---->
						</div>
					</div>
					</comments>
					<div class="fund_float">
						<button type="button" class="btn_g btn_cheer">
							<span class="ico_together ico_cheer"></span> <span
								class="txt_float txt_cheer">응원<span class="num_active"><fmt:formatNumber
									value="${donationDTO.sumCheerCount }" type="number" /></span>
							</span>
						</button>
						<!---->
						<button type="button" class="btn_g">
							<span class="ico_together ico_share"></span> <span
								class="txt_float txt_share">공유</span> <span class="num_active"><fmt:formatNumber
									value="${donationDTO.sumShareCount }" type="number" /></span>
							<!---->
						</button>
						<!---->
						<button type="button" class="btn_g btn_give">
							<!---->
							<span> <!----> <!----> <span> <span
									class="ico_give"></span> <span class="txt_float txt_give">기부하기</span>
							</span> <!----> <!---->
							</span>
							<!---->
						</button>
					</div>
				</article>
			</div>
			<!----> <donation-modal> <modal>
			<div tabindex="0" role="dialog" class="ngdialog-content"
				id="modalOFF"
				style="position: fixed; display: none; top: 15%; margin-left: -196px;">
				<modal-content>
				<div class="inner_together_layer inner_together_layer6">
					<div class="layer_head">
						<strong class="screen_out">기부하기</strong>
					</div>
					<div class="layer_body">
						<form novalidate name="form"
							class="form_manage ng-untouched ng-pristine ng-valid">
							<fieldset>
								<div class="wrap_fund">
									<!---->
									<dl class="list_pay">
										<dt class="cate_write cate_fund">
											<span>기부금 결제</span>
										</dt>
										<dd class="info_write info_fund">
											<p class="txt_info">무통장은 3천원, 기타 결제는 1천원부터 가능합니다.</p>
											<!---->
											<!---->
											<!---->
											<div class="box_digit">
												<button type="button" data-tiara-layer="100"
													class="btn_digit">+ 1백원</button>
												<button type="button" data-tiara-layer="1000"
													class="btn_digit">+ 1천원</button>
												<button type="button" data-tiara-layer="5000"
													class="btn_digit">+ 5천원</button>
												<button type="button" data-tiara-layer="10000"
													class="btn_digit">+ 1만원</button>
												<button type="button" data-tiara-layer="50000"
													class="btn_digit">+ 5만원</button>
												<button type="button" data-tiara-layer="100000"
													class="btn_digit">+ 10만원</button>
												<button type="button" data-tiara-layer="500000"
													class="btn_digit">+ 50만원</button>
												<button type="button" data-tiara-layer="ac"
													class="btn_modify">다시 입력</button>
											</div>
											<div class="wrap_tf">
												<em class="num_point">0</em>원
											</div>
											<!---->
											<!---->
											<!---->
										</dd>
										<!---->
										<!---->
										<!---->
										<dt class="cate_write cate_reply">
											<label for="tfReply">응원댓글 쓰기</label>
										</dt>
										<dd class="info_write info_reply">
											<div class="wrap_tf">
												<textarea id="tfReply" rows="10" cols="30" name="comment"
													placeholder="따뜻한 한마디를 남겨주세요."
													class="tf_write tf_reply ng-untouched ng-pristine ng-valid"></textarea>
											</div>
										</dd>
									</dl>
									<p class="txt_msg">
										결제 수수료는 카카오가 대신 부담합니다. <br>결제완료 알림은 카카오톡으로 발송해드려요.
									</p>
									<!---->
									<!---->
									<!---->
								</div>
								<div class="wrap_btn wrap_btn_type">
									<button type="button" class="btn_set btn_type1">결제하기</button>
								</div>
							</fieldset>
						</form>
					</div>
					<div class="layer_foot">
						<button type="button" class="btn_close">
							<span class="ico_together"> 닫기 </span>
						</button>
					</div>
				</div>
				</modal-content>
			</div>
			</modal> </donation-modal>
			<!----> </fundraising>
		</span>
		<%@ include file="../main/footer.jsp"%>
	</div>
	<!---->
	<!---->
	<toaster-container>
	<div id="toast-container" class="toast-bottom-center">
	</div>
	</toaster-container>
</body>
</html>