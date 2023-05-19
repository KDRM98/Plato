const passwordInput = document.getElementById("password");
const passwordCheck = document.getElementById("password-check");
const email = document.getElementById("email")
const pwError = document.querySelector(".pw_error")
const emError = document.querySelector(".email_error")
const withdrawBtn = document.querySelector(".unregister-button");
const overlay = document.querySelector(".overlay");
const popup = document.querySelector(".popup");
const confirmBtn = document.getElementById("confirm-btn");
const cancleBtn = document.getElementById("cancle-btn");
var agreeCheckbox = document.querySelector('.agreement input[type="radio"]');

// 비밀번호 일치하지 않을 때 에러메세지 생성
// blur : HTML 요소에서 포커스가 빠져나가면 발생하는 이벤트
let isPasswordValid = true; // 패스워드의 유효성 여부를 저장하는 변수
passwordCheck.addEventListener("blur", function() {
	const password = passwordInput.value;
	const rePassword = passwordCheck.value;
	console.log(password === rePassword)
	if (rePassword === '') {
		pwError.style.display = "none"; // 필드가 비어있을 때는 에러 메시지를 표시하지 않기
		isPasswordValid = true;
	} else if (password === rePassword) {
		pwError.style.display = 'none';
		isPasswordValid = true;
	} else {
		pwError.style.display = 'block';
		isPasswordValid = false;
	}

});


// 이메일형식이 아닐때 에러메세지 생성
let isEmailValid = true;
email.addEventListener("blur", function() {
	const emailInput = email.value;
	const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	if (emailInput === '') {
		emError.style.display = "none"; // 필드가 비어있을 때는 에러 메시지를 표시하지 않기
		isEmailValid = true;
	} else if (emailRegex.test(emailInput)) {
		emError.style.display = 'none';
		isEmailValid = true;
	} else {
		emError.style.display = 'block';
		isEmailValid = false;
	}

});




// 회원탈퇴 동의 라디오 버튼 활성 비활성
var clickCount = 0;

agreeCheckbox.addEventListener("click", function() {
	clickCount++;

	if (clickCount % 2 === 0) {
		this.checked = false;
	}
});

//회원탈퇴 동의 라디오 눌러야 회원탈퇴 버튼 활성화 되도록
withdrawBtn.addEventListener("click", function() {
	if (agreeCheckbox.checked) {
		overlay.style.display = "block";
		popup.style.display = "block";
	}
});

//회원탈퇴 최종 확인시 메인페이지로 돌아가도록
confirmBtn.addEventListener("click", function() {
	// 탈퇴 처리 로직 추가
	alert("탈퇴되었습니다.");
	overlay.style.display = "none";
	popup.style.display = "none";
	window.location.href = "https://www.naver.com"; // 메인페이지 주소 넣기
});

//회원탈퇴 최종 취소시 원 페이지로 돌아가도록
cancleBtn.addEventListener("click", function() {
	overlay.style.display = "none";
	popup.style.display = "none";
});