<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <title>Document</title>
    <style>
        @font-face {
            font-family: 'SUITE-Regular';
            src: url('SUITE-Regular.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        .background {
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: url('img/mainpage-background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            width: 100%;
            height: 60vh;
        }

        body {
            font-family: 'SUITE-Regular', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
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
            left: 50%;
            transform: translateX(-50%);
            font-weight: bold;
            padding: 10px 20px;
            white-space: nowrap;
        }

        @media screen and (min-width: 500px) {
            .search-text {
                font-size: 24px;
                top: -40px;
            }
        }

        @media screen and (min-width: 768px) {
            .search-text {
                font-size: 40px;
                top: -60px;
            }
        }

        @media screen and (min-width: 1200px) {
            .search-text {
                font-size: 60px;
                top: -80px;
            }
        }

        .advanced-search-button {
            position: absolute;
            bottom: -30px;
            left: 50%;
            transform: translateX(-50%);
            font-weight: bold;
            font-size: 16px;
            background: none;
            border: none;
            cursor: pointer;
            outline: none;
        }

        .advanced-search-button:hover {
            text-decoration: underline;
        }

        /* Popup styles */
        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.75);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
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
    </style>
</head>
<body>
  <div class="background">
    <div class="search-container" onclick="openPopup()">
        <div class="search-text">레시피 찾기</div>
        <button class="search-button">
          <i class="fas fa-search"></i>
        </button>
        <button class="advanced-search-button">고급 검색 &gt;</button>
    </div>

    <div class="popup-overlay" id="popupOverlay" style="display: none;">
        <div class="popup">
            <input type="text" class="search-bar" placeholder="레시피 찾기">
            <button class="close-button" onclick="closePopup()">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>
  </div>

    <script>
        function openPopup() {
            document.getElementById('popupOverlay').style.display = 'flex';
        }

        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';
        }
    </script>
</body>
</html>
