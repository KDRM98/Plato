let search_bar = document.querySelector('.popup-overlay .search-bar')
let text_song = document.querySelector('.text_song')

search_bar.addEventListener('keydown', function(event) {
	console.log(event.keyCode === 13)
  if (event.keyCode === 13) {
    event.preventDefault(); // 기본 엔터 동작 방지
	text_song.submit();
  }
});




let big_box = document.querySelector('.main_content .big-box')
let box_one = document.querySelector('.main_content .box.one')
let box_two = document.querySelector('.main_content .box.two ')

big_box.addEventListener('click', function() {
	const url = "/recipe?postid="
	const url2 = big_box.dataset.value;
	window.location.href = url + url2;
	
});


box_one.addEventListener('click', function() {
	const url = "/recipe?postid="
	const url2 = box_one.dataset.value;
	window.location.href = url + url2;
	
});


box_two.addEventListener('click', function() {
	const url = "/recipe?postid="
	const url2 = box_two.dataset.value;
	window.location.href = url + url2;
	
});