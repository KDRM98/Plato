<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/header.css">
<link rel="stylesheet" href="Eunsol/css/popup_login.css">

</head>
<body>
	<header>
		<div>
			<div class="navigation">
				<a href="#">nav</a>
			</div>
			<div class="user_status">
				<ul>
					<li><a href="#pop1" class="login">로그인</a></li>
					<li><a href="/join">회원가입</a></li>
					<li><a id="search_glass" href="#">Search</a></li>
				</ul>
			</div>
		</div>
		<div class="logo">
			<a href="/header"><img alt="로고" src="Eunsol/imges/o_logo.png"></a>
		</div>
	</header>
	<!-- clear : both; -->

	<div class="popup_login" id="pop1">
		<a href="/header" class="close">닫기</a>

		<div class="content">
			<div class="popup_logo">
				<img alt="로고" src="Eunsol/imges/o_logo.png">
			</div>

			<div class="basic_info">
					<div class="form_item user">
						<input type="text" id="id" name="id" placeholder=" 아이디" value
							maxlength="10" required>
					</div>
					<div class="form_item pw">
						<input type="password" id="pw" name="pw" placeholder=" 비밀번호" value
							maxlength="10" required>
					</div>
				</div>

			<div class="error">${error}</div>

			<div class="search_idpw">
				<ul>
					<li><a href="#" class="search id">아이디 찾기</a></li>
					<li><a href="#" class="search pw">비빌번호 찾기</a></li>
				</ul>
			</div>


			<div class="login_btn">
				<button type="submit">로그인</button>
			</div>


			<div>
				계정이 없나요? <a href="/join" class="sign_up">회원가입</a>
			</div>

		</div>
	</div>
	<div class="dim"></div>
</body>
</html>