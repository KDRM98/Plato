<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>
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
				<div class="regist" id="writer">
					<label for="author">작성자: </label>
					<input type="text" id="author" name="author" required>
				</div>
				
				<div class="regist" id="difficulty">
					<label for="image">난이도 : </label><span class="difficultynum" name="difficulty"> 0 </span>
					<div id="difficulty-container">
					    <button type="button" class="difficulty-button" onclick="selectDifficulty(1)"><span class="button-number"></span></button>
					    <button type="button" class="difficulty-button" onclick="selectDifficulty(2)"><span class="button-number"></span></button>
					    <button type="button" class="difficulty-button" onclick="selectDifficulty(3)"><span class="button-number"></span></button>
					    <button type="button" class="difficulty-button" onclick="selectDifficulty(4)"><span class="button-number"></span></button>
					    <button type="button" class="difficulty-button" onclick="selectDifficulty(5)"><span class="button-number"></span></button>
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
				
				<div class="regist" name="mainimg">
					<label for="image">대표 사진 </label>
					<div class="image-preview"></div>
					<input type="file" id="image" name="image" accept="image/*" onchange="previewImage(event)">
				</div>
				
				<div class="regist" name="desc">
					<label for="description">소개글:</label><br>
					<textarea id="description" name="description" required></textarea>
				</div>
				
				<div class="regist" id="addigr">
					<div id="ingredient-container">
						<!-- 초기 재료 섹션 (3개) -->
						<div class="ingredient-section">
							<span for="ingredients">재료:</span><br>
							<div class="ingredient-row">
								<div class="custom-select">
									<input type="text" class="ingredient-input" name="ingredients[]" oninput="filterIngredients(this)" onclick="showDropdown(this)">
									<input type="text" class="amount-input" name="amounts[]" placeholder="재료 양 입력">
									<ul class="dropdown-content"></ul>
								</div>
								<div class="custom-select">
									<input type="text" class="ingredient-input" name="ingredients[]" oninput="filterIngredients(this)" onclick="showDropdown(this)">
									<input type="text" class="amount-input" name="amounts[]" placeholder="재료 양 입력">
									<ul class="dropdown-content"></ul>
								</div>
								<div class="custom-select">
									<input type="text" class="ingredient-input" name="ingredients[]" oninput="filterIngredients(this)" onclick="showDropdown(this)">
									<input type="text" class="amount-input" name="amounts[]" placeholder="재료 양 입력">
									<ul class="dropdown-content"></ul>
								</div>
							</div>
						</div>
					</div>
					<button type="button" id="delete-ingredient-button" disabled onclick="deleteIngredient()">삭제</button>
					<button type="button" id="add-ingredient-button" onclick="addIngredient()">추가</button>
				</div>
				<div class="regist" id="how">
				  <span for="instructions">조리방법:</span><br>
				  <div id="instructions-container">
				    <div class="step">
				      <textarea name="instructions[]" required></textarea>
				      <div class="image-preview"></div>
				      <input type="file" name="images[]" accept="image/*" onchange="previewImage(event)">
				    </div>
				  </div>
				  <button type="button" onclick="addStep()">추가</button>
				</div>
				<br>
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
	
	
	// 재료칸 시작 --------------------------------------------------------------------------
