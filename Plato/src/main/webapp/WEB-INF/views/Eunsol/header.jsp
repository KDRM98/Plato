<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
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

					<!-- 로그인 안했을 때-->
					<c:if test="${empty userid}">
						<div class="side_content">
							<div class="side_picture">
								<img class="side_circle" src="Eunsol/imges/orang_plato.png">
							</div>
							<div class="side_menu">
								<ul>
									<li><a href="#" class="find_recipe" >레시피찾기</a></li>
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
					</c:if>

					<!-- 로그인 했을 때-->
					<c:if test="${not empty userid}">
						<div class="side_content">
							<div class="side_picture">
								<img class="side_circle" src="${image}" onerror="this.src='/basicInfo/img/basic.jpg'">
							</div>
							<div class="side_menu">
								<ul>
									<li><a onclick="openPopup()" class="find_recipe">레시피찾기</a></li>
									<li><a href="#" class="today_recipe">오늘의 인기레시피</a></li>
									<li><a href="#" class="last_recipe">지난 인기레시피</a></li>
									<li>&#160;</li>
									<li><a href="/mypage" class="sb_mypage">마이페이지</a></li>
									<li><a href="/addrecipe" class="sb_write">글쓰기</a></li>
									<li><a href="/profile" class="sb_modify">회원정보수정</a></li>
								</ul>
							</div>
							<div class="side_login">
								<div class="side_login_btn">
									<a href="/logout" class="logout">로그아웃</a>
								</div>
							</div>
						</div>
					</c:if>
				</div>
				<!-- 왼쪽 사이드바 끝-->

				<!-- 로그인시 닉네임 표출-->
				<c:if test="${not empty userid}">
					<div class="hello_nickname">
						<img alt="heart Img" src="/Eunsol/imges/heart.svg" id="heartImg">
						<span class="header_nickname">${nickname}</span>${welcome}
					</div>
				</c:if>
				<!-- 로그인시 닉네임 표출 끝-->
			</div>


			<div class="user_status">
				<ul>
					<c:if test="${empty userid}">
						<li><a href="javascript:void(0)" class="login">로그인</a></li>
						<li><a href="/joinForm">회원가입</a></li>
						<li><a id="search_glass" href="#">Search <img
								src="/Eunsol/imges/search_glass.svg" alt="search_glass Image">
						</a></li>
					</c:if>
					<c:if test="${not empty userid}">
						<li><a href="/logout" class="logout">로그아웃</a></li>
						<li><a href="/mypage">마이페이지</a></li>
						<li><a href="/addrecipe">글쓰기</a></li>
						<li><a id="search_glass" onclick="openPopup()">Search&#160;<img
								src="/Eunsol/imges/search_glass.svg" alt="search_glass Image">
						</a></li>
					</c:if>
				</ul>
			</div>
		</div>


		<div class="logo">
			<a href="/main"><img alt="메인홈으로 가기" src="Eunsol/imges/o_logo.png" title="메인홈으로 가기"></a>
		</div>
	</header>
	<!-- clear : both; -->
	

	<!-- 팝업 로그인 창 -->
	<div class="popup_login" id="pop1">
		<div class="close">
			<input type="checkbox" id="popcloseicon"> <label
				for="popcloseicon"> <img src="/Eunsol/imges/x.svg"
				alt="Close Image" id="popcloseimg"></label>
		</div>
		<div class="content">
			<div class="popup_logo">
				<img alt="로고" src="Eunsol/imges/o_logo.png">
			</div>
			<div class="basic_info">
				<div class="form_item user">
					<input type="text" id="login_id" name="id" placeholder=" 아이디"
						maxlength="20">
				</div>
				<div class="form_item pw">
					<input type="password" id="login_pw" name="pw" placeholder=" 비밀번호"
						maxlength="16">
				</div>
			</div>

			<div class="login error"></div>

			<div class="search_idpw">
				<ul>
					<li><a href="/findidForm" class="search id">아이디 찾기</a></li>
					<li><a href="/findpwForm" class="search pw">비빌번호 찾기</a></li>
				</ul>
			</div>


			<div class="login_btn">
				<button type="submit">로그인</button>
			</div>

			<div>
				계정이 없나요? <a href="/joinForm" class="sign_up">회원가입</a>
			</div>

		</div>
	</div>
	<!-- 팝업 로그인 창 끝-->
	<div class="dim"></div>
	
    <div class="popup-overlay2" id="popupOverlay2">
        <div class="popup2">
	<form action="/searchhtml" class="text_song2">
            <input type="text" name="title" class="search-bar2" placeholder="레시피 찾기">
             </form>
            <button class="close-button2" onclick="closePopup()">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>

	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="Eunsol/js/popup_login.js"></script>
	<script src="Eunsol/js/sidebar.js"></script>
</body>
</html>