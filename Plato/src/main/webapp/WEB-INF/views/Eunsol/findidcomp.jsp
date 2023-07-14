<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/findidcomp.css">
</head>
<body>
	<div class="findIdComp">
		<div class="findIdComp_container">
			<div class="findIdComp_content">
				<div class="title">
					<strong>아이디 찾기</strong>
				</div>
				<div class="expln">
					회원가입시 사용한 아이디는 <strong>${id}</strong> 입니다.
				</div>
				<div>
				<hr>
				</div>
				
				<div class = "findIdComp-btn" >
					<a href="/header" class="btn home">홈으로</a> <span class="btn login">로그인</span>
				</div>

			</div>
		</div>
	</div>
	
	<!-- js -->
		<script src="Eunsol/js/findidcomp.js"></script>
</body>
</html>