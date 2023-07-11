/*var sidebar = $('#sb')
var closeimg = $('#closeimg')

// 동작 추가 예시
closeimg.click(function() {
	sidebar.css('left', '-3000');
	
});*/


var sidebar = document.getElementById('sb');
var closeimg = document.getElementById('closeimg');
var menuimg = document.getElementById('menuimg');

// 동작 추가 예시
closeimg.addEventListener('click', function() {
  sidebar.style.left = '-3000px';
});

menuimg.addEventListener('click', function() {
  sidebar.style.left = '0px';
});



const login_btn = document.querySelector('.login_btn button');


login_btn.addEventListener('click', function() {
	console.log("로그인 눌렀다");

	const login_id = document.querySelector('#login_id');
	const login_pw = document.querySelector('#login_pw');

	// ajax
	const xhr = new XMLHttpRequest();

	let url = "/login_check?id=" + login_id.value + "&pw=" +login_pw.value;

	xhr.open("post", url);

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let result = JSON.parse(xhr.responseText);
		
		
		}

});











