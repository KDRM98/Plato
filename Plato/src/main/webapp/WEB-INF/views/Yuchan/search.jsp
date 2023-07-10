<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="css/reset.css">
  <style>
    
    .search-bars-container,
    .tags-container {
      background-color: #FF5733;
    }

    .recipe-grid {
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
      width: 100%;
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
    justify-content: center; /* Center the recipe cards */
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
    position: relative; /* Add position relative for positioning the button */
    overflow: hidden;
  }

  @media (max-width: 1200px) {
    .recipe-card {
      width: calc(25% - 20px); /* Limit to 4 cards per row */
    }
  }

  @media (max-width: 992px) {
    .recipe-card {
      width: calc(33.33% - 20px); /* Limit to 3 cards per row */
    }
  }

  @media (max-width: 768px) {
    .recipe-card {
      width: calc(50% - 20px); /* Limit to 2 cards per row */
    }
  }

  @media (max-width: 576px) {
    .recipe-card {
      width: 100%; /* Limit to 1 card per row */
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
  </style>
</head>
<body>
  <div class="search-bars-container">
    <div class="search-container">
      <div class="search-icon">
        <i class="fas fa-search"></i>
      </div>
      <input id="search-input" class="search-input" type="text" placeholder="레시피 찾기...">
    </div>
  
    <div class="search-container">
      <div class="search-icon">
        <i class="fas fa-plus"></i>
      </div>
      <input id="ingredient-include" class="search-input" type="text" placeholder="재료 추가...">
    </div>
  
    <div class="search-container">
      <div class="search-icon">
        <i class="fas fa-minus"></i>
      </div>
      <input id="ingredient-exclude" class="search-input" type="text" placeholder="재료 제외...">
    </div>
  </div>
  

  <div class="tags-container" id="tags-container"></div>

  <div class="recipe-grid" id="recipes-grid"></div>

  <script>
    const searchInput = document.getElementById('search-input');
    const searchIcon = document.querySelectorAll('.search-icon');
    const ingredientIncludeInput = document.getElementById('ingredient-include');
    const ingredientExcludeInput = document.getElementById('ingredient-exclude');
    const tagsContainer = document.getElementById('tags-container');
    const recipesGridContainer = document.getElementById('recipes-grid');

    let selectedTags = [];

    // Handle search button click event
    searchIcon.forEach(icon => icon.addEventListener('click', searchRecipes));

    // Handle Enter key press event for search input
    searchInput.addEventListener('keydown', function (event) {
      if (event.key === 'Enter') {
        searchRecipes();
      }
    });

    // Handle Enter key press event for include ingredient input
    ingredientIncludeInput.addEventListener('keydown', function (event) {
      if (event.key === 'Enter') {
        addTag(ingredientIncludeInput.value, false);
        ingredientIncludeInput.value = '';
        searchRecipes();
      }
    });

    // Handle Enter key press event for exclude ingredient input
    ingredientExcludeInput.addEventListener('keydown', function (event) {
      if (event.key === 'Enter') {
        addTag(ingredientExcludeInput.value, true);
        ingredientExcludeInput.value = '';
        searchRecipes();
      }
    });

    // Function to search recipes
    function searchRecipes() {
      const searchText = searchInput.value.toLowerCase();
      const filteredRecipes = recipesData.filter(recipe => {
        // Check if the recipe title contains the search text
        const titleMatch = recipe.title.toLowerCase().includes(searchText);
        
        // Check if any of the selected tags are present in the recipe ingredients
        const tagsMatch = selectedTags.every(tag => recipe.ingredients.includes(tag));
        
        return titleMatch && tagsMatch;
      });

      generateRecipeCards(filteredRecipes);
    }

     // Function to generate recipe cards
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

      const quickViewButton = document.createElement('button');
      quickViewButton.className = 'quick-view-button';
      quickViewButton.textContent = 'Quick View';

      recipeCard.appendChild(quickViewButton);
      recipesGridContainer.appendChild(recipeCard);
    }
  }

    // Function to add a tag
    function addTag(tagText, isRemoved) {
      const tag = document.createElement('div');
      tag.className = 'tag';
      if (isRemoved) {
        tag.classList.add('tag-removed');
      }
      tag.textContent = tagText;

      const tagRemove = document.createElement('span');
      tagRemove.className = 'tag-remove';
      tagRemove.textContent = 'x';
      tagRemove.addEventListener('click', function () {
        tag.parentNode.removeChild(tag);
        removeTag(tagText);
        searchRecipes();
      });

      tag.appendChild(tagRemove);
      tagsContainer.appendChild(tag);

      selectedTags.push(tagText);
    }

    // Function to remove a tag
    function removeTag(tagText) {
      const index = selectedTags.indexOf(tagText);
      if (index > -1) {
        selectedTags.splice(index, 1);
      }
    }

    // Sample recipe data
    const recipesData = [
      {
        title: 'Recipe 1',
        author: 'Author 1',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 1', '재료 2', '재료 3', '재료 4', '재료 5', '재료 6', '재료 7', '재료 8']
      },
      {
        title: 'Recipe 2',
        author: 'Author 2',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 4', '재료 2', '재료 5']
      },
      {
        title: 'Recipe 3',
        author: 'Author 3',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 6', '재료 1', '재료 7']
      },
      {
        title: 'Recipe 4',
        author: 'Author 4',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 8', '재료 2', '재료 9']
      },
      {
        title: 'Recipe 5',
        author: 'Author 5',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 10', '재료 11', '재료 12']
      },
      {
        title: 'Recipe 6',
        author: 'Author 6',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 13', '재료 2', '재료 14']
      },
      {
        title: 'Recipe 7',
        author: 'Author 7',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 15', '재료 16', '재료 2']
      },
      {
        title: 'Recipe 8',
        author: 'Author 8',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 17', '재료 18', '재료 19']
      },
      {
        title: 'Recipe 9',
        author: 'Author 9',
        image: 'https://via.placeholder.com/200x200',
        ingredients: ['재료 20', '재료 2', '재료 21']
      }
    ];

    // Generate initial recipe cards
    generateRecipeCards();

  </script>
</body>
</html>