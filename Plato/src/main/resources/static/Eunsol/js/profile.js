const formPw = document.querySelector(".form_item.pw")
const formPwInput = document.querySelector(".form_item.pw input")
const formPwCk = document.querySelector(".form_item.pw_ck")
const formPwCkInput = document.querySelector(".form_item.pw_ck input")
const formEmail = document.querySelector(".form_item.email")
const formEmailInput = document.querySelector(".form_item.email input")
const nickname = document.querySelector(".nickname")
const nicknameInput = document.querySelector(".nickname input")

// 비번 입력창에 커서가 생기면 앞에 이미지가 바뀌는
formPwInput.addEventListener('focus', () => {
  formPw.classList.add('a');
});

formPwInput.addEventListener('blur', () => {
  formPw.classList.remove('a');
});

// 비번체크 입력창에 커서가 생기면 앞에 이미지가 바뀌는
formPwCkInput.addEventListener('focus', () => {
  formPwCk.classList.add('a');
});

formPwCkInput.addEventListener('blur', () => {
  formPwCk.classList.remove('a');
});


// 이메일 입력창에 커서가 생기면 앞에 이미지가 바뀌는
formEmailInput.addEventListener('focus', () => {
  formEmail.classList.add('a');
});

formEmailInput.addEventListener('blur', () => {
  formEmail.classList.remove('a');
});


// 닉네임 입력창에 커서가 생기면 앞에 이미지가 바뀌는
nicknameInput.addEventListener('focus', () => {
  nickname.classList.add('a');
});

nicknameInput.addEventListener('blur', () => {
  nickname.classList.remove('a');
});

