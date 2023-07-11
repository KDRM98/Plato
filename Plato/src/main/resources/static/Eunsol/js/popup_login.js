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


//로그인 누르면 로그린 팝업이 뜨도록
const statusLogin = document.querySelectorAll(".login");
const popup = document.querySelector('.popup_login');
const dim = document.querySelector('.dim');
const popcloseimg = document.querySelector('#popcloseimg');

function loginPop(){ 
 popup.style.display = 'block';
 dim.style.display = 'block';
}

function closeloginPop(){ 
 popup.style.display = 'none';
 dim.style.display = 'none';
}


statusLogin.forEach((login)=> {

 login.addEventListener('click',loginPop);

});


popcloseimg.addEventListener('click',closeloginPop);