var originingredients = [
	  "우동면",
	  "쯔유",
	  "버터",
	  "파",
	  "쪽파",
	  "양파",
	  "간장",
	  "가나다라마바사"
	];
	
	// 재료 입력 칸과 재료 양 입력 칸에 대한 이벤트 설정
	var ingredientInputs = document.getElementsByClassName("ingredient-input");
	for (var i = 0; i < ingredientInputs.length; i++) {
	  ingredientInputs[i].addEventListener("input", function() {
	    filterIngredients(this);
	  });
	}
	
	var amountInputs = document.getElementsByClassName("amount-input");
	for (var i = 0; i < amountInputs.length; i++) {
	  amountInputs[i].addEventListener("input", function() {
	    // 재료 양 입력 처리 로직 추가 가능
	  });
	}
	
	// 재료 필터링 함수
	function filterIngredients(input) {
	  var value = input.value.toLowerCase();
	  var dropdown = input.parentNode.querySelector(".dropdown-content");
	  dropdown.innerHTML = "";
	  
	  if (value.length === 0) {
	    return;
	  }
	  
	  var matchedIngredients = originingredients.filter(function(ingredient) {
	    return ingredient.toLowerCase().includes(value);
	  });
	  
	  matchedIngredients.forEach(function(ingredient) {
	    var li = document.createElement("li");
	    li.style.listStyleType = "none";
	    li.style.display = "flex";
	    li.style.alignItems = "center";
	    li.style.marginLeft = "-30px";

	    // 이미지
	    var img = document.createElement("img");
	    img.src = "../image/difficulty.png";
	    img.alt = "difficulty";
	    img.style.height = "15px";
	    img.style.width = "15px";
	    li.appendChild(img);

	    var container = document.createElement("div");
	    container.style.marginRight = "5px";
	    li.appendChild(container);

	    // 재료 이름
	    var nameSpan = document.createElement("span");
	    nameSpan.textContent = ingredient;
	    li.appendChild(nameSpan);

	    li.onclick = function () {
	      selectIngredient(this, ingredient);
	    };

	    // 재료 이름의 길이에 따라 박스의 너비 동적으로 설정
	    var textWidth = getTextWidth(ingredient);
	    var boxWidth = textWidth + 25; // 텍스트 너비에 여백 추가
	    li.style.width = boxWidth + "px";
	    li.style.border = "1px solid black";
	    li.style.padding = "5px";
	    li.style.borderRadius = "10px";
	    
	    dropdown.appendChild(li);
	  });
	}
	
	function getTextWidth(text) {
	  var canvas = document.createElement("canvas");
	  var context = canvas.getContext("2d");
	  context.font = getComputedStyle(document.body).font;
	  var metrics = context.measureText(text);
	  return metrics.width;
	}

	function selectIngredient(element, ingredient) {
	  var input = element.parentNode.parentNode.querySelector(".ingredient-input");
	  input.value = ingredient;
	  element.parentNode.innerHTML = "";
	}
	
	// 재료 선택 함수
	function showDropdown(input) {
	  var dropdown = input.parentNode.querySelector(".dropdown-content");
	  dropdown.style.display = "block";
	}
	
	
	// 재료 추가 함수
	var ingredientContainer = document.getElementById("ingredient-container");
    var customSelects = document.getElementsByClassName("custom-select");
    var deleteButton = document.querySelector("#delete-ingredient-button");

    function addIngredient() {
	  var ingredientContainer = document.getElementById("ingredient-container");
	  
	  var ingredientSection = document.createElement("div");
	  ingredientSection.className = "ingredient-section";
	  
	  
	  var ingredientRow = document.createElement("div");
	  ingredientRow.className = "ingredient-row";
	  
	  var customSelect = document.createElement("div");
	  customSelect.className = "custom-select";
	  
	  var ingredientInput = document.createElement("input");
	  ingredientInput.type = "text";
	  ingredientInput.className = "ingredient-input";
	  ingredientInput.name = "ingredients[]";
	  ingredientInput.oninput = function() {
	    filterIngredients(this);
	  };
	  ingredientInput.onclick = function() {
	    showDropdown(this);
	  };
	  
	  var amountInput = document.createElement("input");
	  amountInput.type = "text";
	  amountInput.className = "amount-input";
	  amountInput.name = "amounts[]";
	  amountInput.placeholder = "재료 양 입력";
	  
	  var dropdown = document.createElement("ul");
	  dropdown.className = "dropdown-content";
	  
	  customSelect.appendChild(ingredientInput);
	  customSelect.appendChild(amountInput);
	  customSelect.appendChild(dropdown);
	  
	  customSelects = document.getElementsByClassName("custom-select");

	  deleteButton.disabled = false;
	  
	  ingredientRow.appendChild(customSelect);
	  
	  ingredientSection.appendChild(ingredientRow);
	  
	  ingredientContainer.appendChild(ingredientSection);
	}
	function deleteIngredient() {
		  var ingredientContainer = document.getElementById("ingredient-container");
		  var ingredientSections = document.getElementsByClassName("ingredient-section");
		  if (customSelects.length > 3) {
		    var lastIngredientSection = ingredientSections[ingredientSections.length - 1];
		    ingredientContainer.removeChild(lastIngredientSection);
		  }
		  if(customSelects.length<=3){
			  deleteButton.disabled = true;
		  }
		}

	
	// 재료칸 끝 --------------------------------------------------------------------------
	
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
