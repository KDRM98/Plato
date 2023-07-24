/*let at1 = document.querySelector(".at1")
let gesipan1 = document.querySelector(".gesipan1")
let at2 = document.querySelector(".at2")
let gesipan2 = document.querySelector(".gesipan2")
let tab_btn1 = document.querySelector(".tab_btn1")
let tab_btn2 = document.querySelector(".tab_btn2")*/


at2.addEventListener("click", fetchLikePostData(at2));





function fetchLikePostData(a) {
	const xhr = new XMLHttpRequest();

	let url = ""
	if (a.dataset.value) {
		url = "/likepost?pageNum=" + a.dataset.value;
	}
	else {
		url = "/likepost"
	}

	xhr.open("get", url);

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let result = JSON.parse(xhr.responseText);

		let gesipan2 = document.querySelector(".gesipan2");
		let html = "";
		html += '<div class="article2">';
		html += '    <div class="tit1">제목</div>';
		html += '    <div class="tit2">작성자</div>';
		html += '    <div class="tit3">작성일</div>';
		html += '    <div class="tit4">조회수</div>';
		html += '</div>';
		if (result.total != 0) {
			for (let i = 0; i < result.likePost.length; i++) {
				let item = result.likePost[i];

				html += '<div class="gsp_content2">';
				html += '    <div class="tem a1">';
				html += '        <input type="checkbox" class="chk">';
				html += '    </div>';
				html += '    <div class="tem a2">' + item.postid + '</div>';
				html += '    <div class="tem a3">';
				html += '        <a href="/recipe?postid=' + item.postid + '">' + item.title + '</a>';
				html += '    </div>';
				html += '    <div class="tem a4">' + item.nickname + '</div>';
				html += '    <div class="tem a5">' + item.cdate + '</div>';
				html += '    <div class="tem a6">' + item.views + '</div>';
				html += '</div>';
			}

			html += '<div class="paging">';
			if (result.begin > 1) {
				html += ' <div class="p_btn"' + '" data-value="' + (result.begin - 1) + '"><div><</div></a>';
			}
			for (let i = result.begin; i < result.end; i++) {
				html += '  <div class="p_btn"' + '" data-value="' + i + '">';
				if (result.pageNum === i) {
					html += '<strong>' + i + '</strong></div>';
				} else {
					html += i + '</div>';

				}
			}
			if (result.end < result.lastPage) {
				html += '            <div class="p_btn"' + '" data-value="' + (result.end + 1) + '"> <div>> </div></a>';
			}
			html += '        </div>';
			html += '        <div class="tab3">';
			html += '            <div class="tab_chk">';
			html += '                <input type="checkbox" class="all_chk"> 전체선택';
			html += '            </div>';
			html += '            <div class="tab_btn2">';
			html += '                <button class="tab_cnlike">좋아요 취소</button>';
			html += '            </div>';
			html += '        </div>';
			html += '    </div>';
		} else {
			html += '<div style="margin: 10px auto 20px auto; color: red; text-align: center;">등록된 내용이 없습니다.</div>';
		}

		gesipan2.innerHTML = html;
		let p_btns = document.querySelectorAll(".p_btn");

		p_btns.forEach(function(p_btn) {
			p_btn.addEventListener('click', function() {
				// 클릭 시 fetchLikePostData 함수를 호출하도록 콜백 형태로 전달
				fetchLikePostData(p_btn);
			});

		});


	};
}






