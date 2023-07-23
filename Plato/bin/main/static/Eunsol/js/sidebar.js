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



let search_bar2 = document.querySelector('.popup-overlay2 .search-bar2')
let text_song2 = document.querySelector('.text_song2')

search_bar2.addEventListener('keydown', function(event) {
	console.log(event.keyCode === 13)
  if (event.keyCode === 13) {
    event.preventDefault(); // 기본 엔터 동작 방지
	text_song2.submit();
  }
});


        function openPopup() {
            document.getElementById('popupOverlay2').style.display = 'flex';
        }

        function closePopup() {
            document.getElementById('popupOverlay2').style.display = 'none';
        }







