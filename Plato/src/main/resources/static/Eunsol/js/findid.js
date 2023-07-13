const rqdInfo_email = document.querySelector(".findIdForm.email")
const rqdEmailInput = document.querySelector(".findIdForm.email input")
const rqdInfo_nickname = document.querySelector(".findIdForm.nickname")
const rqdNickInput = document.querySelector(".findIdForm.nickname input")

// 이메일 입력창에 커서가 생기면 앞에 이미지가 바뀌는
rqdEmailInput.addEventListener('focus', () => {
	rqdInfo_email.classList.add('a');
});

rqdEmailInput.addEventListener('blur', () => {
	if (rqdEmailInput.value === '') { rqdInfo_email.classList.remove('a'); }
		const insertMsg = document.querySelector(".insertMsg")
	if (rqdEmailInput.value !== ''&& insertMsg) {


		insertMsg.style.display = 'none';
	}
});


// 별명 입력창에 커서가 생기면 앞에 이미지가 바뀌는
rqdNickInput.addEventListener('focus', () => {
	rqdInfo_nickname.classList.add('a');
});

rqdNickInput.addEventListener('blur', () => {
	if (rqdNickInput.value === '') { rqdInfo_nickname.classList.remove('a'); }
	const insertMsg = document.querySelector(".insertMsg")
	if (rqdNickInput.value.trim().length !== 0 && insertMsg) { 
		insertMsg.style.display = 'none'; }
});




const emlfr = document.querySelector("#emlfr")

// 이메일형식이 아닐때 에러메세지 생성
let emailValid = true;
rqdEmailInput.addEventListener("blur", function() {
	const emailInput = rqdEmailInput.value;
	const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	if (emailInput === '') {
		emlfr.style.display = "none"; // 필드가 비어있을 때는 에러 메시지를 표시하지 않기
		rqdInfo_email.classList.remove('b')
		emailValid = true;
	} else if (emailRegex.test(emailInput)) {
		emlfr.style.display = 'none';
		rqdInfo_email.classList.remove('b')
		emailValid = true;
	} else {
		emlfr.style.display = 'block';
		rqdInfo_email.classList.add('b');
		emailValid = false;

	}

});

// 이메일 형식 체크
const find_button = document.querySelector(".find-button");

function checkEmailPattern(emailValue) {
	if (emailValue !== '') {
		return new Promise((resolve) => {
			console.log("이메일 패턴 블럭 들어왔당")
			const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			const isValid = pattern.test(emailValue);

			if (isValid) {
				resolve(false); // 유효한 아이디일 때 버튼 활성화
			} else {
				resolve(true)
			}
		});
	} else {
		// emailValue가 null인 경우 처리
		return Promise.resolve(false);; // 유효한 아이디로 간주하여 버튼 활성화
	}
}

async function emailBlur() {
	const emailValue = rqdEmailInput.value;
	const emailCheckPattern = await checkEmailPattern(emailValue)
	find_button.disabled = emailCheckPattern;
}
rqdEmailInput.addEventListener('blur', emailBlur);



// 아이디 찾기 버튼 눌렀을 때
find_button.addEventListener('click', function() {
	// ajax
	console.log("아이디 찾기 눌렀다");
	/*	console.log(join_gender.value)*/
	const xhr = new XMLHttpRequest();

	let url = "/findid?email=" + rqdEmailInput.value + "&nickname=" + rqdNickInput.value;

	xhr.open("post", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let result = JSON.parse(xhr.responseText);

		if (result.url) {
			console.log("정보일치");

			let id = result.id;
			let url = result.url;

			// URL에 nickname 추가하여 이동
			let nextPgae = url + "?id=" + id;
			window.location.href = nextPgae;
		}
		else {
			console.log("문제가 생겼다");
			let keys = Object.keys(result)
			let key = keys[0]
			let value = result[key]
			if (result.emailError) {
				console.log("이메일 형식 오류");
				emlfr.style.display = value;
				rqdInfo_email.classList.add('b');
				emailValid = false;
			}else if (result.nullError) {
				console.log("정보 불일치");
				let findId2_error = document.querySelector(".findId2.error");
				html = "<p class =\"" + key + "\">" + value + "</p>"
				findId2_error.innerHTML = html;
			}
			else if (result.insertMsg) {
				console.log("입력된정보 없음");
				let findId1_error = document.querySelector(".findId1.error");
				html = "<p class =\"" + key + "\">" + value + "</p>"
				findId1_error.innerHTML = html;
			}
			else {
				console.log("예상못한 오류");
				let findId2_error = document.querySelector(".findId1.error");
				html = "<p>고객센터에 문의해주세요!</p>"
				findId2_error.innerHTML = html;
			}

		}


	}

});







