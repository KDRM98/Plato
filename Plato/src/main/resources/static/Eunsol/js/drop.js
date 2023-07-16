const overlay = document.querySelector(".overlay");
const drop_popup = document.querySelector(".popup");
const confirmBtn = document.getElementById("confirm-btn");
const cancleBtn = document.getElementById("cancle-btn");
const checkbox = document.getElementById('agree');
const unregisterButton = document.getElementById('unregister-button');

const delForm_pw = document.querySelector(".delForm_pw");
const delInput_pw = document.querySelector(".delForm_pw input");



//회원탈퇴 동의 라디오 눌러야 회원탈퇴 버튼 활성화 되도록
checkbox.addEventListener('change', function() {

	if (checkbox.checked) {
		console.log("체크 눌렀다")

		delForm_pw.style.display = 'block';
		delForm_pw.style.display = 'flex';
	} else {

		delForm_pw.style.display = 'none';
	}
});
delInput_pw.addEventListener('blur', function() {
	if (delInput_pw.value.trim().length === 0) {
		unregisterButton.style.opacity = 0.5;
		unregisterButton.style.pointerEvents = 'none'; // 체크박스가 선택되면 버튼 활성화
	} else {
		unregisterButton.style.opacity = 1;
		unregisterButton.style.pointerEvents = 'auto'; // 체크박스가 선택되지 않으면 버튼 비활성화
	}

});


unregisterButton.addEventListener("click", function(event) {
	event.preventDefault();
	console.log("탈퇴버튼 눌렀다")
	overlay.style.display = "block";
	drop_popup.style.display = "block";

});


/*//회원탈퇴 최종 확인시 메인페이지로 돌아가도록
confirmBtn.addEventListener("click", function() {
	// 탈퇴 처리 로직 추가
	alert("탈퇴되었습니다.");
	overlay.style.display = "none";
	drop_popup.style.display = "none";
	window.location.href = "https://www.naver.com"; // 메인페이지 주소 넣기
});

//회원탈퇴 최종 취소시 원 페이지로 돌아가도록
cancleBtn.addEventListener("click", function() {
	overlay.style.display = "none";
	drop_popup.style.display = "none";
});
*/

let cnf_btn = document.querySelector("#confirm-btn");
let del_nullpw = document.querySelector(".del_nullpw");




cnf_btn.addEventListener('click', function() {
	// ajax
	console.log("탈퇴확인 버튼 눌렀다");

	if (delInput_pw.value.trim().length === 0) {
		del_nullpw.style.display = 'block';
		overlay.style.display = "none";
		drop_popup.style.display = "none";
		return
	}


	const xhr = new XMLHttpRequest();

	let url = "/dltmember?pw=" + delInput_pw.value

	xhr.open("post", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	console.log("AJAX실행");

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let result = JSON.parse(xhr.responseText);
		drop_popup.style.display = "none";
		if (result.bye) {
			console.log("탈퇴완료");
			alert("탈퇴되었습니다.")

			let url = result.url;
			let nextPgae = url

			window.location.href = nextPgae;

		}

		else {

			let pop_error = document.querySelector(".pop_error");
			pop_error.style.display = "block"

			let popdel = document.querySelector(".pop_error .popdel");

			if (result.delError) {
				console.log("회원정보 삭제 에러");

				let value = result.delError;


				html = "<div>" + value + "</div>"
				popdel.innerHTML = html;

			} else if (result.errPw) {
				console.log("비밀번호 불일치");
				let value = result.errPw;
				html = "<div>" + value + "</div>"



			} else {
				console.log("예상치 못한 문제 발생");

				html = "<div>고객센터에 문의하세요</div>"

			}
			popdel.innerHTML = html;
		}
	}

});





