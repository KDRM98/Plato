const rqdInfo_id = document.querySelector(".findPwForm.id")
const rqdIdInput = document.querySelector(".findPwForm.id input")
const rqdInfo_email = document.querySelector(".findPwForm.email")
const rqdEmailInput = document.querySelector(".findPwForm.email input")
const rqdInfo_nickname = document.querySelector(".findPwForm.nickname")
const rqdNickInput = document.querySelector(".findPwForm.nickname input")
let nullInfo = document.querySelector(".nullInfo")
// 아이디입력창에 커서가 생기면 앞에 이미지가 바뀌는
rqdIdInput.addEventListener('focus', () => {
	rqdInfo_id.classList.add('a');
});

rqdIdInput.addEventListener('blur', () => {
	if (rqdIdInput.value === '') { rqdInfo_id.classList.remove('a'); }
	if (rqdIdInput.value !== '') {
		nullInfo.style.display = 'none';
	}

});

// 이메일 입력창에 커서가 생기면 앞에 이미지가 바뀌는
rqdEmailInput.addEventListener('focus', () => {
	rqdInfo_email.classList.add('a');
});

rqdEmailInput.addEventListener('blur', () => {
	if (rqdEmailInput.value === '') { rqdInfo_email.classList.remove('a'); }
});


// 별명 입력창에 커서가 생기면 앞에 이미지가 바뀌는
rqdNickInput.addEventListener('focus', () => {
	rqdInfo_nickname.classList.add('a');
});

rqdNickInput.addEventListener('blur', () => {
	if (rqdNickInput.value === '') { rqdInfo_nickname.classList.remove('a'); }
});



// 이메일 형식 체크 에러문구 & 버튼 막기
const emlfr = document.querySelector("#emlfr")
const find_button = document.querySelector(".find-button");
// 이메일형식이 아닐때 에러메세지 생성
let emailValid = true;
rqdEmailInput.addEventListener("blur", function() {
	const emailInput = rqdEmailInput.value;
	const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	if (emailInput === '') {
		emlfr.style.display = "none"; // 필드가 비어있을 때는 에러 메시지를 표시하지 않기
		rqdInfo_email.classList.remove('b')
		emailValid = true;
		find_button.disabled = false;
	} else if (emailRegex.test(emailInput)) {
		emlfr.style.display = 'none';
		rqdInfo_email.classList.remove('b')
		emailValid = true;
		find_button.disabled = false;
	} else {
		emlfr.style.display = 'block';
		rqdInfo_email.classList.add('b');
		emailValid = false;
		find_button.disabled = true;

	}

});


// 비밀번호 찾기버튼 눌렀을 때
find_button.addEventListener('click', function() {
	// ajax
	console.log("비번 찾기 눌렀다");

	if (rqdIdInput.value.trim().length === 0
		|| rqdEmailInput.value.trim().length === 0
		|| rqdNickInput.value.trim().length === 0) {
		/*const findPw_error = document.querySelector(".findPw_error")
		html = "<div class='nullInfo'>정보를 입력해 주세요</div>"
		findPw_error.innerHTML=html;*/
		nullInfo.style.display = 'block';
		return
	}


	const xhr = new XMLHttpRequest();

	let url = "/findpw?id=" + rqdIdInput.value
		+ "&email=" + rqdEmailInput.value
		+ "&nickname=" + rqdNickInput.value

	xhr.open("post", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	console.log("AJAX실행");

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let result = JSON.parse(xhr.responseText);
		if (result.url) {
			console.log("비밀번호 메일전송 완료페이지로 이동 슝슝");

			let url = result.url;
			let nextPgae = url
			
			window.location.href = nextPgae;
			
		} else if (result.nullError) {
			console.log("일치하는 정보가 없습니다.");
			
			let value = result.nullError;
			
			let pop_finpwcomp = document.querySelector(".pop_findpwcomp");
			pop_finpwcomp.style.display = "block"
			
			let mdfp = document.querySelector(".pop_findpwcomp .mdfp");
			html = "<div>" + value + "</div>"
			mdfp.innerHTML = html;
			
		}else{
			console.log("예상치 못한 문제 발생");
			
			let pop_finpwcomp = document.querySelector(".pop_findpwcomp");
			pop_finpwcomp.style.display = "block"
			
			let mdfp = document.querySelector(".pop_findpwcomp .mdfp");
			html = "<div>고객센터에 문의하세요</div>"
			mdfp.innerHTML = html;
		}

	}

});


