// 선택된 나이대 색이 검정색이 되도록
const age = document.querySelector("#age");
age.addEventListener('change', () => {
	age.style.color = 'black';
	age.value
});

//불러온 정보 기존과 다를 경우 블랙으로
const add_info_Input = Array.from(document.querySelectorAll(".add_info .form_item input"));
const add_infoClass = formItem_Input.map(input => input.parentNode);

add_info_Input.forEach((input, index) => {
	input.addEventListener('focus', () => {
		input.style.color = 'black';
	});
});

/*// 이메일형식이 아닐때 에러메세지 생성
let isEmailValid = true;
email.addEventListener("blur", function() {
	const emailInput = email.value;
	const emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	if (emailInput === '') {
		emError.style.display = "none"; // 필드가 비어있을 때는 에러 메시지를 표시하지 않기
		isEmailValid = true;
	} else if (emailRegex.test(emailInput)) {
		emError.style.display = 'none';
		isEmailValid = true;
	} else {
		emError.style.display = 'block';
		isEmailValid = false;
	}

});*/

// const save_button = document.querySelector(".save-button");


//이메일 형식 체크
const email = document.getElementById("email")
const emError = document.querySelector("#emailMsg")
let isEmailValid = true;
function checkEmailPattern(emailValue) {
	if (emailValue !== '') {
		return new Promise((resolve) => {
			console.log("이메일 패턴 블럭 들어왔당")
			const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			const isValid = pattern.test(emailValue);

			if (isValid) {
				emError.style.display = 'none';
				isEmailValid = true;
				resolve(false); // 유효한 아이디일 때 버튼 활성화
			} else {
				emError.style.display = 'block';
				isEmailValid = false;
				resolve(true)
			}
		});
	} else {
		// emailValue가 null인 경우 처리
		emError.style.display = "none"; // 필드가 비어있을 때는 에러 메시지를 표시하지 않기
		isEmailValid = true;
		return Promise.resolve(false);; // 유효한 아이디로 간주하여 버튼 활성화
	}
}

//중복확인(닉네임)
let exst_nick = document.querySelector(".profile_content #nickname").value;
function checkDuplicateValue(inputValue, url, duElement) {
	return new Promise((resolve) => {
		
let new_nickname = document.querySelector(".profile_content #nickname").value;
		const xhr = new XMLHttpRequest();
		xhr.open("get", url);
		xhr.send();

		xhr.onload = function() {
			console.log(xhr.responseText);if (exst_nickname !== new_nickname){
			if (xhr.responseText === '-1') { // 자신의 아이디면 중복된걸로 나옴 문제 해결요망
				duElement.style.display = 'block';
				resolve(true); // 중복 상태 발견
			} else {
				duElement.style.display = 'none';
				resolve(false); // 중복 상태 발견되지 않음
			}
		}else{
			duElement.style.display = 'none';
			resolve(false); // 중복 상태 발견되지 않음
		};
		}
	});
}

let nick = document.querySelector("#nickname")
let duNick = document.querySelector("#duNick")

async function handleBlur() {
	const emailValue = email.value;
	const emailCheckPattern = await checkEmailPattern(emailValue)

	const nickValue = nick.value;
	const nickUrl = "/nickCheck?nickname=" + nickValue;
	const nickDuplicate = await checkDuplicateValue(nickValue, nickUrl, duNick);
	save_button.disabled = emailCheckPattern || nickDuplicate; // 중복 상태가 하나라도 발견되면 true
}

email.addEventListener('blur', handleBlur);
nick.addEventListener('blur', handleBlur);



const save_button = document.querySelector(".save-button");

// 기존 값
//이미지가 로드된 후에 위의 코드를 실행하거나, 로드 이벤트를 감지하여 처리하는 방법

let imgClass = document.querySelector(".profile_content .circle");
let exst_image = imgClass.getAttribute("src");
let exst_email = document.querySelector(".profile_content #email").value;
let exst_nickname = document.querySelector(".profile_content #nickname").value;
let exst_gender = document.querySelector('input[name="gender"]:checked').value;
let exst_age = document.querySelector(".profile_content #age").value;




let pre_image, pre_email, pre_nickname, pre_gender, pre_age;

function predata() {

	pre_image = document.querySelector(".profile_content .circle").getAttribute("pre_date");
	pre_email = document.querySelector(".profile_content #email").getAttribute("pre_date");
	pre_nickname = document.querySelector(".profile_content #nickname").getAttribute("pre_date");
	pre_gender = document.querySelector('.profile_content .box.gender').getAttribute("pre_date");
	pre_age = document.querySelector(".profile_content #age").getAttribute("pre_date");

}





  





