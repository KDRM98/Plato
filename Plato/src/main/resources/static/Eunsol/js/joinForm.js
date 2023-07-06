const formItemInput = Array.from(document.querySelectorAll(".form_item input"));
const formItems = formItemInput.map(input => input.parentNode);

//커서가 생기면 앞에 이미지가 바뀌는
formItemInput.forEach((input, index) => {
	input.addEventListener('focus', () => {
		formItems[index].classList.add('a');
	});

	input.addEventListener('blur', () => {
		formItems[index].classList.remove('a');
	});
});

// 선택된 나이대 색이 검정색이 되도록
const age = document.querySelector("#age");
age.addEventListener('change', () => {
	age.style.color = 'black';
});


const pw = document.getElementById("join_pw");
const pw_ck = document.getElementById("join_pw_ck");
const pwError = document.querySelector("#pwMsg")
const formPwCk = document.querySelector(".form_item.pw_ck")

// 비밀번호 일치하지 않을 때 에러메세지 생성
// blur : HTML 요소에서 포커스가 빠져나가면 발생하는 이벤트
let isPasswordValid = true; // 패스워드의 유효성 여부를 저장하는 변수
pw_ck.addEventListener("blur", function() {
	const password = pw.value;
	const passwordConfirm = pw_ck.value;

	if (passwordConfirm === '') {
		pwError.style.display = "none";
		formPwCk.classList.remove('b');
		isPasswordValid = true;
	} else if (password === passwordConfirm) {
		pwError.style.display = 'none'
		formPwCk.classList.remove('b');
		isPasswordValid = true;
	} else {
		pwError.style.display = 'block';
		formPwCk.classList.add('b');
		isPasswordValid = false;
	}
});

const email = document.getElementById("email")
const emError = document.querySelector("#emMsg")
const formEmail = document.querySelector(".form_item.email")
// 이메일형식이 아닐때 에러메세지 생성
let isEmailValid = true;
email.addEventListener("blur", function() {
	const emailInput = email.value;
	const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	if (emailInput === '') {
		emError.style.display = "none"; // 필드가 비어있을 때는 에러 메시지를 표시하지 않기
		formEmail.classList.remove('b')
		isEmailValid = true;
	} else if (emailRegex.test(emailInput)) {
		emError.style.display = 'none';
		formEmail.classList.remove('b')
		isEmailValid = true;
	} else {
		emError.style.display = 'block';
		formEmail.classList.add('b');
		isEmailValid = false;

	}

});

const id = document.getElementById('join_id');
const duId = document.getElementById('duId');


id.addEventListener('blur', function() {
	// ajax
	console.log("id 중복확인 들어왔다");

	const xhr = new XMLHttpRequest();
	console.log("id.value : "+id.value);
	
	let url = "/idCheck?id="+id.value
	xhr.open("get", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
 		if (xhr.responseText === '-1') {
		duId.style.display='block';	}else{
			duId.style.display='none';
		}}

});



const nick = document.getElementById('join_nickname');
const duNick = document.getElementById('duNick');


nick.addEventListener('blur', function() {
	// ajax
	console.log("nickname 중복확인 들어왔다");

	const xhr = new XMLHttpRequest();
	console.log("nick.value : "+nick.value);
	
	let url = "/nickCheck?nickname="+nick.value
	xhr.open("get", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
 		if (xhr.responseText === '-1') {
		duNick.style.display='block';	}else{
			duNick.style.display='none';
		}}

});

