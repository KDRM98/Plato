
const overlay = document.querySelector(".overlay");
const popup = document.querySelector(".popup");
const confirmBtn = document.getElementById("confirm-btn");
const cancleBtn = document.getElementById("cancle-btn");
const checkbox = document.getElementById('agree');
const unregisterButton = document.getElementById('unregister-button');



//회원탈퇴 동의 라디오 눌러야 회원탈퇴 버튼 활성화 되도록
checkbox.addEventListener('change', function() {
  if (checkbox.checked) {
	console.log("체크 눌렀다")
	unregisterButton.style.opacity = 1;
    unregisterButton.style.pointerEvents = 'auto'; // 체크박스가 선택되면 버튼 활성화
  } else {
	unregisterButton.style.opacity = 0.5;
    unregisterButton.style.pointerEvents = 'none'; // 체크박스가 선택되지 않으면 버튼 비활성화
  }
});

unregisterButton.addEventListener("click", function(event) {
		event.preventDefault();
		console.log("탈퇴버튼 눌렀다")
		overlay.style.display = "block";
		popup.style.display = "block";
	
});


//회원탈퇴 최종 확인시 메인페이지로 돌아가도록
confirmBtn.addEventListener("click", function() {
	// 탈퇴 처리 로직 추가
	alert("탈퇴되었습니다.");
	overlay.style.display = "none";
	popup.style.display = "none";
	window.location.href = "https://www.naver.com"; // 메인페이지 주소 넣기
});

//회원탈퇴 최종 취소시 원 페이지로 돌아가도록
cancleBtn.addEventListener("click", function() {
	overlay.style.display = "none";
	popup.style.display = "none";
});