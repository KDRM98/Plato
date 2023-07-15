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


save_button.addEventListener('click', function() {
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

	/*	let pre_image = document.querySelector(".profile_content .circle").getAttribute("pre_date");
		let pre_email = document.querySelector(".profile_content #email").getAttribute("pre_date");
		let pre_nickname = document.querySelector(".profile_content #nickname").getAttribute("pre_date");
		let pre_gender = document.querySelector('.profile_content .box.gender').getAttribute("pre_date");
		let pre_age = document.querySelector(".profile_content #age").getAttribute("pre_date");
		 */

	predata();
	// url 수집
	let pre_url = "/myinfocomp?pre_image=" + pre_image +
		"&pre_nickname=" + pre_nickname +
		"&pre_email=" + pre_email +
		"&pre_gender=" + pre_gender +
		"&pre_age=" + pre_age + "&";

	let url = "/myinfocomp?pre_image=" + pre_image +
		"&pre_nickname=" + pre_nickname +
		"&pre_email=" + pre_email +
		"&pre_gender=" + pre_gender +
		"&pre_age=" + pre_age + "&";

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

	console.log(pre_url)
	console.log(url)

	if (pre_url == url) {
		console.log("수정된 정보가 없음");
		let pop_profilecomp = document.querySelector(".pop_profilecomp");
		pop_profilecomp.style.display = "block"
		let mdfd = document.querySelector(".pop_profilecomp .mdfd");
		html = "<div>수정할 정보를 변경해 주세요</div>"
		mdfd.innerHTML = html;
		return // send 막기!
	} else {
		url.slice(0, -1);
	};
	console.log(url)

	const xhr = new XMLHttpRequest();

	xhr.open("put", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let result = JSON.parse(xhr.responseText);

		/*		if (result.comp) {*/
		console.log("정보수정완료");

		let comp = result.comp;
		let pop_profilecomp = document.querySelector(".pop_profilecomp");
		pop_profilecomp.style.display = "block"
		let mdfd = document.querySelector(".pop_profilecomp .mdfd");
		html = "<div>" + comp + "</div>"
		mdfd.innerHTML = html;
	}
	/*		else {
				console.log("문제가 생겼다");
				let keys = Object.keys(result)
				let key = keys[0]
				let value = result[key]
				if (result.emailError) {
					console.log("이메일 형식 오류");
					emailMsg.style.display = value;
									rqdInfo_email.classList.add('b');
									emailValid = false;
				} else if (result.nickError) {
					console.log("닉네임 중복");
					duNick.style.display = value;
				}
				else if (result.insertMsg) {
					console.log("빈칸 있음");
					let profile2_error = document.querySelector(".profile2.error");
					html = "<div>"+ value +"</div>"
					profile2_error.innerHTML = html;
				}
				else {
					console.log("예상못한 오류");
					let pop_profilecomp = document.querySelector(".pop_profilecomp");
					pop_profilecomp.style.display = "block"
					let mdfd = document.querySelector(".pop_profilecomp .mdfd");
					html = "<div>고객센터에 문의해주세요</div>"
					mdfd.innerHTML = html;
				}
	
			}
	
	
		}*/

});


let pre_image, pre_email, pre_nickname, pre_gender, pre_age;

function predata() {

	pre_image = document.querySelector(".profile_content .circle").getAttribute("pre_date");
	pre_email = document.querySelector(".profile_content #email").getAttribute("pre_date");
	pre_nickname = document.querySelector(".profile_content #nickname").getAttribute("pre_date");
	pre_gender = document.querySelector('.profile_content .box.gender').getAttribute("pre_date");
	pre_age = document.querySelector(".profile_content #age").getAttribute("pre_date");

}



document.addEventListener('DOMContentLoaded', function() {
  // 파일 선택 버튼 클릭 시 파일 선택창 열기
  let up_btn = document.getElementById('up_btn');
  let fileInput = document.getElementById('fileInput');
  up_btn.addEventListener('click', function() {
    fileInput.click();
  });

  // 파일 선택 시 미리보기 이미지 업데이트
  fileInput.addEventListener('change', function() {
    var file = fileInput.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
      var pfImg = document.getElementById('pfImg');
      pfImg.src = e.target.result;
    };
    reader.readAsDataURL(file);
  });
});








