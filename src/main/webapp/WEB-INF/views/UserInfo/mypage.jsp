<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	 $(document).ready(function(){
	        $("#btnUpdate").click(function(){
	        	 if(confirm("수정하시겠습니까?")){
	            document.form1.action = "/UserInfo/userUpdate";
	            document.form1.submit();
	        	 }
	        });
	    });
	 
	 $(document).ready(function(){
	        $("#btnDelete").click(function(){
	            if(confirm("삭제하시겠습니까?")){
	                document.form1.action = "/UserInfo/userDelete";
	                document.form1.submit();
	            }
	        });
	    });
</script>

<script type="text/javascript">

</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
마이페이지 
<form name="form1" method="post">
<table border="1">

 <tr>
	<th>아이디</th>
	<c:if test="${sessionScope.kakaoN ==null }">
	<td><input name="UId"  value="${detail.UId }"  readonly="readonly"></td> 
	</c:if>
	
	<c:if test="${sessionScope.kakaoN !=null }">
	<td><input name="UId"  value="${sessionScope.kakaoN}"  readonly="readonly"></td> 
	</c:if>
 </tr> 

 <tr>
 <th>비밀번호</th>
 <td><input name="UPwd" value="${detail.UPwd }" readonly="readonly"></td>
 </tr>
 
 <tr>
 <th>이름</th>
 <td><input name="UName" value="${detail.UName }"  ></td>
 </tr>
 
 <tr>
 <th>이메일</th>
 <td><input name="UMail" value="${detail.UMail }" ></td>
 </tr>
 
 <tr>
 <th>이미지</th>
 <td><input name="UImg" value="${detail.UImg }" ></td>
 </tr>
 
 <tr>
 <th>포스트주소</th>
 <td><input name="UPostAddr" value="${detail.UPostAddr }" ></td>
 </tr>
 
 <tr>
 <th>도로명주소</th>
 <td><input name="URoadAddr" value="${detail.URoadAddr }" ></td>
 </tr>
 
 <tr>
 <th>상세주소</th>
 <td><input name="UDetailAddr" value="${detail.UDetailAddr }" ></td>
 </tr>
 
 <tr>
 <th>전화번호</th>
 <td><input name="UTel" value="${detail.UTel }" ></td>
 </tr>
 
 <tr>
 <th>성별</th>
 <c:if test="${detail.UGen ==1}">
 <td><input name="UGen"  id="gen" value="남" ></td>
 </c:if>
 <c:if test="${detail.UGen ==2}">
 <td><input name="UGen"  id="gen" value="여" ></td>
 </c:if>
 </tr>
 
 <tr>
 <th>생년월일</th>
 <td><input name="UBirth" value="${detail.UBirth }" readonly="readonly"></td>
 </tr>
 
 <tr>
 	<th>프로필사진</th>
 	<c:if test="${detail.UGen ==1}">
	<td><img alt="" src="/image/1.png"></td> 	
 	</c:if>
 	<c:if test="${detail.UGen ==2}">
	<td><img alt="" src="/image/2.jpg"></td> 	
 	</c:if>
 	<c:if test="${detail.UGen ==3}">
	<td><img alt="" src="/image/3.png"></td> 	
 	</c:if>
 </tr>
 
 <tr>
  <td colspan="2" align="center">
  <input type="button" value="수정" id="btnUpdate">
  <input type="button" value="탈퇴" id="btnDelete">
  <div style="color:red;">${msg }</div>
  </td>
 </tr>
</table> 
</form>
	
	

</body>
</html>