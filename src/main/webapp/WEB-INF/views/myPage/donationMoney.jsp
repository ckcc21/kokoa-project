<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function donation() {
		console.log("실행");
		var id = "ckc21";
		var title = "당신을 혼자 두지 않겠습니다";
		var money = 1;
		
		var donationMoney = {
			"id" : id,
			"title" : title,
			"replyMoney" : money
		}

		$.ajax({
			url : "${contextPath}/donationMoney.do",
			type : "post",
			data : JSON.stringify(donationMoney),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				alert(data.execute);
			}
		})
	}

	function like() {
		$.ajax({
			url : "${contextPath}/like.do",
			type : "get",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				alert(data.execute);
			},
			error : function() {
				alert('에러');
			}
		})
	}
</script>
<body>
	<button type="button" onclick="donation()">기부</button>
	<button type="button" onclick="like()">좋아요</button>
</body>
</html>