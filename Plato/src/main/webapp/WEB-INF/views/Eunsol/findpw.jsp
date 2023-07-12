<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/findpw.css">
</head>
<body>
	<div class="findPw">
		<div class="findPw_container">
			<div class="findPw_content">
				<div class="title">
					<strong>비밀번호 찾기</strong>
				</div>
				<div class="expln">
					입력하신 정보가 일치하면,<br> 비밀번호를 등록하신 이메일로 보내드립니다.
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
				</div>
				<div>
					<button type="submit" class="find-button">비밀번호 이메일 발송</button>
				</div>

			</div>
		</div>
	</div>
	<!-- js -->
	<script src="Eunsol/js/findpw.js"></script>
</body>
</html>