<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>
    <%@ page isELIgnored="false" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
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
            top: 290px;
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
            <div style="font-size:40px;">ì´ë¦</div>
            <div style="font-size:15px;margin-left:10px;">@ìì´ë</div>
            <div style="font-size:25px;margin-top:20px;margin-left:8px; ">ë ìí¼</div>
        </div>
    </div>

    

    <div class="profile-button">íë¡í ìì </div>

    <div class="tab-container2">
        <button class="tab" id="btn1" onclick="openTab(event, 'tab1')">ë´ ê²ìë¬¼</button><button class="tab_2" id="btn2" onclick="openTab(event, 'tab2')">ë´ ëê¸</button><button class="tab-content_3"></button>
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
       
    <button class="more-button">ëë³´ê¸°</button>
    
    <script>
        // í­ ì»¨íì´ëë¤ì ì íí©ëë¤.
        const tabContainers = document.querySelectorAll('.tab-content');
    
        // ëª¨ë  í­ ì»¨íì´ëë¥¼ ì¨ê¹ëë¤.
        function hideAllTabContainers() {
            tabContainers.forEach((tabContainer) => {
                tabContainer.style.display = 'none';
            });
        }
    
        // í­ì í´ë¦­í  ë ì¤íëë í¨ììëë¤.
        function openTab(event, tabId) {
            // ëª¨ë  í­ ì»¨íì´ëë¥¼ ì¨ê¹ëë¤.
            hideAllTabContainers();
    
            // ì íí í­ ì»¨íì´ëë¥¼ íìí©ëë¤.
            const selectedTabContainer = document.getElementById(tabId);
            selectedTabContainer.style.display = 'block';
    
            if (tabId === 'tab1') {
                // tab1ì í´ë¹íë CSS í¸ì¶
                document.getElementById('btn2').classList.add('tab_2');
                document.getElementById('btn2').classList.remove('tab_1');

                document.getElementById('btn1').classList.add('tab');
                document.getElementById('btn1').classList.remove('tab_2');
               
            } else if (tabId === 'tab2') {
                // tab2ì í´ë¹íë CSS í¸ì¶
                document.getElementById('btn1').classList.add('tab_2');
                document.getElementById('btn1').classList.remove('tab');
                document.getElementById('btn2').classList.add('tab_1');
                document.getElementById('btn2').classList.remove('tab_2');
                
            }
        }
    
        // ì´ê¸° ì¤ì : ì²« ë²ì§¸ í­ì íìí©ëë¤.
        hideAllTabContainers();
        document.getElementById('tab1').style.display = 'block';
    </script>
</body>