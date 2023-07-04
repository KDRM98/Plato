const formUser = document.querySelector(".form_item.user")
const formUserInput = document.querySelector(".form_item.user input")
const formPw = document.querySelector(".form_item.pw")
const formPwInput = document.querySelector(".form_item.pw input")

// 아이디 입력창에 커서가 생기면 앞에 이미지가 바뀌는
formUserInput.addEventListener('focus', () => {
  formUser.classList.add('a');
});

formUserInput.addEventListener('blur', () => {
  formUser.classList.remove('a');
});


// 비번 입력창에 커서가 생기면 앞에 이미지가 바뀌는
formPwInput.addEventListener('focus', () => {
  formPw.classList.add('a');
});

formPwInput.addEventListener('blur', () => {
  formPw.classList.remove('a');
});
