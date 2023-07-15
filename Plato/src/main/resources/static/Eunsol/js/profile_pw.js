// 비밀번호 일치하지 않을 때 에러메세지 & 변경버튼 막기
// blur : HTML 요소에서 포커스가 빠져나가면 발생하는 이벤트
const pw = document.getElementById("pw");
const newPw = document.getElementById("newPw");
const newPw_ck = document.getElementById("newPw_ck");
const pwError = document.querySelector("#pwMsg")



const pwRstr = document.getElementById('pwRstr');

let isPasswordValid = true; // 패스워드의 유효성 여부를 저장하는 변수
function matchNewPw(password, pwck_value) {

	return new Promise((resolve) => {


		if (pwck_value === '') {
			pwError.style.display = "none";
			newPw_ck.parentNode.classList.remove('b')
			resolve(false);
			isPasswordValid = true;
		} else if (password === pwck_value) {
			pwError.style.display = 'none';
			newPw_ck.parentNode.classList.remove('b')
			resolve(false);
			isPasswordValid = true;
		} else {
			pwError.style.display = 'block';
			/*newPw_ck.classList.remove('a')*/
			newPw_ck.parentNode.classList.add('b')
			resolve(true);
			isPasswordValid = false;
		}
	});
}


function checkPwPattern(password) {
	if (password !== '') {
		return new Promise((resolve) => {

			const hasLowercase = /[a-z]/.test(password);
			const hasNumber = /[0-9]/.test(password);
			const hasSpecialChar = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/.test(password);
			/*const isValidLength = pwValue.length >= 5 && pwValue.length <= 16;*/

			const result = hasLowercase && hasNumber && hasSpecialChar /*&& isValidLength*/;
			if (result) {
				pwRstr.style.display = 'none';
				newPw_ck.parentNode.classList.remove('b')
				resolve(false); 
			} else {
				pwRstr.style.display = 'block';
				newPw.parentNode.classList.add('b')
				resolve(true)
			}
		});
	} else {
		// idValue가 null인 경우 처리
		pwRstr.style.display = 'none'
		newPw_ck.parentNode.classList.remove('b')
		return Promise.resolve(false);; // 유효한 아이디로 간주하여 버튼 활성화
	}
}

async function pwBlur() {
	const password = newPw.value;
	const pwCheckPattern = await checkPwPattern(password)

	const pwck_value = newPw_ck.value;
	const newPwMatch = await matchNewPw(password, pwck_value)

	pwSave_button.disabled = pwCheckPattern || newPwMatch
}


newPw.addEventListener('blur', pwBlur);
newPw_ck.addEventListener('blur', pwBlur);

newPw.addEventListener('blur', () => {
		if (newPw.value === '') {
			newPw.parentNode.classList.remove('b');
		}
	});


const nullPw = document.querySelector("#nullPw")
const nullNewPw = document.querySelector("#nullNewPw")
const nullNewck = document.querySelector("#nullNewPw_ck")

function pwNullError() {
	if (newPw.value.trim().length !== 0) {
		nullNewPw.style.display = 'none';
	}
	if (newPw_ck.value.trim().length !== 0) {
		nullNewck.style.display = 'none';
	}
	if (pw.value.trim().length !== 0) {
		nullPw.style.display = 'none';
	}

}

pw.addEventListener('blur', pwNullError);
newPw.addEventListener('blur', pwNullError);
newPw_ck.addEventListener('blur', pwNullError);









const pwSave_button = document.querySelector(".pwSave-button")

pwSave_button.addEventListener('click', function() {

	console.log("비밀번호변경하기 눌렀다");

	// 빈칸에러 발생
	if (newPw.value.trim().length === 0
		|| newPw_ck.value.trim().length === 0
		|| pw.value.trim().length === 0) {

		if (newPw.value.trim().length === 0) {
			nullNewPw.style.display = 'block';
		}
		if (newPw_ck.value.trim().length === 0) {
			nullNewck_ck.style.display = 'block';
		}
		if (pw.value.trim().length === 0) {
			nullPw.style.display = 'block';
		}

		return
	}

		console.log(pw.value + newPw.value );
	// ajax
	let url = "/pwmdcomp?pre_pw=" + pw.value
		+ "&pw=" + newPw.value

	const xhr = new XMLHttpRequest();

	xhr.open("put", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let result = JSON.parse(xhr.responseText);

		function pop(value) {
			let comp = result.comp;
			let pop_profilecomp = document.querySelector(".pop_profilecomp");
			pop_profilecomp.style.display = "block"
			let mdfd = document.querySelector(".pop_profilecomp .mdfd");
			html = "<div>" + value + "</div>"
			mdfd.innerHTML = html
		};

		if (result.comp) {
			console.log("비밀번호 수정 완료");

			let value = result.comp;
			pop(value);

		} else if (result.errPwF) {
			console.log("비밀번호 형식 안맞음");
			pwRstr.style.display = 'block'
		}
		else if (result.errPrePw) {
			console.log("기존 비빌번호 불일치");
			let value = result.errPrePw;
			pop(value);
		}
		else {
			console.log("알수없는 오류 발생");
			pop("고객센터에 문의하세요.")
		}
	}
});

