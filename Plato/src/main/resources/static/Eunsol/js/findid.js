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
});


// 별명 입력창에 커서가 생기면 앞에 이미지가 바뀌는
rqdNickInput.addEventListener('focus', () => {
	rqdInfo_nickname.classList.add('a');
});

rqdNickInput.addEventListener('blur', () => {
	if (rqdNickInput.value === '') { rqdInfo_nickname.classList.remove('a'); }
});
