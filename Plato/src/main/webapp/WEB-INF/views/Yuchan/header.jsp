<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
body {
  margin: 0 auto;
}

header {
  background-color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
}

.logo {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-grow: 1;
}

.logo img {
  width: auto;
  height: 60px;
}

.right-loginbtn,
.right-signupbtn {
  background-color: #000;
  color: #fff;
  padding: 15px 20px;
  margin-right: 10px;
  border: none;
  border-radius: 30px;
  cursor: pointer;
  font-size: 14px;
}

.Yuchan .white-back {
  width: 100%;
  height: 800px;
  background-color: white;
  position: absolute;
  top: 72px;
  display: none;
  z-index: 1000;
}

.Yuchan .final-touch {
  display: flex;
  justify-content: center;
  align-items: center;
}

.Yuchan .box,
.login-image {
  display: inline-block;
}

.Yuchan .box {
	position: absolute;
}

.Yuchan .login-image {
	position: relative;
	z-index: 100;
	height: 800px;
	width: auto;
	top: 50px;
	right: 15px;
}

.Yuchan .login-container {
	width: 400px;
	height: 550px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 15px;
	position: relative;
	z-index: 100;
	background-color: #none;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.Yuchan .logo {
	display: block;
	margin: 0 auto;
	max-height: 100px;
	width: auto;
	margin-bottom: 8px;
}

.Yuchan .login-button {
	background-color: black;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	height: 36px;
	width: 100%;
	margin-top: 15px;
	margin-bottom: 12px;
	border-radius: 10px;
}

.Yuchan .overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	display: none;
	z-index: 999;
}

.Yuchan .search_id, .search_pass {
	cursor: pointer;
	border: none;
	background-color: transparent;
	font-size: 12px;
}

.Yuchan .id-pass {
	display: flex;
	justify-content: space-between;
}

.Yuchan .pass-box {
	display: flex;
	align-items: center;
	float: right;
}

.Yuchan .id-box {
	display: flex;
	align-items: center;
	float: left;
}

.Yuchan p.greater_than {
	margin: 0px;
	font-weight: bold;
}

.Yuchan a {
	margin-top: 5px;
	margin-bottom: 0.3px;
}

.Yuchan select, input {
	margin-bottom: 8px;
}

.Yuchan #id, #password {
	width: calc(100% - 6px);
	height: 30px;
	border-radius: 10px;
	border: 1px solid #ccc;
}

.Yuchan a, .login-button {
	font-size: 12px;
	margin: 8px 0px 8px 0px;
}

.Yuchan .noaccount-div {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 0px;
}

.Yuchan .no_account, .text_singup {
	font-size: 12px;
	margin: 0px;
}

.Yuchan .text_singup {
	border: none;
	background: none;
	cursor: pointer;
}

.Yuchan .text_singup:hover, .search_id:hover, .search_pass:hover {
	text-decoration: underline;
}

.Yuchan1 .final-touch1 {
	display: flex;
	justify-content: center;
	align-items: center;
	min-width: 885px;
}

.Yuchan1 .box, .signup-image {
	display: inline-block;
}

.Yuchan1 .box {
	position: absolute;
}

.Yuchan1 .signup-image {
	position: absolute;
	z-index: 100;
	border-radius: 15px;
	height: 592px;
	width: auto;
	top: 110px;
}

.Yuchan1 .signup-container {
	top: 326px;
	width: 400px;
	height: 592px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 15px;
	position: relative;
	z-index: 100;
	background-color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	right: 243px;
}

.Yuchan1 .logo {
	display: block;
	margin: 0 auto;
	max-height: 100px;
	width: auto;
	margin-bottom: 8px;
}

.Yuchan1 .signup-button {
	background-color: black;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	height: 36px;
	width: 100%;
	margin-top: 15px;
	margin-bottom: 12px;
	border-radius: 10px;
}

.Yuchan1 .duplicate-check-button {
	display: inline-block;
	height: 36px;
	padding: 5px 10px;
	background-color: black;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	border-radius: 10px;
}

.Yuchan1 .overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	display: none;
	z-index: 999;
}

.Yuchan1 a {
	margin-top: 5px;
	margin-bottom: 0.3px;
}

.Yuchan1 #id, #nickname {
	width: 70%;
	margin-right: 3px;
}

.Yuchan1 #password, #password-check, #email {
	width: calc(100% - 10px);
}

.Yuchan1 select#gender, select#age {
	width: 100%;
}

.Yuchan1 .age-box {
	float: right;
	clear: right;
}

.Yuchan1 .gender-box, .age-box {
	display: inline-block;
	width: calc(50% - 10px);
}

.Yuchan1 select, input {
	margin-bottom: 8px;
}

