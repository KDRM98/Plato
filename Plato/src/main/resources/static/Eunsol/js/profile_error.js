const pw = document.getElementById("pw");
const pw_ck = document.getElementById("pw_ck");
const email = document.getElementById("email")
const pwError = document.querySelector("#pwMsg")
const emError = document.querySelector("#emailMsg")


// 비밀번호 일치하지 않을 때 에러메세지 생성
// blur : HTML 요소에서 포커스가 빠져나가면 발생하는 이벤트
let isPasswordValid = true; // 패스워드의 유효성 여부를 저장하는 변수
pw_ck.addEventListener("blur", function() {
	const password = pw.value;
	const passwordConfirm = pw_ck.value;

	if (passwordConfirm === '') {
		pwError.style.display = "none";
		isPasswordValid = true;
	} else if (password === passwordConfirm) {
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





