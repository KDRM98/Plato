<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Food Recipe Slider</title>
  <style>
    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }

    .slider-container {
      width:450px;
      height: 500px;
      position: relative;
      overflow: hidden;
      box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.2);
    }

    .slider-item {
      width: 100%;
      height: 100%;
      position: absolute;
      display: none;
      text-align: center;
    }

    .slider-item.active {
      display: block;
    }

    .slider-item .content {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100%;
    }

    .slider-item .month,
    .slider-item .recipe-title,
    .slider-item .recipe-author {
      margin-bottom: 10px;
    }

    .slider-item img {
      width: 400px;
      height: 350px;
    }

    .slider-arrow {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      width: 30px;
      height: 30px;
      color: #000;
      text-align: center;
      line-height: 30px;
      cursor: pointer;
    }

    .slider-arrow.left {
      left: 350px;
      font-size: 80px;
    }

    .slider-arrow.right {
      right: 350px;
      font-size: 80px;
    }
  </style>
</head>
<body>
  <div class="slider-container">
    <!-- Slider items -->
    <div class="slider-item active">
      <div class="content">
        <div class="month">1월</div>
        <div class="recipe-title">맛있는 식사</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 1" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">2월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 2" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">3월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 3" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">4월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 4" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">5월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 5" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">6월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 6" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">7월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 7" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">8월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 8" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">9월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 9" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">10월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 10" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">11월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 11" />
      </div>
    </div>
    <div class="slider-item">
      <div class="content">
        <div class="month">12월</div>
        <div class="recipe-title">맛있는 레시피</div>
        <div class="recipe-author">작성자: 글쓴이</div>
        <img src="img\bread.jpg" alt="Recipe 12" />
      </div>
    </div>
    <!-- Add more slider items for each month -->
  </div>

  <!-- Navigation arrows -->
  <div class="slider-arrow left" onclick="navigateSlider(-1)">&#8249;</div>
  <div class="slider-arrow right" onclick="navigateSlider(1)">&#8250;</div>

  <script>
    // JavaScript for slider functionality
    let currentSlide = 0;
    const sliderItems = document.querySelectorAll('.slider-item');

    function navigateSlider(direction) {
      currentSlide += direction;

      // Wrap around to the first or last slide if needed
      if (currentSlide < 0) {
        currentSlide = sliderItems.length - 1;
      } else if (currentSlide >= sliderItems.length) {
        currentSlide = 0;
      }

      // Toggle active class on the slides
      sliderItems.forEach((item, index) => {
        if (index === currentSlide) {
          item.classList.add('active');
        } else {
          item.classList.remove('active');
        }
      });
    }
  </script>
</body>
</html>
