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
		<div class="logo">
			<img alt="로고" src="Eunsol/imges/o_logo.png">
		</div>
		<div>
			<div class="navigation">
				<a href="#">nav</a>
			</div>
			<div class="user_status">
				<ul>
					<li><a href="#pop1" class="login">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a id="search_glass" href="#">Search</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- clear : both; -->
	<div class="popup_login" id="pop1">
		<a href="#" class="close">닫기</a>

		<div class="content">
			<div class="popup_logo">
				<img alt="로고" src="Eunsol/imges/o_logo.png">
			</div>
		<div class="welcome">
		<p>--welcome--</p>
		</div>
			<div class="login_input">
				
				<div class="login_id">
					<p class="id_pw">Id</p>
					<input type="text" id="id" name="id" required="required">
				</div>
				
				<div>
				<p class="id_pw">Password</p>
					 <input type="password" id="pw" name="pw" required="required">
				</div>
			</div>

			<div class="error 1">아이디 또는 비밀번호가 일치하지 않습니다.</div>
			<div class="error two">아이디 또는 비밀번호를 입력해 주세요.</div>
			
			<div class="search_idpw">
				<ul>
					<li><a href="#" class="search id">아이디 찾기</a>
				</li>
				<li>
					<a href="#" class="search pw">비빌번호 찾기</a>
				</li>
				</ul>
			</div>
			
			
			<div class="login_btn">
				<button type="submit" >로그인</button>
			</div>


			<div>
				계정이 없나요? <a href="#" class="sign_up">회원가입</a>
			</div>

		</div>
	</div>
	<div class="dim"></div>
</body>
</html>