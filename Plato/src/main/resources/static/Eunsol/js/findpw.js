const rqdInfo_id = document.querySelector(".findPwForm.id")
const rqdIdInput = document.querySelector(".findPwForm.id input")
const rqdInfo_email = document.querySelector(".findPwForm.email")
const rqdEmailInput = document.querySelector(".findPwForm.email input")
const rqdInfo_nickname = document.querySelector(".findPwForm.nickname")
const rqdNickInput = document.querySelector(".findPwForm.nickname input")

// 아이디입력창에 커서가 생기면 앞에 이미지가 바뀌는
rqdIdInput.addEventListener('focus', () => {
	rqdInfo_id.classList.add('a');
});

rqdIdInput.addEventListener('blur', () => {
	if (rqdIdInput.value === '') { rqdInfo_id.classList.remove('a'); }
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
