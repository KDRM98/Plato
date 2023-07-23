let at1 = document.querySelector(".at1")
let gesipan1 = document.querySelector(".gesipan1")
let at2 = document.querySelector(".at2")
let gesipan2 = document.querySelector(".gesipan2")
let tab_btn1 = document.querySelector(".tab_btn1")
let tab_btn2 = document.querySelector(".tab_btn2")


at2.addEventListener("click", function() {
	console.log("좋아요한 글 눌렀다");

	const xhr = new XMLHttpRequest();

	let url = "/likepost"

	xhr.open("get", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		let gesipan2 = document.querySelector(".gesipan2")
		html = ""
		html += '		<c:if test="${!empty likePost}">';
		html += '			<div class="article2">';
		html += '				<div class="tit1">제목</div>';
		html += '				<div class="tit2">작성자</div>';
		html += '				<div class="tit3">작성일</div>';
		html += '				<div class="tit4">조회수</div>';
		html += '			</div>';
		html += '			<c:forEach var="item" items="${likePost}">';
		html += '				<div class="gsp_content2">';
		html += '					<div class="tem a1">';
		html += '						<input type="checkbox" class="chk">';
		html += '					</div>';
		html += '					<div class="tem a2">' + item.postid + '</div>';
		html += '					<div class="tem a3">';
		html += '						<a href="#}">' + item.title + '</a>';
		html += '					</div>';
		html += '					<div class="tem a4">' + item.cdate + '</div>';
		html += '					<div class="tem a5">' + item.cdate + '</div>';
		html += '					<div class="tem a6">' + item.views + '</div>';
		html += '				</div>';
		html += '			</c:forEach>';
		html += '		</c:if>';
		html += '		<c:if test="${empty likePost}">';
		html += '			<div style="margin: 10px auto 20px auto; color: red; text-align: center;">등록된 내용이 없습니다.</div>';
		html += '		</c:if>';
		html += '		<%';
		html += '			var total = <%= request.getAttribute("total") %>;';
		html += '			var countPerpage = <%= request.getAttribute("countPerpage") %>;';
		html += '			var lastPage = Math.ceil(total / countPerpage);';
		html += '			var groupCount = 3;';
		html += '			var pageNum = <%= request.getAttribute("pageNum") %>;';
		html += '			var group = Math.floor(((pageNum - 1) / groupCount) + 1);';
		html += '			var end = group * groupCount;';
		html += '			if (end > lastPage) {';
		html += '				end = lastPage;';
		html += '			}';
		html += '			var begin = end - (groupCount - 1);';
		html += '			if (begin < 1) {';
		html += '				begin = 1;';
		html += '				end = groupCount;';
		html += '			}';
		html += '		%>';
		html += '		<div class="paging">';
		html += '			<%';
		html += '				if (begin > 1) {';
		html += '			%>';
		html += '			<a href="/mypage?pageNum=' + (begin - 1) + '"><div><</div></a>';
		html += '			<%';
		html += '				}';
		html += '			%>';
		html += '			<%';
		html += '				for (var i = begin; i <= end; i++) {';
		html += '			%>';
		html += '			<a href="/mypage?pageNum=' + i + '">';
		html += '				<c:set var="i" value="' + i + '" scope="page" />';
		html += '				<c:if test="${pageNum eq i}">';
		html += '					<div><strong>' + i + '</strong></div>';
		html += '				</c:if>';
		html += '				<c:if test="${pageNum ne i}">';
		html += '					<div>' + i + '</div>';
		html += '				</c:if>';
		html += '			</a>';
		html += '			<%';
		html += '				}';
		html += '			%>';
		html += '			<%';
		html += '				if (end != lastPage) {';
		html += '			%>';
		html += '			<a href="/mypage?pageNum=' + (end + 1) + '"><div>></div></a>';
		html += '			<%';
		html += '				}';
		html += '			%>';
		html += '		</div>';
		html += '		<div class="tab3">';
		html += '			<div class="tab_chk">';
		html += '				<input type="checkbox" class="all_chk"> 전체선택';
		html += '			</div>';
		html += '			<div class="tab_btn2">';
		html += '				<button class="tab_cnlike">좋아요 취소</button>';
		html += '			</div>';
		html += '		</div>';
		html += '	</div>';

		gesipan2.innerHTML = html;	

	}
});





sinup_btn.addEventListener('click', function() {
	// ajax
	var join_gender = document.querySelector('input[name="gender"]:checked');
	console.log("가입하기 눌렀다");
	/*	console.log(join_gender.value)*/
	const xhr = new XMLHttpRequest();

	let url = "/join?id=" + id.value + "&pw=" + join_pw.value + "&pw_ck=" + pw_ck.value + "&email=" + email.value + "&nickname=" + nick.value
		+ "&gender=" + join_gender.value + "&age=" + age.value;

	xhr.open("post", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		console.log(typeof (xhr.responseText));
		let result = JSON.parse(xhr.responseText);
		if (result.url) {
			/*		console.log(errors.errorNickname);*/
			let map = JSON.parse(xhr.responseText);


			let nickname = map.nickname;
			let url = map.url;

			// URL에 nickname 추가하여 이동
			let nextPgae = url + "?nickname=" + nickname;
			window.location.href = nextPgae;

		}
		else {
			let errors = JSON.parse(xhr.responseText);
			const keys = Object.keys(errors);
			console.log(keys);
			keys.sort();
			html = ""
			html2 = ""
			for (let i = 0; i < keys.length; i++) {
				let key = keys[i];
				let value = errors[key];
				console.log(i, key, value);
				if (key == "duNick") {
					duNick.style.display = 'block';
				} else if (key == "duId") {
					duId.style.display = 'block';
				} else if (key == "emMsg") {
					if ((email.value) != "") {
						emError.style.display = 'block';
						formEmail.classList.add('b');
						isEmailValid = false;
					}
				}
				else {
					html += "<p class =\"" + key + "\">" + value + "</p>"
				}
				null_error.innerHTML = html;

			}


		}
	}
});






