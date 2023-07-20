<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/gesipan.css">
</head>
<body>
	<div class="mypage">


		<div class="mypage_container1">
			<div class="mypage_content1">

				<div class="info1">
					<img alt="프로필 이미지" src="${image}"
						onerror="this.src='/basicInfo/img/basic.jpg'">
				</div>
				<div class="info2">
					<div class="nckn">${nickname}</div>

					<div class="gae">
						<div class="wrtg">
							작성글 <strong>${total}</strong>
						</div>
						<div class="lkdPost">
							좋아요한 글 <strong>15</strong>
						</div>
					</div>

				</div>

			</div>
		</div>

		<div class="mypage_container2">
			<div class="mypage_content2">

				<div class="tab1">
					<button class="md">회원정보수정</button>
				</div>

				<div class="tab2">
					<div class="at1">작성글</div>
					<div class="at2">좋아요한 글</div>
				</div>





				<!-- 좋아요한 글 -->
				<div class="gesipan2">
					
				</div>



			</div>
		</div>










		<!-- 	<!-- js -->
<!-- 		<script src="Eunsol/js/gesipan.js"></script> -->
		<script src="Eunsol/js/likepost.js"></script>
</body>
</html>