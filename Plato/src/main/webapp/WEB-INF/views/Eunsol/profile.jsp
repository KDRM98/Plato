<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/profile.css">
<link rel="stylesheet" href="Eunsol/css/drop.css">
</head>
<body>
	<form id="join_form" action="" method="post">
		<div class="join_container">
			<div class="form_content">
				<!-- 프로필 사진 -->
				<div class="circle-container">
					<img class="circle" src="Eunsol/imges/basic.jpg">
					<%-- <form action="/member/updateImg" method="post" enctype="multipart/form-data">
							<input type="file" name="file"> <input type="hidden" name="memberId" id="memberId" value="${login.memberID}"> --%>
					<button class="circle-camera">
						<img src="Eunsol/imges/Photograph.png">
					</button>
				</div>
				<div class="basic_info">
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
					<div id="pwMsg">비밀번호가 일치하지 않습니다.</div>
					<div id="emailMsg">이메일 형식이 올바르지 않습니다.</div>

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
								<option value="" selected disabled style="color: #929294;">연령대
									선택</option>
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
	
				</div>

				<div>
					<button type="submit" class="signup-button">저장하기</button>
				</div>
			</div>
		</div>
	</form>
<div class="meiyou"></div>
	<form id="withdrawal" action="" method="post">
		<div class="unregister">
			<div class="title">
				<span>회원탈퇴</span>
			</div>
			<p>
				사용하고 계신 아이디는 탈퇴할 경우 재사용 및 <span class="highlight">복구가 불가능합니다.</span><br>
				탈퇴한 아이디는 본인과 타인 모두 <span class="highlight">재사용 및 복구가 불가하오니</span>
				신중하게 선택하시기 바랍니다.<br> 회원 탈퇴를 진행했을 경우, 30일 이후에 자동으로 <span
					class="highlight">삭제</span>됩니다. <br> 삭제를 취소하고 싶을 경우 저희
				고객센터(biz@plato.co.kr)을 통해 연락주시기 바랍니다.<br>
			</p>

			<div class="agreement">
				<label> <input type="checkbox" id="agree"> <em></em>
					<span style="color: #e7223d; font-weight: bold;">회원 탈퇴에
						동의합니다.</span>
				</label>


				<!-- <label> <input type="radio" id="agree" name="agree">
					<span>회원 탈퇴에 동의합니다.</span>
				</label> -->
			</div>

			<!-- 회원 탈퇴 버튼 -->
			<div>
				<button type="submit" id="unregister-button">회원 탈퇴</button>
			</div>


			<!-- 팝업창 -->
			<div class="overlay">
				<!-- 팝업 창이 떳을 때 배경을 어둡게 처리
                                         팝업 이외의 부분을 클릭할 수 없게 -->
				<div class="popup">
					<h4>정말로 탈퇴하시겠습니까?</h4>
					<button id="confirm-btn">확인</button>
					<button id="cancle-btn">취소</button>
				</div>
			</div>
		</div>
	</form>
	
	
	<!-- js -->
	<script src="Eunsol/js/drop.js"></script>
	<script src="Eunsol/js/profile_error.js"></script>
</body>
</html>