const withdrawBtn = document.querySelector(".unregister-button");
const overlay = document.querySelector(".overlay");
const popup = document.querySelector(".popup");
const confirmBtn = document.getElementById("confirm-btn");
const cancleBtn = document.getElementById("cancle-btn");
var agreeCheckbox = document.querySelector('.agreement input[type="radio"]');


var clickCount = 0;

agreeCheckbox.addEventListener("click", function () {
    clickCount++;

    if (clickCount % 2 === 0) {
        this.checked = false;
    } 
});


withdrawBtn.addEventListener("click", function () {
    if (agreeCheckbox.checked) {
        overlay.style.display = "block";
        popup.style.display = "block";
    }
});

confirmBtn.addEventListener("click", function () {
    // 탈퇴 처리 로직 추가
    alert("탈퇴되었습니다.");
    overlay.style.display = "none";
    popup.style.display = "none";
    window.location.href = "https://www.naver.com"; // 메인페이지 주소 넣기
});

cancleBtn.addEventListener("click", function () {
    overlay.style.display = "none";
    popup.style.display = "none";
});