<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>
   
    
    <!DOCTYPE html>
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
    
            .tab-container {
    
                font-size: 12px;
            }
    
            .tab-container2 {
                padding-left: 13px;
            }
            .tab {
                padding: 20px 40px;
                border-radius: 5px 5px 2px 2px;
                border: 1px solid black;
                cursor: pointer;
                height:51px;
                vertical-align: bottom;
    
                background-color: white;
                border-bottom: none;
            }
            .tab_1 {
                padding: 20px 40px;
                border-radius: 5px 5px 0 0;
                background-color: white;
                border: 1px solid black;
                border-bottom: none; 
                cursor: pointer;
                height:51px;
                vertical-align: bottom;
               
            }
            .tab_2 {
                padding: 20px 40px;
                border-radius: 5px 5px 2px 2px;
                background-color: gray;
                border: 1px solid black;
                cursor: pointer;
                height:51px;
                vertical-align: bottom;
            }
            .tab_3 {
                margin-left:13px;
                padding: 20px 40px;
                background-color: gray;
                border: 1px solid black;
                cursor: pointer;
                height:51px;
                vertical-align: bottom;
            }
    
            .tab-content_1 {
                margin-top: 15px;
                display: none;
                padding: 20px;
                border: 1px solid black;
                border-top: none;
            }
            
            .tab-content_2 {
                margin-top: 15px;
                display: none;
                padding: 20px;
                border: 1px solid black;
                border-top: none;
            }
            
            .tab-content_3 {
                width: 910px;
                height:51px;
                margin-top: 16px;
                padding: 21px;
                border: 1px solid black;
                border-top: none;
                border-left: none;
                border-right: none;
                vertical-align: bottom;
            }
    
            .tab-content h2 {
                margin-top: 0;
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
                position: absolute;
                right: 27px;
                border: 1px solid black;
                height: 480px;
                width: 1175px;
                border-top: none;
            }
    
            .more-button {
               position: absolute;
               right :50%;
               bottom:25px;
               background-color: black;
               color: white;
               border: none;
               border-radius: 5%;
               padding: 10px 20px;
               font-size: 16px;
               margin-top: auto;
                         }
        </style>
    
        <title>Document</title>
    </head>
    
    <body>
        <div class="circle-container">
            <div class="circle">
                <div
                    style="position: absolute; top: 10%; left: 20%; transform: translate(-50%, -50%); border-radius: 50%; background-color: white; width: 60px; height: 60px;">
                    <img src="Photograph.png" height="60px" width="60px">
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"> </div>
    
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
    
        
    
        <div class="profile-button">프로필 수정</div>
    
        <div class="tab-container2">
            <button class="tab" id="btn1" onclick="openTab(event, 'tab1')">내 게시물</button><button class="tab_2" id="btn2" onclick="openTab(event, 'tab2')">내 댓글</button><button class="tab-content_3"></button>
        </div>
    
        <div class="remaining-space">
            <div class="tab-container3">
                <div id="tab1" class="tab-content">
                    <h2>Tab 1 Content</h2>
                    <div class="image-container"></div>
                </div>
                <div id="tab2" class="tab-content">
                    <h2>Tab 2 Content</h2>
                    <div class="image-container"></div>
                </div>
                <div id="tab3" class="tab-content">
                    <div class="image-container"></div>
                </div>
    
            </div>
        </div>
        </div>
           
        <button class="more-button">더보기</button>
        
        <script>
            // 탭 컨테이너들을 선택합니다.
            const tabContainers = document.querySelectorAll('.tab-content');
        
            // 모든 탭 컨테이너를 숨깁니다.
            function hideAllTabContainers() {
                tabContainers.forEach((tabContainer) => {
                    tabContainer.style.display = 'none';
                });
            }
        
            // 탭을 클릭할 때 실행되는 함수입니다.
            function openTab(event, tabId) {
                // 모든 탭 컨테이너를 숨깁니다.
                hideAllTabContainers();
        
                // 선택한 탭 컨테이너를 표시합니다.
                const selectedTabContainer = document.getElementById(tabId);
                selectedTabContainer.style.display = 'block';
        
                if (tabId === 'tab1') {
                    // tab1에 해당하는 CSS 호출
                    document.getElementById('btn2').classList.add('tab_2');
                    document.getElementById('btn2').classList.remove('tab_1');
    
                    document.getElementById('btn1').classList.add('tab');
                    document.getElementById('btn1').classList.remove('tab_2');
                   
                } else if (tabId === 'tab2') {
                    // tab2에 해당하는 CSS 호출
                    document.getElementById('btn1').classList.add('tab_2');
                    document.getElementById('btn1').classList.remove('tab');
                    document.getElementById('btn2').classList.add('tab_1');
                    document.getElementById('btn2').classList.remove('tab_2');
                    
                }
            }
        
            // 초기 설정: 첫 번째 탭을 표시합니다.
            hideAllTabContainers();
            document.getElementById('tab1').style.display = 'block';
        </script>
    </body>