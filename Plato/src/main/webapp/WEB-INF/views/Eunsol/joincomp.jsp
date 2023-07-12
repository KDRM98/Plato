<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/joincomp.css">
</head>
<body>
	<div class="joincomp">
		<div class="joincomp_container">
			<div class="joincomp_content">
				<div class="jc_img">
					<img alt="주황색 체크" src="Eunsol/imges/orn_check.png">
				</div>
				<div class="welcome">
				<div class="welcome1">회원가입이 <strong>완료</strong> 되었습니다.</div>
				<div class="welcome2"><strong>${nickname}</strong>님의
					회원가입을 축하합니다.<br> 알차고 실속 있는 서비스로 찾아뵙겠습니다.
				</div>
				</div>
				<hr>
				<div class="joincomp_btn">
					<a href="/header" class="btn home">홈으로</a> <span class="btn login">로그인</span>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
		<script src="Eunsol/js/joincomp.js"></script>
</body>
</html>