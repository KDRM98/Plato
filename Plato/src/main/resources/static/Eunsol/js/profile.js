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


//취소하기 버튼 눌렀을 때 이전 페이지로 가도록 만듬
const cancle_button = document.querySelector(".cancle-button");

cancle_button.addEventListener('click', function() {

	const previousPageURL = document.referrer;
	console.log(previousPageURL);
	window.location.href = previousPageURL;
});
















