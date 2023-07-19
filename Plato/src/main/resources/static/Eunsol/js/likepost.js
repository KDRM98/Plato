/*let at1 = document.querySelector(".at1")
let gesipan1 = document.querySelector(".gesipan1")
let at2 = document.querySelector(".at2")
let gesipan2 = document.querySelector(".gesipan2")
let tab_btn1 = document.querySelector(".tab_btn1")
let tab_btn2 = document.querySelector(".tab_btn2")*/


at2.addEventListener("click",function(){
	console.log("좋아요한 글 눌렀다");

	const xhr = new XMLHttpRequest();
	
	let url ="/likepost"
	
	xhr.open("get", url); //select는 get으로 보이게 update는 put로 post는 insert 안보이게

	xhr.send();

	xhr.onload = function() {
		console.log(xhr.responseText);
		
		
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
				}else if(key == "duId"){
					duId.style.display = 'block';
				}else if(key == "emMsg"){if((email.value) != ""){
					emError.style.display = 'block';
					formEmail.classList.add('b');
					isEmailValid = false;}}
				else {
					html += "<p class =\"" + key + "\">" + value + "</p>"
				}
				null_error.innerHTML = html;

			}


		}
	}
});






