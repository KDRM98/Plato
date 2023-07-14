const pw = document.getElementById("newPw");
const pw_ck = document.getElementById("newPw_ck");
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


/*// 이메일형식이 아닐때 에러메세지 생성
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

});*/

// const save_button = document.querySelector(".save-button");


//이메일 형식 체크
let isEmailValid = true;
function checkEmailPattern(emailValue) {
	if (emailValue !== '') {
		return new Promise((resolve) => {
			console.log("이메일 패턴 블럭 들어왔당")
			const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			const isValid = pattern.test(emailValue);

			if (isValid) {
				emError.style.display = 'none';
				isEmailValid = true;
				resolve(false); // 유효한 아이디일 때 버튼 활성화
			} else {
				emError.style.display = 'block';
				isEmailValid = false;
				resolve(true)
			}
		});
	} else {
		// emailValue가 null인 경우 처리
		emError.style.display = "none"; // 필드가 비어있을 때는 에러 메시지를 표시하지 않기
		isEmailValid = true;
		return Promise.resolve(false);; // 유효한 아이디로 간주하여 버튼 활성화
	}
}

//중복확인(닉네임)
let exst_nick = document.querySelector(".profile_content #nickname").value;
function checkDuplicateValue(inputValue, url, duElement) {
	return new Promise((resolve) => {
		
let new_nickname = document.querySelector(".profile_content #nickname").value;
		const xhr = new XMLHttpRequest();
		xhr.open("get", url);
		xhr.send();

		xhr.onload = function() {
			console.log(xhr.responseText);if (exst_nickname !== new_nickname){
			if (xhr.responseText === '-1') { // 자신의 아이디면 중복된걸로 나옴 문제 해결요망
				duElement.style.display = 'block';
				resolve(true); // 중복 상태 발견
			} else {
				duElement.style.display = 'none';
				resolve(false); // 중복 상태 발견되지 않음
			}
		}else{
			duElement.style.display = 'none';
			resolve(false); // 중복 상태 발견되지 않음
		};
		}
	});
}

let nick = document.querySelector("#nickname")
let duNick = document.querySelector("#duNick")

async function handleBlur() {
	const emailValue = email.value;
	const emailCheckPattern = await checkEmailPattern(emailValue)

	const nickValue = nick.value;
	const nickUrl = "/nickCheck?nickname=" + nickValue;
	const nickDuplicate = await checkDuplicateValue(nickValue, nickUrl, duNick);
	save_button.disabled = emailCheckPattern || nickDuplicate; // 중복 상태가 하나라도 발견되면 true
}

email.addEventListener('blur', handleBlur);
nick.addEventListener('blur', handleBlur);


