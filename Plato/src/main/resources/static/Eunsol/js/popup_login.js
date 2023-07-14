const formUser = document.querySelector(".form_item.user")
const formUserInput = document.querySelector(".form_item.user input")
const formPw = document.querySelector(".form_item.pw")
const formPwInput = document.querySelector(".form_item.pw input")

// 아이디 입력창에 커서가 생기면 앞에 이미지가 바뀌는
formUserInput.addEventListener('focus', () => {
	formUser.classList.add('a');
});

formUserInput.addEventListener('blur', () => {
	if (formUserInput.value === '') { formUser.classList.remove('a'); }
});


// 비번 입력창에 커서가 생기면 앞에 이미지가 바뀌는
formPwInput.addEventListener('focus', () => {
	formPw.classList.add('a');
});

formPwInput.addEventListener('blur', () => {
	if (formPwInput.value === '') { formUser.classList.remove('a'); }
});


//로그인 누르면 로그린 팝업이 뜨도록
const statusLogin = document.querySelectorAll(".login");
const popup = document.querySelector('.popup_login');
const dim = document.querySelector('.dim');
const popcloseimg = document.querySelector('#popcloseimg');

function loginPop() {
	popup.style.display = 'block';
	dim.style.display = 'block';
}

function closeloginPop() {
	popup.style.display = 'none';
	dim.style.display = 'none';
}

statusLogin.forEach((login) => {
	login.addEventListener('click', loginPop);
});

popcloseimg.addEventListener('click', closeloginPop);



//login check
const login_btn = document.querySelector('.login_btn button');


function errorMsg(msg, result){
			let key = Object.keys(result);
			let value = msg;
			html += "<p class =\"" + key + "\">" + value + "</p>"
						
};


login_btn.addEventListener('click', function() {
	console.log("로그인 눌렀다");

	const login_id = document.querySelector('#login_id');
	const login_pw = document.querySelector('#login_pw');



	// ajax
	const xhr = new XMLHttpRequest();

	let url = "/login_check?id=" + login_id.value + "&pw=" + login_pw.value;

	xhr.open("post", url);

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		
		let result = JSON.parse(xhr.responseText);
		if (result.url) {
			let logincomp = JSON.parse(xhr.responseText);
			console.log("여기왔다")
			let url = logincomp.url;
			let nickname = logincomp.nickname;
			let nextPage = url + "?nickname=" + nickname;
			window.location.href = nextPage;
			
		} else {
			html = ""
			if(result.msg){errorMsg(result.msg,result);}
			if(result.idNullMsg){errorMsg(result.idNullMsg,result);}
			if(result.pwNullMsg){errorMsg(result.pwNullMsg,result);}		
			let login_error = document.querySelector('.login.error');
			login_error.innerHTML = html;	
		}
		
		
		
		/* else if (result.idNullMsg) {
			let map = JSON.parse(xhr.responseText);
			const key = Object.keys(map);
			let value = map.idNullMsg
			html = ""
			html += "<p class =\"" + key + "\">" + value + "</p>"
			login_error.innerHTML = html;
		} else if (result.pwNullMsg) {
			let map = JSON.parse(xhr.responseText);
			const key = Object.keys(map);
			let value = map.pwNullMsg
			html = ""
			html += "<p class =\"" + key + "\">" + value + "</p>"
			login_error.innerHTML = html;
		}*/




	}

});



