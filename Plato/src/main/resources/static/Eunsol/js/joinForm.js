//커서가 생기면 앞에 이미지가 바뀌는
const formItemInput = Array.from(document.querySelectorAll(".joinform_item input"));
const formItems = formItemInput.map(input => input.parentNode);

formItemInput.forEach((input, index) => {
	input.addEventListener('focus', () => {
		formItems[index].classList.add('a');
	});

	input.addEventListener('blur', () => {
		if (input.value === '') {
			formItems[index].classList.remove('a');
		}
	});
});

// 선택된 나이대 색이 검정색이 되도록
const age = document.querySelector("#age");
age.addEventListener('change', () => {
	age.style.color = 'black';
	age.value
});


// 비밀번호 일치하지 않을 때 에러메세지 생성
// blur : HTML 요소에서 포커스가 빠져나가면 발생하는 이벤트
const join_pw = document.getElementById("join_pw");
const pw_ck = document.getElementById("join_pw_ck");
const pwError = document.querySelector("#pwMsg")
const formPwCk = document.querySelector(".joinform_item.pw_ck")

let isPasswordValid = true; // 패스워드의 유효성 여부를 저장하는 변수
pw_ck.addEventListener("blur", function() {
	const password = join_pw.value;
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
const formEmail = document.querySelector(".joinform_item.email")
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

/*// id 증복확인
const id = document.getElementById('join_id');
const duId = document.getElementById('duId');
const sinup_btn = document.querySelector(".signup-button")


id.addEventListener('blur', function() {
	// ajax
	console.log("id 중복확인 들어왔다");

	const xhr = new XMLHttpRequest();
	console.log("id.value : " + id.value);

	let url = "/idCheck?id=" + id.value
	xhr.open("get", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		sinup_btn.disabled = false
		if (xhr.responseText === '-1') {
			duId.style.display = 'block';
			sinup_btn.disabled = true; // 버튼 비활성화
		} else {
			duId.style.display = 'none';
		
			sinup_btn.disabled = false; // 버튼 활성화
		}
	}

});



const nick = document.getElementById('join_nickname');
const duNick = document.getElementById('duNick');


nick.addEventListener('blur', function() {
	// ajax
	console.log("nickname 중복확인 들어왔다");

	const xhr = new XMLHttpRequest();
	console.log("nick.value : " + nick.value);

	let url = "/nickCheck?nickname=" + nick.value
	xhr.open("get", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		if (xhr.responseText === '-1') {
			duNick.style.display = 'block';
			sinup_btn.disabled = true; // 버튼 비활성화
			
		} else {
			duNick.style.display = 'none';
			sinup_btn.disabled = false;

			 // 버튼 활성화
		}
	}

});
*/
// id 및 nickname 증복, id 형식 안맞을 시  가입하기 버튼 불능
const id = document.getElementById('join_id');
const duId = document.getElementById('duId');
const nick = document.getElementById('join_nickname');
const duNick = document.getElementById('duNick');
const sinup_btn = document.querySelector(".signup-button");

const idRstr = document.getElementById('idRstr');
const pwRstr = document.getElementById('pwRstr');

function checkDuplicateValue(inputValue, url, duElement) {
	return new Promise((resolve) => {
		const xhr = new XMLHttpRequest();
		xhr.open("get", url);
		xhr.send();

		xhr.onload = function() {
			console.log(xhr.responseText);
			if (xhr.responseText === '-1') {
				duElement.style.display = 'block';
				resolve(true); // 중복 상태 발견
			} else {
				duElement.style.display = 'none';
				resolve(false); // 중복 상태 발견되지 않음
			}
		};
	});
}

function checkIdPattern(idValue) {
	if (idValue !== '') {
		return new Promise((resolve) => {
			const pattern = /^[a-z0-9]{5,20}$/;
			const isValid = pattern.test(idValue);

			if (isValid) {
				idRstr.style.display = 'none';
				resolve(false); // 유효한 아이디일 때 버튼 활성화
			} else {
				idRstr.style.display = 'block';
				resolve(true)
			}
		});
	} else {
		// idValue가 null인 경우 처리
		return Promise.resolve(false);; // 유효한 아이디로 간주하여 버튼 활성화
	}
}


function checkPwPattern(pwValue) {
	if (pwValue !== '') {
		return new Promise((resolve) => {

			const hasLowercase = /[a-z]/.test(pwValue);
			const hasNumber = /[0-9]/.test(pwValue);
			const hasSpecialChar = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/.test(pwValue);
			/*const isValidLength = pwValue.length >= 5 && pwValue.length <= 16;*/

			const result = hasLowercase && hasNumber && hasSpecialChar /*&& isValidLength*/;
			if (result) {
				pwRstr.style.display = 'none';
				resolve(false); // 유효한 아이디일 때 버튼 활성화
			} else {
				pwRstr.style.display = 'block';
				resolve(true)
			}
		});
	} else {
		// idValue가 null인 경우 처리
		return Promise.resolve(false);; // 유효한 아이디로 간주하여 버튼 활성화
	}
}


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


async function handleBlur() {
	const idValue = id.value;
	const idUrl = "/idCheck?id=" + idValue;
	const idDuplicate = await checkDuplicateValue(idValue, idUrl, duId);

	const idCheckPattern = await checkIdPattern(idValue)

	const pwValue = join_pw.value;
	const pwCheckPattern = await checkPwPattern(pwValue)

	const emailValue = email.value;
	const emailCheckPattern = await checkEmailPattern(emailValue)

	const nickValue = nick.value;
	const nickUrl = "/nickCheck?nickname=" + nickValue;
	const nickDuplicate = await checkDuplicateValue(nickValue, nickUrl, duNick);
	console.log("idDuplicate :" + idDuplicate, idCheckPattern, pwCheckPattern, emailCheckPattern, nickDuplicate, (idDuplicate || idCheckPattern || pwCheckPattern || emailCheckPattern || nickDuplicate));
	sinup_btn.disabled = idDuplicate || idCheckPattern || pwCheckPattern || emailCheckPattern || nickDuplicate; // 중복 상태가 하나라도 발견되면 true
}

id.addEventListener('blur', handleBlur);
join_pw.addEventListener('blur', handleBlur);
email.addEventListener('blur', handleBlur);
nick.addEventListener('blur', handleBlur);





/*// id 빈칸으로 가입하기 눌렀을때 생긴 오류메세지 id칸 채우면 오류 사라지게
//const id = document.getElementById("join_id");
const errorId = document.querySelector(".errorId");

id.addEventListener("blur", function() {
	const id_value = id.value;
	if (id_value !== '') {
		errorId.style.display = "none";
	}
});*/


// 빈칸으로 가입하기 눌렀을때 생긴 오류메세지 id칸 채우면 오류 사라지게
const joinInput = Array.from(document.querySelectorAll(".joinform_item input"));
console.log("joinInput[0]", joinInput[0], joinInput.length);
/*console.log("nullError[0]", nullError[0], nullError.length);*/
joinInput.forEach((input, index) => {

	input.addEventListener("blur", function() {


		const name = input.name;
		const value = input.value;
		const nullError = document.querySelector(".nullError." + name)

		console.log("value : " + value, index, name);

		if (value !== '') {
			if (nullError) {
				nullError.style.display = "none";
			}
		}

	});
});



const ageSelect = document.getElementById('age');


ageSelect.addEventListener('blur', function() {
	const errorNull_age = document.querySelector('.errorNull.age');
	const value = this.value;
	if (value !== '-1') {
		if (errorNull_age) {

			errorNull_age.style.display = 'none';
		}
	}
});



// 아이디만 치고 가입시 에러뜨고 값 유지하기
//const sinup_btn = document.querySelector(".signup-button");
const nicknameError = document.querySelector('.nullError.Nickname');
const null_error = document.querySelector('.null.error');
const nick_error = document.querySelector('.nick.error');

sinup_btn.addEventListener('click', function() {
	// ajax
	var join_gender = document.querySelector('input[name="gender"]:checked');
	console.log("가입하기 눌렀다");
	/*	console.log(join_gender.value)*/
	const xhr = new XMLHttpRequest();

	let url = "/join?id=" + id.value + "&pw=" + join_pw.value + "&pw_ck=" + pw_ck.value + "&email=" + email.value + "&nickname=" + nick.value
		+ "&gender=" + join_gender.value + "&age=" + age.value;

	xhr.open("post", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		console.log(typeof (xhr.responseText));
		let result = JSON.parse(xhr.responseText);
		if (result.url) {
			/*		console.log(errors.errorNickname);*/
			let map = JSON.parse(xhr.responseText);


			let nickname = map.nickname;
			let url = map.url;

			// URL에 nickname 추가하여 이동
			let nextPgae = url + "?nickname=" + nickname;
			window.location.href = nextPgae;

		}
		else {
			let errors = JSON.parse(xhr.responseText);
			const keys = Object.keys(errors);
			console.log(keys);
			keys.sort();
			html = ""
			html2 = ""
			for (let i = 0; i < keys.length; i++) {
				let key = keys[i];
				let value = errors[key];
				console.log(i, key, value);
				if (key == "duNick") {
					duNick.style.display = 'block';
				}else if(key == "duId"){
					duId.style.display = 'block';
				}else if(key == "emMsg"){if((email.value) != ""){
					emError.style.display = 'block';
					formEmail.classList.add('b');
					isEmailValid = false;}}
				else {
					html += "<p class =\"" + key + "\">" + value + "</p>"
				}
				null_error.innerHTML = html;

			}


		}

		/*		a = [n,i]
				html = ""
				if(errors.errorNickname)
					html += "<p>"+errors.errorNickname+"</p>"
				if(errors.errorname)
					html += "<p>"+errors.errorname+"</p>"
					
				for */
		/*		nicknameError.textContent = errors.errorNickname;*/

	}
});


