<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/profile.css">
<link rel="stylesheet" href="Eunsol/css/pop_profilecomp.css">
<link rel="stylesheet" href="Eunsol/css/drop.css">
</head>
<body>

		<div class="profile_container">
			<div class="profile_content">
				<!-- 프로필 사진 -->
				<div class="title">
					<strong>회원정보 수정</strong>
				</div>
				<div class="circle-container">
					<img class="circle" src="${image}" pre_date="${image}">
					<button class="circle-camera">
						<img src="Eunsol/imges/camera.png">
					</button>
				</div>
				
				<div class = " static_id">
					<strong>${id}</strong>
				</div>

				<div class="add_info">
					<div class="form_item email">
						<input type="email" id="email" name="email"
							placeholder=" 비밀번호 분실 시 확인용 이메일" pre_date="${email}" value="${email}">
					</div>
					<div class="form_item nickname">
						<input type="text" id="nickname" name="nickname" placeholder=" 별명"
							maxlength="10" pre_date="${nickname}" value="${nickname}">
					</div>
					<div class="select_box">



						<ul class="box gender" pre_date="${gender}">
							<li class="radio_item"><input type="radio" id="M"
								name="gender" value="M" ${gender == "M" ? 'checked' : ''} >
								<label for="M">남자</label></li>
							<li class="radio_item"><input type="radio" id="F"
								name="gender" value="F" ${gender == "F" ? 'checked' : ''}>
								<label for="F">여자</label></li>
						</ul>




						<div class="box age">
							<select id="age" name="age" pre_date="${age}">
								<option value="" selected disabled style="color: #929294;">연령대
									선택</option>
								<option value="10" ${age == 10 ? 'selected' : ''}>10대</option>
								<option value="20" ${age == 20 ? 'selected' : ''}>20대</option>
								<option value="30" ${age == 30 ? 'selected' : ''}>30대</option>
								<option value="40" ${age == 40 ? 'selected' : ''}>40대</option>
								<option value="50" ${age == 50 ? 'selected' : ''}>50대</option>
								<option value="60" ${age == 60 ? 'selected' : ''}>60대이상</option>

								<%-- <option value="60" <c:if test="${gender == 60}">selected</c:if>60대이상</option>
								
								<c:if test="${gender == 60}">
									<option value="60" selected>60대이상</option>
								</c:if>
								<c:if test="${gender != 60}">
									<option value="60">60대이상</option>
								</c:if> --%>
							</select>
						</div>
					</div>
				</div>


				<div class="profile2 error">
					<div id="emailMsg">이메일 형식이 올바르지 않습니다.</div>
					<div id="duNick">이미 사용중인 아이디 입니다.</div>
				</div>
				<div>
					<button type="submit" class="save-button">정보 변경하기</button>
				</div>


				<div class="pw_info">
					<div class="form_item pw">
						<input type="password" id="pw" name="pw" placeholder="기존 비밀번호"
							maxlength="16">
					</div>
					<div class="form_item newPw">
						<input type="password" id="newPw" name="pw" placeholder="새로운 비밀번호"
							maxlength="16">
					</div>
					<div class="form_item newPw_ck">
						<input type="password" id="newPw_ck" name="pw_ck"
							placeholder="새로운 비밀번호 재확인" maxlength="16">
					</div>
				</div>

				<div class="profile1 error">
					<div id="pwMsg">새로운 비밀번호가 일치하지 않습니다.</div>
				</div>

				<div>
					<button type="submit" class="pwSave-button">비밀번호 변경하기</button>
				</div>




				<div>
					<button type="button" class="cancle-button">취소하기</button>
				</div>
			</div>
		</div>




	<!-- 팝업 로그인 창 -->
	<div class="pop_profilecomp" >
		<div class="content">

			<div class="mdfd">
			<div>예시 문구입니다.</div>
			</div>
			
			<div class="profilecomp-btn">
				<a href="/profile" class="btn check">확인</a> <a href="/header" class="btn home">홈으로</a>
			</div>

		</div>
		</div>
		<!-- 팝업 로그인 창 끝-->
		<div class="dim"></div>



















		<div class="meiyou"></div>

			<div class="unregister">
				<div class="title">
					<span>회원탈퇴</span>
				</div>
				<p>
					사용하고 계신 아이디는 탈퇴할 경우 재사용 및 <span class="highlight">복구가
						불가능합니다.</span><br> 탈퇴한 아이디는 본인과 타인 모두 <span class="highlight">재사용
						및 복구가 불가하오니</span> 신중하게 선택하시기 바랍니다.<br> 회원 탈퇴를 진행했을 경우, 30일 이후에 자동으로
					<span class="highlight">삭제</span>됩니다. <br> 삭제를 취소하고 싶을 경우 저희
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
	


		<!-- js -->
		<script src="Eunsol/js/drop.js"></script>
		<script src="Eunsol/js/profile_error.js"></script>
		<script src="Eunsol/js/profile.js"></script>
</body>
</html>