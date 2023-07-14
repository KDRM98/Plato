<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/joinForm.css">
</head>
<body>
	<!-- <form id="join_form" action="/join" method="post"> -->
		<div class="join_container">
			<div class="form_content">
				<div class="basic_info">

					<div class="joinform_item user">
						<input type="text" id="join_id" name="id" data-id="Id"
							placeholder=" 아이디"  >
					</div>

					<div class="joinform_item pw">
						<input type="password" id="join_pw" name="pw" placeholder=" 비밀번호"
							maxlength="16"  >
					</div>
					<div class="joinform_item pw_ck">
						<input type="password" id="join_pw_ck" name="pw_ck"
							placeholder=" 비밀번호 재확인" maxlength="16"  >
					</div>
					<div class="joinform_item email">
						<input type="email" id="email" name="email"
							placeholder=" 비밀번호 분실 시 확인용 이메일" >
					</div>
				</div>

				<div class="error">
					<div id="idRstr">아이디는 5~20자의 영문 소문자, 숫자만 사용 가능합니다.</div>
					<div id="duId">이미 사용중인 아이디 입니다.</div>
					<div>${duId}</div>
					<div id="pwRstr">비밀번호는 5~16자의 영문, 숫자, 특수문자 조합이 필수입니다. </div>
					<div id="pwMsg">비밀번호가 일치하지 않습니다.</div>
					<!-- <div id="emailMsg">비밀번호 분실 시 확인용 이메일은 필수 정보입니다.</div> -->
					<div id="emMsg">이메일 형식이 올바르지 않습니다.</div>
					<div>${emMsg}</div>
				</div>

				<div class="add_info">
					<div class="joinform_item nickname">
						<input type="text" id="join_nickname" name="nickname"
							placeholder=" 별명" maxlength="10" >
					</div>
					<div class="select_box">
						<ul class="box gender">
							<li class="joinradio_item"><input type="radio" id="M"
								name="gender" value="M"> <label for="M">남자</label></li>
							<li class="joinradio_item"><input type="radio" id="F"
								name="gender" value="F" checked=true> <label for="F">여자</label></li>
						</ul>
						<div class="box age">
							<select id="age" name="age">
								<option value="-1" selected disabled style="color: #929294;">연령대
									선택</option>
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">60대 이상</option>
							</select>
						</div>
					</div>
				</div>

				<div class="nick error">
					<div id="duNick">이미 사용중인 별명입니다.</div>
				</div>

				<div>
					<button type="submit" class="signup-button">가입하기</button>
				</div>
				<div class="null error">
	<%-- 				<p class="nullError Id">${errorId}</p>
					<p class="nullError Pw">${errorPw}</p>
					<p class="nullError Pw_ck">${errorPw_ck}</p>
					<p class="nullError Email">${errorEmail}</p>
					<p class="nullError Nickname">${errorNickname}</p>
					<p class="errorNull Gender">${errorGender}</p>
					<p class="errorNull Age">${errorAge}</p> --%>
				</div>
			</div>
		</div>
<!-- 	</form> -->




	<!-- js -->
	<script src="Eunsol/js/joinForm.js"></script>
</body>
</html>