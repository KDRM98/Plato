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
<link rel="stylesheet" href="Eunsol/css/sidebar.css">

</head>
<body>
	<header>
		<div>
			<div class="navigation">
				<input type="checkbox" id="menuicon"> <label for="menuicon"
					class="custom-checkbox"> <img
					src="/Eunsol/imges/three_bars.svg" alt="Checkbox Image"
					id="menuimg">
				</label>





				<!-- 왼쪽 사이드바 -->
				<div class="sidebar" id="sb">
					<div class="close">
						<input type="checkbox" id="closeicon"> <label
							for="closeicon" class="custom-checkbox"> <img
							src="/Eunsol/imges/x.svg" alt="Close Image" id="closeimg">
						</label>

					</div>
					<div class="side_content">
						<div class="side_picture">
							<img class="side_circle" src="Eunsol/imges/orang_plato.png">
						</div>
						<div class="side_menu">
							<ul>
								<li><a href="#" class="find_recipe">레시피찾기</a></li>
								<li><a href="#" class="today_recipe">오늘의 인기레시피</a></li>
								<li><a href="#" class="last_recipe">지난 인기레시피</a></li>
							</ul>
						</div>
						<div class="side_login">
							<div class="side_login_btn">
								<span class="login">로그인</span>
							</div>
							<div>
								계정이 없나요? <a href="/joinForm" class="side_join"> 회원가입</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 왼쪽 사이드바 끝-->





			</div>
			<div class="user_status">
				<ul>
					<li><a href="#pop1" class="login">로그인</a></li>
					<li><a href="/joinForm">회원가입</a></li>
					<li><a id="search_glass" href="#">Search <img
							src="/Eunsol/imges/search_glass.svg" alt="search_glass Image">
					</a></li>
				</ul>
			</div>
		</div>
		<div class="logo">
			<a href="/header"><img alt="로고" src="Eunsol/imges/o_logo.png"></a>
		</div>
	</header>
	<!-- clear : both; -->


	<!-- 팝업 로그인 창 -->
	<div class="popup_login" id="pop1">
		<!-- 		<a href="/header" class="close"> <img alt="Close Image"
			src="/Eunsol/imges/x.svg">
		</a> -->
		<div class="close">
			<input type="checkbox" id="popcloseicon"> <label
				for="popcloseicon"> <img src="/Eunsol/imges/x.svg"
				alt="Close Image" id="popcloseimg">
		</div>
		<div class="content">
			<div class="popup_logo">
				<img alt="로고" src="Eunsol/imges/o_logo.png">
			</div>
			<form action="/login_check">
				<div class="basic_info">
					<div class="form_item user">
						<input type="text" id="id" name="id" placeholder=" 아이디" value
							maxlength="20" required>
					</div>
					<div class="form_item pw">
						<input type="password" id="pw" name="pw" placeholder=" 비밀번호" value
							maxlength="16" required>
					</div>
				</div>

				<div class="error">${msg}</div>

				<div class="search_idpw">
					<ul>
						<li><a href="#" class="search id">아이디 찾기</a></li>
						<li><a href="#" class="search pw">비빌번호 찾기</a></li>
					</ul>
				</div>


				<div class="login_btn">
					<button type="submit">로그인</button>
				</div>
			</form>

			<div>
				계정이 없나요? <a href="/joinForm" class="sign_up">회원가입</a>
			</div>

		</div>
	</div>
	<div class="dim"></div>

	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="Eunsol/js/popup_login.js"></script>
	<script src="Eunsol/js/sidebar.js"></script>
</body>
</html>