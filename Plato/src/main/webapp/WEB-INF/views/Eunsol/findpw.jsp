<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/findpw.css">
<link rel="stylesheet" href="Eunsol/css/pop_findpwcomp.css">
</head>
<body>
	<div class="findPw">
		<div class="findPw_container">
			<div class="findPw_content">
				<div class="title">
					<strong>비밀번호 찾기</strong>
				</div>
				<div class="expln">
					입력하신 정보가 일치하면,<br> 회원정보에 등록하신 이메일로 보내드립니다.
				</div>
				<div class="rqdInfo">
					<div class="findPwForm id">
						<input type="text" id="findPw_Id" name="id" placeholder="등록한 아이디">
					</div>
					<div class="findPwForm email">
						<input type="email" id="findPw_Email" name="email"
							placeholder="등록한 이메일 주소">
					</div>
					<div class="findPwForm nickname">
						<input type="text" id="findPw_Nick" name="nickname"
							placeholder="등록한 별명" maxlength="10">
					</div>
				</div>
				<div class="findPw_error">
					<div class='nullInfo'>정보를 입력해 주세요</div>
					<div id="emlfr">이메일 형식이 올바르지 않습니다.</div>
				</div>
				<div>
					<button type="button" class="find-button">비밀번호 이메일 발송</button>
				</div>

			</div>
		</div>
		<!-- 팝업 완료창 -->
		<div class="pop_findpwcomp">
			<div class="content">

				<div class="mdfp">
						<!-- <div>예시 문구입니다.</div> -->
				</div>

				<div class="findpwcomp-btn">
					<a href="/findpwForm" class="btn check">확인</a> <a href="/header"
						class="btn home">홈으로</a>
				</div>

			</div>
		</div>
		<!-- 팝업 완료창 끝-->
	</div>
	<!-- js -->
	<script src="Eunsol/js/findpw.js"></script>
</body>
</html>