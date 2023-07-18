document.addEventListener('DOMContentLoaded', function() {
	// 파일 선택 버튼 클릭 시 파일 선택창 열기
	let up_btn = document.getElementById('up_btn');
	let fileInput = document.getElementById('fileinput');
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


const pemailnull = document.querySelector("#pemailnull")
const pniknull = document.querySelector("#pniknull")

save_button.addEventListener('click', function() {
	// ajax
	console.log("정보변경하기 눌렀다");
	/*	console.log(join_gender.value)*/

	/*ㄴ	let new_email = document.querySelector(".profile_content #email").value;
		let new_nickname = document.querySelector(".profile_content #nickname").value;
		let new_gender = document.querySelector('input[name="gender"]:checked').value;
		let new_age = document.querySelector(".profile_content #age").value;
		*/
	// 파일 업로드를 위한 데이터 준비
	let f = document.querySelector("#form");
	let f1 = new FormData(f);

	let url = "/myinfocomp2"
	// Ajax 요청 보내기
	let xhr = new XMLHttpRequest();

	xhr.open('POST', url, true);
	xhr.send(f1);

	xhr.onload = function() {
		console.log(xhr.status);
		let result = JSON.parse(xhr.responseText);
		if (result.errNick || result.errEmail) {
			if (result.errNick) { pniknull.style.display = "block"; };
			if (result.errEmail) { pemailnull.style.display = "block"; };

		} else if (xhr.status == 200) {
			console.log(xhr.responseText);

			/*		if (result.comp) {*/
			console.log("정보수정완료");
			console.log(xhr.status);

			let comp = result.comp;
			let pop_profilecomp = document.querySelector(".pop_profilecomp");
			pop_profilecomp.style.display = "block"
			let mdfd = document.querySelector(".pop_profilecomp .mdfd");
			html = "<div>" + comp + "</div>"
			mdfd.innerHTML = html;
		}


		else {

			let pop_profilecomp = document.querySelector(".pop_profilecomp");
			pop_profilecomp.style.display = "block"
			let mdfd = document.querySelector(".pop_profilecomp .mdfd");
			html = "<div> 고객센터에 문의하세요. </div>"
			mdfd.innerHTML = html;

		}

	}


});