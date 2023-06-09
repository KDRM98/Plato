<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/join.css">
</head>
<body>
	<form id="join_form" action="" method="post">
		<div class="join_container">
			<div class="form_content">
				<div class="basic_info">
					<div class="form_item user">
						<input type="text" id="id" name="id" placeholder=" 아이디" value
							maxlength="10" required>
					</div>
					<div class="form_item pw">
						<input type="password" id="pw" name="pw" placeholder=" 비밀번호" value
							maxlength="10" required>
					</div>
					<div class="form_item pw_ck">
						<input type="password" id="pw_ck" name="pw_ck"
							placeholder=" 비밀번호 재확인" value maxlength="10" required>
					</div>
					<div class="form_item email">
						<input type="email" id="email" name="email"
							placeholder=" 비밀번호 분실 시 확인용 이메일" required>
					</div>
				</div>

				<div class="error">
					<div id="idMsg">아이디는 필수 정보입니다.</div>
					<div>이미 사용중인 아이디 입니다.</div>
					<div id="pswdMsg">비밀번호는 필수 정보입니다.</div>
					<div>비밀번호가 일치하지 않습니다.</div>
					<div id="emailMsg">비밀번호 분실 시 확인용 이메일은 필수 정보입니다.</div>
					<div>이메일 형식이 올바르지 않습니다.</div>
				</div>

				<div class="add_info">
					<div class="nickname">
						<input type="text" id="nickname" name="nickname" placeholder=" 별명"
							value maxlength="10" required>
					</div>
					<div class="select_box">
						<ul class="box gender">
							<li class="radio_item"><input type="radio" id="M"
								name="gender" value="M"> <label for="M">남자</label></li>
							<li class="radio_item"><input type="radio" id="F" 
								name="gender" value="F"> <label for="F">여자</label></li>
						</ul>
						<div class="box age">
							<select id="age" name="age">
								<option value="" selected disabled style="color:#929294; ">연령대 선택</option>
								<option value="10s">10대</option>
								<option value="20s">20대</option>
								<option value="30s">30대</option>
								<option value="40s">40대</option>
								<option value="50s">50대</option>
								<option value="60s">60대 이상</option>
							</select>
						</div>
					</div>
				</div>

				<div class="error">
					<div id="nickMsg">이미 사용중인 별명입니다.</div>
				</div>

				<div>
					<button type="submit" class="signup-button">가입하기</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>