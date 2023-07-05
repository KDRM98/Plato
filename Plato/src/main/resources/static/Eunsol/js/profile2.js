const formItemInput = Array.from(document.querySelectorAll(".form_item input"));
const formItems = formItemInput.map(input => input.parentNode);

//커서가 생기면 앞에 이미지가 바뀌는
formItemInput.forEach((input, index) => {
  input.addEventListener('focus', () => {
    formItems[index].classList.add('a');
  });
  
  input.addEventListener('blur', () => {
    formItems[index].classList.remove('a');
  });
});