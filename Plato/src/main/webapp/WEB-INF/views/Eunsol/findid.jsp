<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/findid.css">
</head>
<body>
	<div class="findId">
		<div class="findId_container">
			<div class="findId_content">
				<div class="title"><strong>아이디 찾기</strong></div>
				<div class="expln">내 정보에 등록한 정보로 아이디를 찾을 수 있습니다.</div>
				<div class="rqdInfo">
					<div class="findIdForm email">
						<input type="email" id="findEmail" name="email"
							placeholder="등록한 이메일 주소">
					</div>
					<div class="findIdForm nickname">
						<input type="text" id="join_nickname" name="nickname"
							placeholder="등록한 별명" maxlength="10">
					</div>
				</div>
				<div>
					<button type="submit" class="find-button">찾기</button>
				</div>

			</div>
		</div>
	</div>
	<!-- js -->
		<script src="Eunsol/js/findid.js"></script>
</body>
</html>