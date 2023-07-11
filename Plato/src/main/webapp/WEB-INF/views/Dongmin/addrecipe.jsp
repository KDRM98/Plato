<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="Dongmin/css/addrecipe.css">
<body>
	<form action="/recipes" method="POST" enctype="multipart/form-data">
		<div class="recContainer">
			<div class="registContainer">
				<div class="regist" id="title">		
					<label for="title">제목 : </label>
					<input type="text" id="title" name="title" required>
				</div>
				<div class="regist" id = "writer">
					<label for="author">작성자: </label>
					<input type="text" id="author" name="author" required>
				</div>
				
				<div class="regist" id="difficulty">
					<label for="image">난이도 : </label><span class="difficultynum"> 0 </span>
					<div id="difficulty-container">
					    <button class="difficulty-button" onclick="selectDifficulty(1)"><span class="button-number"></span></button>
					    <button class="difficulty-button" onclick="selectDifficulty(2)"><span class="button-number"></span></button>
					    <button class="difficulty-button" onclick="selectDifficulty(3)"><span class="button-number"></span></button>
					    <button class="difficulty-button" onclick="selectDifficulty(4)"><span class="button-number"></span></button>
					    <button class="difficulty-button" onclick="selectDifficulty(5)"><span class="button-number"></span></button>
					</div>
				</div>
				
				<div class="regist" id="spenttime">
					<label for="image">소요시간</label>
					<select name="settime">
					  <option value="">-- 시간 선택 --</option>
					  <option value="10">10분</option>
					  <option value="20">20분</option>
					  <option value="30">30분</option>
					  <option value="40">40분</option>
					  <option value="50">50분</option>
					  <option value="60">1시간</option>
					  <option value="70">1시간 10분</option>
					  <option value="80">1시간 20분</option>
					  <option value="90">1시간 30분</option>
					  <option value="100">1시간 40분</option>
					  <option value="110">1시간 50분</option>
					  <option value="120">2시간</option>
					</select>
				</div>
				
				<div class="regist" id="mainimg">
					<label for="image">대표 사진 </label>
					<input type="file" id="image" name="image" accept="image/*">
				</div>
				
				<div class="regist" id="desc">
					<label for="description">소개글:</label><br>
					<textarea id="description" name="description" required></textarea>
				</div>
				
				<div class="regist" id="addigr">
					<label for="ingredients">재료:</label><br>
					<textarea id="ingredients" name="ingredients" required></textarea>
				</div>
				
				<div class="regist" id="how">
				  <label for="instructions">조리방법:</label><br>
				  <div id="instructions-container">
				    <div class="step">
				      <textarea name="instructions[]" required></textarea>
				      <div class="image-preview"></div>
				      <input type="file" name="images[]" accept="image/*" onchange="previewImage(event)">
				    </div>
				  </div>
				  <button type="button" onclick="addStep()">추가</button>
				</div>


			  	
				<button type="submit">작성 완료</button>
			</div>
			
		</div>
		
	</form>
		
	
</body>
<script>
	var difficultynum = document.querySelector(".difficultynum");
	function selectDifficulty(level) {
	  var buttons = document.getElementsByClassName('difficulty-button');
	  
	  // 선택된 버튼 이외의 버튼들의 스타일 초기화
	    for (var i = 0; i < buttons.length; i++) {
	    	buttons[i].style.background = "white";
	    }
	  
	  // 선택된 버튼까지 스타일 적용 및 숫자 업데이트
	  for (var i = 0; i < level; i++) {
	    buttons[i].style.background = "black";
	  }
	  
	  // 선택된 난이도에 대한 추가 로직 수행
	  if (level === 1) {
		  showMessage("1");
	  } else if (level === 2) {
		  showMessage("2");
	  } else if (level === 3) {
		  showMessage("3");
	  } else if (level === 4) {
		  showMessage("4");
	  } else if (level === 5) {
		  showMessage("5");
	  }
	}
	
	function showMessage(message) {
		difficultynum.textContent = message;
	}
	
	var stepCount = 1;

	function addStep() {
	  var instructionsContainer = document.getElementById('instructions-container');
	  
	  var stepDiv = document.createElement('div');
	  stepDiv.className = 'step';
	  
	  var textarea = document.createElement('textarea');
	  textarea.name = 'instructions[]';
	  textarea.required = true;
	  
	  var imagePreview = document.createElement('div');
	  imagePreview.className = 'image-preview';
	  
	  var fileInput = document.createElement('input');
	  fileInput.type = 'file';
	  fileInput.name = 'images[]';
	  fileInput.accept = 'image/*';
	  fileInput.onchange = previewImage;
	  
	  stepDiv.appendChild(textarea);
	  stepDiv.appendChild(imagePreview);
	  stepDiv.appendChild(fileInput);
	  
	  instructionsContainer.appendChild(stepDiv);
	  
	  stepCount++;
	}

	function previewImage(event) {
	  var file = event.target.files[0];
	  var imagePreview = event.target.parentNode.querySelector('.image-preview');
	  
	  if (file) {
	    var reader = new FileReader();
	    
	    reader.onload = function() {
	      var image = document.createElement('img');
	      image.src = reader.result;
	      imagePreview.innerHTML = '';
	      imagePreview.appendChild(image);
	    }
	    
	    reader.readAsDataURL(file);
	  } else {
	    imagePreview.innerHTML = '';
	  }
	}



</script>
</html>