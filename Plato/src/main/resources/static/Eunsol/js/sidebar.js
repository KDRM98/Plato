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














