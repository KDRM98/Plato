
const formItem_Input = Array.from(document.querySelectorAll(".form_item input"));
const formItemsClass = formItemInput.map(input => input.parentNode);

formItem_Input.forEach((input, index) => {
	input.addEventListener('focus', () => {
		formItemsClass[index].classList.add('a');
	});

formItem_Input.addEventListener('blur', () => {
		if (input.value === '') {
			formItemsClass[index].classList.remove('a');
		}
	});
});
