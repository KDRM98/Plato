<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
  <title>Recipe Search</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="css/reset.css">
  <style>
    
    .search-bars-container,
    .tags-container {
      background-color: #FF5733;
    }

    .recipe-grid {
      padding-top: 30px;
      background-color: #555;
    }
    .search-bars-container {
      display: flex;
    }

    .search-container {
      display: flex;
      align-items: center;
      flex: 1;
      margin-right: 5px;
    }

    .search-input {
      width: 300px;
      padding: 10px;
      border: 1px solid #ccc;
      padding-left: 40px;
      margin: 15px 5px 15px;
    }

    .search-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      position: absolute; 
      width: 40px;
      height: 40px;
      background-color: transparent;
      border: none;
    }

    .search-icon i {
      color: #666;
      cursor: pointer;
    }

    .tags-container {
      display: flex;
      flex-wrap: wrap;
    }

    .tag {
      display: flex;
      align-items: center;
      padding: 10px;
      margin-right: 5px;
      background-color: #212121;
      color: #fff;
      margin: 5px;
      margin-bottom: 20px;
    }

    .tag-remove {
      margin-left: 5px;
      cursor: pointer;
      color: #fff;
    }

    .tag-remove:hover {
      color: red;
    }

    .tag-removed {
      text-decoration: line-through;
      color: gray;
    }


  .recipe-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }

  .recipe-card {
    width: 300px;
    flex-grow: 0;
    padding-bottom: 10px;
    margin: 10px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    position: relative;
    overflow: hidden;
  }

  @media (max-width: 1200px) {
    .recipe-card {
      width: calc(25% - 20px); 
    }
  }

  @media (max-width: 992px) {
    .recipe-card {
      width: calc(33.33% - 20px); /
    }
  }

  @media (max-width: 768px) {
    .recipe-card {
      width: calc(50% - 20px); 
    }
  }

  @media (max-width: 576px) {
    .recipe-card {
      width: 100%; 
    }
  }


    .recipe-image {
      width: 300px;
      max-height: 200px;
      object-fit: cover;
    }

    .recipe-details {
      margin-top: 10px;
      text-align: center;
    }

    .recipe-title {
      font-weight: bold;
      margin-bottom: 5px;
    }

    .ingredient-tag {
      display: inline-block;
      padding: 5px 10px;
      margin: 3px;
      background-color: #212121;
      color: #fff;
      font-size: 12px;
    }

    .recipe-card:hover {
    background-color: rgba(0, 0, 0, 0.1);
  }

  .recipe-card:hover .recipe-image {
    opacity: 0.1;
  }

  .quick-view-button {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #FF5733;
    color: #fff;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    opacity: 0;
    transition: opacity 0.3s ease;
  }

  .recipe-card:hover .quick-view-button {
    opacity: 1;
  }

  .stat_box {
  display: flex;
  align-items: center;
  background-color: #555;
  padding: 10px;
  color: #fff;
}

.sort-select-wrapper {
      margin-left: auto; 
    }

    #sort-select {
      padding: 0px 10px;
    }

  </style>
</head>
<body>
  <div class="search-bars-container">
    <div class="search-container">
      <div class="search-icon">
        <i class="fas fa-search"></i>
      </div>
      <form action="/searchhtml">
      	<input id="search-input" name="title" class="search-input" type="text" placeholder="레시피 찾기...">
      </form>
    </div>
  
    
  </div>
  
  <div class="tags-container" id="tags-container"></div>
  

  <div class="recipe-grid" id="recipes-grid"></div>

  <script>
    const searchInput = document.getElementById('search-input');
    const searchIcon = document.querySelectorAll('.search-icon');
    const recipesGridContainer = document.getElementById('recipes-grid');

    let selectedTags = [];

    // 검색 버튼
    searchIcon.forEach(icon => icon.addEventListener('click', searchRecipes));

    // 검색할떼 엔터 허용
    searchInput.addEventListener('keydown', function (event) {
      if (event.key === 'Enter') {
        searchRecipes();
      }
    });

    // 레시피 검색 엔진
    function searchRecipes() {
      const searchText = searchInput.value.toLowerCase();
      const filteredRecipes = recipesData.filter(recipe => {
        // 제목 찾기
        const titleMatch = recipe.title.toLowerCase().includes(searchText);
        
        // 테그가 있는지 체크
        const tagsMatch = selectedTags.every(tag => recipe.ingredients.includes(tag));
        
        return titleMatch && tagsMatch;
      });

      generateRecipeCards(filteredRecipes);
    }

     // 레시피 박스 템플릿
  function generateRecipeCards(recipes = recipesData) {
    recipesGridContainer.innerHTML = '';
    for (let i = 0; i < recipes.length; i++) {
      const recipe = recipes[i];

      const recipeCard = document.createElement('div');
      recipeCard.className = 'recipe-card' + (i === recipes.length - 1 ? ' recipe-card-last' : '');

      const recipeImage = document.createElement('img');
      recipeImage.className = 'recipe-image';
      recipeImage.src = recipe.image;
      recipeImage.alt = recipe.title;
      recipeCard.appendChild(recipeImage);

      const recipeDetails = document.createElement('div');
      recipeDetails.className = 'recipe-details';

      const recipeTitle = document.createElement('div');
      recipeTitle.className = 'recipe-title';
      recipeTitle.textContent = recipe.title;
      recipeDetails.appendChild(recipeTitle);

      const recipeAuthor = document.createElement('div');
      recipeAuthor.textContent = 'By ' + recipe.author;
      recipeDetails.appendChild(recipeAuthor);

      const recipeIngredients = document.createElement('div');
      recipeIngredients.className = 'recipe-ingredients';
      for (let j = 0; j < recipe.ingredients.length; j++) {
        const ingredientTag = document.createElement('span');
        ingredientTag.className = 'ingredient-tag';
        ingredientTag.textContent = recipe.ingredients[j];
        recipeIngredients.appendChild(ingredientTag);
      }
      recipeDetails.appendChild(recipeIngredients);

      recipeCard.appendChild(recipeDetails);

      const form = document.createElement('form');
      form.action = 'recipe';
      form.method = 'post';

      // Create an input element to hold the postid value
      const inputPostId = document.createElement('input');
      inputPostId.type = 'hidden';
      inputPostId.name = 'postid';
      inputPostId.value = recipe.postid; // Set the value to the postid of the current recipe
      form.appendChild(inputPostId);

      // Create the "레시피 보기" button
      const quickViewButton = document.createElement('button');
      quickViewButton.className = 'quick-view-button';
      quickViewButton.textContent = '레시피 보기';

      // Add an event listener to the button to submit the form when clicked
      quickViewButton.addEventListener('click', function () {
        form.submit();
      });

      // Append the button and form to the recipe card
      form.appendChild(quickViewButton);
      recipeCard.appendChild(form);

      recipesGridContainer.appendChild(recipeCard);
    }
  }



    // 샘플
  var recipesData = [];

  <c:forEach items="${title}" var="titleItem" varStatus="loop">
    var recipe = {
      title: "${titleItem}",
      author: "${nickname[loop.index]}",
      image: "${timg[loop.index]}",
      ingredients: [ <c:forEach items="${ing[loop.index]}" var="ingredient" varStatus="ingLoop">
                      "${ingredient}"${!ingLoop.last ? ', ' : ''}
                    </c:forEach> ],
      postid: "${postid[loop.index]}"
    };
    recipesData.push(recipe);
  </c:forEach>
  console.log(recipesData);
    generateRecipeCards();

  </script>
</body>
</html>