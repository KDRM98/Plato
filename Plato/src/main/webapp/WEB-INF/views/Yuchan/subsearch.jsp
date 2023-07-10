<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
        body {
            background-color: black;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
    
        .container {
            display: flex;
            align-items: center;
        }
    
        .food-image {
            width: 50%;
            background-size: cover;
            background-position: center;
        }
    
        .content {
            width: 50%;
            padding: 20px;
        }
    
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
    
        .author {
            font-size: 14px;
            font-style: italic;
            margin-bottom: 10px;
        }
    
        hr {
            border: none;
            border-top: 1px solid white;
            margin-bottom: 20px;
        }
    
        .title-ingredient-box {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }
    
        .ingredient-box {
            flex: 1;
        }
    
        .introduction-box {
            flex: 1;
            margin-left: 20px;
        }

        .ingredient {
            margin-bottom: 20px;
        }
    
        .ingredient,
        .introduction {
            font-weight: bold;
        }
    
        .tags {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            text-align: center;
        }
    
        .tags span {
            display: inline-block;
            width: 70px;
            padding: 7px 5px;
            margin: 5px 5px;
            background-color: white;
            font-size: 10px;
            color: black;
        }
    
        .intro-text {
            margin-bottom: 20px;
        }
    
        .number, .after-number, .bar {
            display: flex;
            align-items: center;
        }

        .number {
            font-size: 20px;
            font-weight: bold;
        }

        .bar {
            font-size: 20px;
            margin-left: 10px;
            margin-right: 10px;
        }

        .after-number {
            font-size: 1px;
            font-weight: bold;
        }
    
        .info_icon {
            margin-right: 20px;
            font-size: 14px;
        }
    
        .box3 {
            display: inline-block;
            margin-bottom: 5px;
        }
    
        .circle {
            width: 10px;
            height: 10px;
            margin-right: 2px;
        }
    
        .see-recipe {
            background-color: orange;
            padding: 10px 20px;
            border: transparent;
            text-decoration: none;
            color: white;
            font-weight: bold;
            margin-top: 10px;
        }

        .see-recipe:hover {
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
    
    
</head>
<body>
    <div class="container">
        <img src="food1.png" class="food-image"></img>
        <div class="content">
            <span class="title">명란버터우동</span>
            <span class="author">작성자: 고유찬</span>
            <hr>
            <div class="title-ingredient-box">
                <div class="ingredient-box">
                    <span class="ingredient">재료</span>
                        <div class="tags">
                            <span>재료 1</span>
                            <span>재료 2</span>
                            <span>재료 3</span>
                            <span>재료 4</span>
                            <span>재료 5</span>
                            <span>재료 6</span>
                            <span>재료 7</span>
                            <span>재료 8</span>
                            <span>재료 9</span>
                            <span>재료 10</span>
                    </div>
                </div>
                <div class="introduction-box">
                    <span class="introduction">소개</span>
                    <p class="intro-text">
                        요즘 일교차가 너무 커서 옷을 어떻게 입어야할지 모르겠어요.
                        따뜻한메뉴를 먹기엔 덥고, 차가운 메뉴를 먹자니 춥고!
                        입맛도 돌게하고 뜨겁지도 차갑지도 않은 적당한메뉴를 찾다가 만들어본 명란버터우동!
                        쫄깃쫄깃 우동 안좋아하시는 분들 없으시죠?!
                    </p>
                </div>
            </div>
            <div class="subinfo" style="display: flex;">
                <div class="number">20</div>
                <div class="after-number">분</div>
                <div class="bar">|</div>
                <div class="number">12,000</div>
                <div class="after-number">원</div>
                <div class="bar">|</div>
                <div class="info_icon">
                <div style="display: flex; flex-direction: column; font-size: 10px;">
                  <div class="box3" style="flex: 1; font-weight: bold;">난이도</div>
                  <div class="box3" style="flex: 2;">
                      <img class="circle" alt="fullcircle" src="fullcircle.png">
                      <img class="circle" alt="fullcircle" src="fullcircle.png">
                      <img class="circle" alt="fullcircle" src="fullcircle.png">
                      <img class="circle" alt="emptycircle" src="emptycircle.png">
                      <img class="circle" alt="emptycircle" src="emptycircle.png">
                  </div>
                </div>
                </div>
            </div>
            <button class="see-recipe">레시피 보기</button>
        </div>
     </div>
</body>
</html>