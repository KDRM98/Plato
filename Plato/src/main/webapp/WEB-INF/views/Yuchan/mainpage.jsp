<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <title>My Website</title>
    <style>
        @font-face {
            font-family: 'SUITE-Regular';
            src: url('SUITE-Regular.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        body {
            font-family: 'SUITE-Regular', sans-serif;
            margin: 0;
            background-color: #fffaec;
        }

        .background {
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: url('img/mainpage-background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            height: 60vh;

        }

        .search-container {
            position: relative;
            padding: 20px 10px;
            background-color: rgba(255, 255, 255, 0.75);
            cursor: pointer;
            width: 40%;
        }

        .search-button {
            background: none;
            border: none;
        }

        .search-container:hover .search-button i {
            opacity: 1; 
        }

        .search-container .search-button i {
            opacity: 0.5;
            transition: opacity 0.3s ease;
            font-size: 24px;
        }

        .search-text {
            position: absolute;
            font-weight: bold;
            padding: 10px 20px;
            white-space: nowrap;
            font-size: 60px;
            z-index: 1;
            top: 150px;
        }

        .advanced-search-button {
            position: absolute;
            top: 320px;
            font-weight: bold;
            font-size: 16px;
            background: none;
            border: none;
            cursor: pointer;
            outline: none;
            z-index: 1;
        }

        .advanced-search-button:hover {
            text-decoration: underline;
        }

        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.75);
            z-index: 9999;
            align-items: center;
            justify-content: center;
        }

        .popup {
            background-color: transparent;
            border: transparent;
            border-bottom: 1px solid grey;
            padding: 20px;
            position: relative;
            width: 60%;
        }

        .popup input {
            background-color: transparent;
            border: transparent;
            outline: none;
            width: 100%;
            font-size: 35px;
        }

        .popup .close-button {
            position: absolute;
            top: 5px;
            right: 5px;
            background: none;
            border: none;
            cursor: pointer;
        }

        .popup .close-button i {
            color: grey;
            font-size: 16px;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .big-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            position: relative;
            width: 700px;
        }

        .big-box-text {
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 70%;
            background-color: white;
            padding: 10px;
            box-sizing: border-box;
        }

        .boxes {
            display: flex;
            justify-content: center;
            width: 700px;
        }

        .box {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 330px;
            text-align: center;
            background-color: white;
            margin-bottom: 100px;
        }

        .box img {
            width: 100%;
            height: auto;
        }

        h3, p {
            margin: 10px 0;
        }

        .image-container {
            display: flex;
            padding: 10px;
            margin-top: 100px; 
        }

        .image-container img {
            display: block;
            width: 100%;
            height: auto;
            outline: 1px solid white; 
            outline-offset: -10px;
        }

        .slider-container {
            width: 450px;
            height: 500px;
            position: relative;
            overflow: hidden;
            box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.2);
            margin: 0 auto;
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
            background-color: white;
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
            top: 1800px;
        }

        .slider-arrow.left {
            left: 350px;
            font-size: 80px;
        }

        .slider-arrow.right {
            right: 350px;
            font-size: 80px;
        }

        .partner-box {
            background-color: #fffaec;
            padding: 20px;
            text-align: center;
            margin-top: 100px;
        }

        .partner-logos {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .partner-logo1 {
            max-height: 40px;
            margin: 0 25px;
        }

        .partner-logo2 {
            max-height: 75px;
            margin: 0 25px;
        }
    </style>
</head>
<body>
    <div class="background">
        <div class="search-text">레시피 찾기</div>
        <div class="search-container" onclick="openPopup()">
            <button class="search-button">
                <i class="fas fa-search"></i>
            </button>
        </div>
        <button class="advanced-search-button">고급 검색 &gt;</button>
    </div>

    <div class="popup-overlay" id="popupOverlay">
        <div class="popup">
            <input type="text" class="search-bar" placeholder="레시피 찾기">
            <button class="close-button" onclick="closePopup()">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>

    <div class="container">
        <div class="big-box">
            <div class="image-container">
                <img src="img/bread.jpg" alt="Food 1">
            </div>
            <div class="big-box-text">
                <h3>음식 1</h3>
                <p>고유찬</p>
            </div>
        </div>
        <div class="boxes">
            <div class="box">
                <img src="img/bread.jpg" alt="Food 2">
                <h3>음식 2</h3>
                <p>고유찬</p>
            </div>
            <div class="box">
                <img src="img/bread.jpg" alt="Food 3">
                <h3>음식 3</h3>
                <p>고유찬</p>
            </div>
        </div>
    </div>

    <div class="slider-container">
        <div class="slider-item active">
            <div class="content">
                <div class="month">1월</div>
                <div class="recipe-title">맛있는 식사</div>
                <div class="recipe-author">작성자: 글쓴이</div>
                <img src="img/bread.jpg" alt="Recipe 1" />
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
          </div>  
    </div>

    <div class="slider-arrow left" onclick="navigateSlider(-1)">&#8249;</div>
    <div class="slider-arrow right" onclick="navigateSlider(1)">&#8250;</div>

    <div class="partner-box">
        <p style="text-align: center; font-weight: bold;">OUR PARTNERS</p>
        <div class="partner-logos">
            <img class="partner-logo1" src="img/coupang-bw.png" alt="Partner 1">
            <img class="partner-logo2" src="img/marketkurly-bw.png" alt="Partner 2">
        </div>
    </div>

    <script>
        function openPopup() {
            document.getElementById('popupOverlay').style.display = 'flex';
        }

        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';
        }

        let currentSlide = 0;
        const sliderItems = document.querySelectorAll('.slider-item');

        function navigateSlider(direction) {
            currentSlide += direction;

            if (currentSlide < 0) {
                currentSlide = sliderItems.length - 1;
            } else if (currentSlide >= sliderItems.length) {
                currentSlide = 0;
            }

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


