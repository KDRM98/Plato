<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .circle-container {
            height: 250px;
            background-color: black;
            padding: 0;
            display: flex;
            align-items: center;
        }

        .circle {
            width: 170px;
            height: 170px;
            background-color: paleturquoise;
            border-radius: 50%;
            margin-left: 400px;
            flex-shrink: 0;
        }

        .container {
            height: 125px;
            width: 400px;
            background-color: black;
            color: #fff;
        }

        .profile-button {
            position: absolute;
            top: 270px;
            right: 27px;
            width: 140px;
            height: 40px;
            background-color: black;
            color: white;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            cursor: pointer;
        }

        .remaining-space {
            display: flex;
            flex-direction: row;
            gap: 10px;
            align-items: flex-start;
        }

        .remaining-space a {
            text-decoration: none;
            color: black;
        }

        .remaining-space a.active {
            text-decoration: underline;
        }

    </style>

    <title>Document</title>
</head>

<body>
    <div class="circle-container">
        <div class="circle">
            <div style="position: absolute; top: 10%; left: 20%; transform: translate(-50%, -50%); border-radius: 50%; background-color: white; width: 60px; height: 60px;">
                <img src="Photograph.png" height="60px" width="60px">
                <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></div>
            </div>
        </div>

        <style>  
            .circle {
                display: inline-block;
                position: relative;
            }
        </style>

        <div class="container">
            <div style="font-size:40px;">이름</div>
            <div style="font-size:15px;margin-left:10px;">@아이디</div>
            <div style="font-size:25px;margin-top:20px;margin-left:8px; ">레시피</div>
        </div>
    </div>


    <div class="remaining-space">
        <a href="#" onclick="toggleUnderline(event, this)">작성글</a>
        <br>
        <a href="#" onclick="toggleUnderline(event, this)">작성댓글</a>
        <br>
        <a href="#" onclick="toggleUnderline(event, this)">좋아요 한 글</a>
    </div>
    
    <script>
        function toggleUnderline(event, element) {
            event.preventDefault();
    
            // 모든 a 태그의 밑줄을 제거
            var aTags = document.querySelectorAll('.remaining-space a');
            for (var i = 0; i < aTags.length; i++) {
                aTags[i].style.borderBottom = "none";
            }
    
            // 선택한 a 태그에 밑줄을 추가
            element.style.borderBottom = "underline";
        }
    </script>