.Yuchan1 #id, #nickname, #password, #password-check, #email, select#gender,
	select#age {
	height: 30px;
	border-radius: 10px;
	border: 1px solid #ccc;
}

.Yuchan1 a, .duplicate-check-button, .signup-button, select {
	font-size: 12px;
}
</style>
</head>
<body>
<header>
  <div class="logo">
    <img src="./img/logo1.png" alt="Logo">
  </div>
  <div style="position: absolute; right: 0;">
    <button class="right-loginbtn">로그인</button>
    <button class="right-signupbtn">회원가입</button>
  </div>
</header>
<div class="Yuchan">
  <div class="white-back">  <div class="final-touch">
    <div class="box">
      <div class="login-container">
        <img src="./img/logo2.png" class="logo">
        <form method="POST" action="/login">
          <div class="container">
            <a class="id-text">아이디</a> <br> <input type="text" id="id"
              name="id" required> <a class="password-text">비밀번호</a> <br>
            <input type="password" id="password" name="password" required>
            <div class="id-pass">
              <div class="id-box">
                <button class="search_id">아이디 찾기</button>
                <p class="greater_than">></p>
              </div>
              <div class="pass-box">
                <button class="search_pass">비밀번호 찾기</button>
                <p class="greater_than">></p>
              </div>
            </div>
          </div>
          <button type="submit" class="login-button">로그인</button>
          <div class="noaccount-div">
            <p class="no_account">계정이 없나요?</p>
            <button class="text_singup">회원 가입</button>
          </div>
        </form>
      </div>
    </div>
    <img src="./img/login-image.png" alt="Login Image" class="login-image">
  </div></div>
  <div class="overlay"></div>
</div>
<div class="Yuchan1">
	<div class="final-touch1">
		<div class="box">
			<div class="signup-container">
				<img src="./img/logo2.png" class="logo">
				<form method="POST" action="/signup">
					<div class="container">
						<a class="id-text">아이디</a> <br> <input type="text" id="id"
							name="id" required>
						<button type="button" class="duplicate-check-button">중복
							확인</button>

						<a class="nickname-text">별명</a> <br> <input type="text"
							id="nickname" name="nickname" required>
						<button type="button" class="duplicate-check-button">중복
							확인</button>

						<a class="password-text">비밀번호</a> <br> <input type="password"
							id="password" name="password" required> <a
							class="password-check-text">비밀번호 확인</a> <br> <input
							type="password" id="password-check" name="password-check"
							required> <a class="email-text">이메일</a> <br> <input
							type="email" id="email" name="email" required>
						<div class="gender-box">
							<a class="gender-text">성별</a> <br> <select id="gender"
								name="gender">
								<option value="">성별</option>
								<option value="male">여성</option>
								<option value="female">남성</option>
							</select>
						</div>
						<div class="age-box">
							<a class="age-text">연령대</a> <br> <select id="age" name="age">
								<option value="">연령대</option>
								<option value="10s">10대</option>
								<option value="20s">20대</option>
								<option value="30s">30대</option>
								<option value="40s">40대</option>
								<option value="50s">50대</option>
								<option value="60s">60대 이상</option>
							</select>
						</div>
					</div>
					<button type="submit" class="signup-button">가입하기</button>
				</form>
			</div>
		</div>
		<img src="./img/signup-image.jpg" alt="Signup Image" class="signup-image"></img>
	</div>
	<div class="overlay"></div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('.right-loginbtn').click(function() {
        $('.login-container').fadeIn();
        $('.login-image').fadeIn();
        $('.white-back').fadeIn();
        $('.overlay').fadeIn();
        $('.login-container').css('z-index', '10000');
        $('.login-image').css('z-index', '5000');
    });
    
    $('.overlay').click(function() {
        $('.login-container').fadeOut();
        $('.login-container').css('z-index', 'initial');
        $('.login-image').fadeOut();
        $('.login-image').css('z-index', 'initial');
        $('.white-back').fadeOut();  
        $('.overlay').fadeOut();
    });

    $('.login-container').hide();
    $('.login-image').hide();
});

$(document).ready(function() {
    $('.right-signupbtn').click(function() {
        $('.signup-container').fadeIn();
        $('.signup-image').fadeIn();
        $('.overlay').fadeIn();
        $('.signup-container').css('z-index', '10000');
        $('.signup-image').css('z-index', '1000');
    });
    
    $('.overlay').click(function() {
        $('.signup-container').fadeOut();
        $('.overlay').fadeOut();
        $('.signup-container').css('z-index', 'initial');
        $('.signup-image').fadeOut();
        $('.signup-image').css('z-index', 'initial');
    });

    $('.signup-container').hide();
    $('.signup-image').hide();
});
</script>
</body>
</html>
