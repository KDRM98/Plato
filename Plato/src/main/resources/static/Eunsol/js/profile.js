const formItem_Input = Array.from(document.querySelectorAll(".form_item input"));
const formItemsClass = formItem_Input.map(input => input.parentNode);

formItem_Input.forEach((input, index) => {
	input.addEventListener('focus', () => {
		formItemsClass[index].classList.add('a');
	});

	input.addEventListener('blur', () => {
		if (input.value === '') {
			formItemsClass[index].classList.remove('a');
		}
	});
});


// 선택된 나이대 색이 검정색이 되도록
const age = document.querySelector("#age");
age.addEventListener('change', () => {
	age.style.color = 'black';
	age.value
});


const add_info_Input = Array.from(document.querySelectorAll(".add_info .form_item input"));
const add_infoClass = formItem_Input.map(input => input.parentNode);

add_info_Input.forEach((input, index) => {
	input.addEventListener('focus', () => {
		input.style.color = 'black';
	});
});




const save_button = document.querySelector(".save-button");

// 기존 값
//이미지가 로드된 후에 위의 코드를 실행하거나, 로드 이벤트를 감지하여 처리하는 방법

let imgClass = document.querySelector(".profile_content .circle");
let exst_image = imgClass.getAttribute("src");
let exst_email = document.querySelector(".profile_content #email").value;
let exst_nickname = document.querySelector(".profile_content #nickname").value;
let exst_gender = document.querySelector('input[name="gender"]:checked').value;
let exst_age = document.querySelector(".profile_content #age").value;



find_button.addEventListener('click', function() {
	// ajax
	console.log("정보변경하기 눌렀다");
	/*	console.log(join_gender.value)*/

	// 새로운 값
	let imgClass = document.querySelector(".profile_content .circle");
	let new_image = imgClass.getAttribute("src");
	let new_email = document.querySelector(".profile_content #email").value;
	let new_nickname = document.querySelector(".profile_content #nickname").value;
	let new_gender = document.querySelector('input[name="gender"]:checked').value;
	let new_age = document.querySelector(".profile_content #age").value;


	// url 수집
	let url = "/myinfocomp?";

	if (exst_image !== new_image) {
		url += "image=" + new_image + "&";
	}

	if (exst_email !== new_email) {
		url += "email=" + new_email + "&";
	}

	if (exst_nickname !== new_nickname) {
		url += "nickname=" + new_nickname + "&";
	}

	if (exst_gender !== new_gender) {
		url += "gender=" + new_gender + "&";
	}

	if (exst_age != new_age) {
		url += "age=" + new_age + "&";
	}

	if (url.length > 12) {
		url.slice(0, -1);
	} else {
		console.log("수정된 정보가 없음");
		let profile2_error = document.querySelector(".profile2.error");
		html = "<div>수정된 정보가 없습니다.</div>"
		profile2_error.innerHTML = html;
	};

	const xhr = new XMLHttpRequest();

	xhr.open("post", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let result = JSON.parse(xhr.responseText);

		if (result.url) {
			console.log("정보일치");

			let id = result.id;
			let url = result.url;

			// URL에 nickname 추가하여 이동
			let nextPgae = url + "?id=" + id;
			window.location.href = nextPgae;
		}
		else {
			console.log("문제가 생겼다");
			let keys = Object.keys(result)
			let key = keys[0]
			let value = result[key]
			if (result.emailError) {
				console.log("이메일 형식 오류");
				emlfr.style.display = value;
				rqdInfo_email.classList.add('b');
				emailValid = false;
			} else if (result.nullError) {
				console.log("정보 불일치");
				let findId2_error = document.querySelector(".findId2.error");
				html = "<p class =\"" + key + "\">" + value + "</p>"
				findId2_error.innerHTML = html;
			}
			else if (result.insertMsg) {
				console.log("입력된정보 없음");
				let findId1_error = document.querySelector(".findId1.error");
				html = "<p class =\"" + key + "\">" + value + "</p>"
				findId1_error.innerHTML = html;
			}
			else {
				console.log("예상못한 오류");
				let findId2_error = document.querySelector(".findId1.error");
				html = "<p>고객센터에 문의해주세요!</p>"
				findId2_error.innerHTML = html;
			}

		}


	}

});


//별명 중복확인 만들어야 함
// 아이디 보이는 칸 어떻게 보일지 생각해야함























