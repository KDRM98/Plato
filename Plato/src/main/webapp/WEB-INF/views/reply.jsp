<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
	.reply{
		display:flex;  
		border: 1px solid black;
		margin-left: 80px;
		margin-right: 80px;
		height: 250px;
        align-items: center;
	}
	.food{
		padding-left: 10px;
		width: 80%;
		height: 220px;
	}
	header{
		display: block;
	}
	.ingredient button{
		border: 0;
		outline: none;
		font-size: 15px;
		background: #81F7BE;
		color: black;
		padding: 5px 15px;
		cursor: pointer;
		border-radius: 1em;
	}
	.like img{
        width: 20px;
        height: 20px;
        vertical-align: middle;
        margin-right: 5px;
    }
    .like {
	    position: relative;
	    border: none;
	    min-width: 60px;
	    min-height: 40px;
	    background: pink;
	    border-radius: 1000px;
	    cursor: pointer;
	    font-weight: 700;
	    transition: 0.3s;
	}
	.like:hover {
    	transform: scale(1.2);
	}

	.like:hover::after{
		content: "";
	    width: 30px;
	    height: 30px;
	    border-radius: 100%;
	    border: 6px solid red;
	    position: absolute;
	    z-index: -1;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    animation: ring 0.5s infinite;
	}
	@keyframes ring {
	    0% {
	        width: 20px;
	        height: 20px;
	        opacity: 1;
	    }
	    100% {
	        width: 100px;
	        height: 100px;
	        opacity: 0;
	    }
	}
	.info{
		height: 70px;
		font-size: 30px;
		display: flex; 
		flex-direction: row; 
		align-items: center;
	}
	.circle{
		width: 20px;
		height: 20px;
	}
	
</style>
<body>
    <div class="reply" style="display:flex;  border: 1px solid black;">
        <div class="first"style="flex: 2;">
            <img class="food" src=<%= request.getParameter("img")%>>
        </div>
        <div class="second" style="flex: 4; padding-right: 10px">
           	<header style="padding-top: 10px; display: grid; grid-template-columns: 1fr auto auto; align-items: center;">
           		<a style="font-size: 30px; color: purple;">
           			<%= request.getParameter("title")%>
           		</a>
           		<button class="like">
					<img alt="heart" src="../image/heart.png">
					좋아요
           		</button>
           		<button class="like" style="margin-left:10px;">
					<img alt="fork" src="../image/fork.png">
					찜하기
           		</button>
           	</header>
           	<span style="color: purple;">작성자 : <%= request.getParameter("writer")%></span>
       		<div class="ingredient" style="display: block; padding-top: 10px;">
          		<button>우동면</button>
          		<button>명란젓</button>
          		<button>쪽파</button>
          		<button>버터</button>
   			</div>
   			<div class="intro" style="padding-top: 10px;">
   				요즘 일교차가 너무 커서 옷을 어떻게 입어야할지 모르겠어요.<br> 다음줄 <br> 소개글 받아오면 replace써서 \n을 br로 교체
   			</div>
   		</div>
        <div class="third" style="flex: 1; height:90%; border-left: 5px dotted black; display: flex; align-items: center; padding-left:5px; min-width: 170px;">
            <div>
            	<div class="info"><img alt="clock" src="../image/clock.png"> : 20분</div>
            	<div class="info"><img alt="money" src="../image/money.png"> : 12,000원</div>
            	<div class="info">
            		<img alt="difficulty" src="../image/difficulty.png">
            		<div class="container" style="display: flex; flex-direction: column; height: 30px; font-size: 10px; width: 100%; align-items: center;">
					  <div class="box" style="flex: 1; font-weight: bold;">난이도</div>
					  <div class="box" style="flex: 2;">
						  <img class="circle" alt="fullcircle" src="../image/fullcircle.png">
						  <img class="circle" alt="fullcircle" src="../image/fullcircle.png">
						  <img class="circle" alt="fullcircle" src="../image/fullcircle.png">
						  <img class="circle" alt="emptycircle" src="../image/emptycircle.png">
						  <img class="circle" alt="emptycircle" src="../image/emptycircle.png">
					  </div>
					</div>
            	</div>
            </div>
        </div>
    </div>
</body>
</html>