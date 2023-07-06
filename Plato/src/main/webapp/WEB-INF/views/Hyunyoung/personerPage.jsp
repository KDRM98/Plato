<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .container1 {
            width: 100%;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .circle {
            width: 100px;
            height: 100px;
            background-color: paleturquoise;
            border-radius: 50%;
        }

        .container6 {
            display: flex;
            justify-content: center;
        }

        .button-wrapper {
            display: flex;
        }

        button {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px 10px;
            border: none;
            background-color: transparent;
            font-size: 16px;
            color: #000;
            cursor: pointer;
        }

        .arrow {
            margin: 0 5px;
        }
    </style>
</head>
<body>
    <div class="container1">
        <div class="circle"></div>
    </div>

    <%
        String[] imagePaths = {"your-image-file-path-2.jpg", "your-image-file-path-3.jpg", "your-image-file-path-4.jpg", "your-image-file-path-5.jpg"};
        for (int i = 2; i <= 5; i++) {
    %>
        <div class="container<%= i %>" style="height: 150px; width: 100%; border: 1px solid black;">
            <img src="<%= imagePaths[i-2] %>" alt="Image <%= i %>">
        </div>
    <%
        }
    %>

    <div class="container6">
        <div class="button-wrapper">
            <button><span class="arrow">&lt;</span>1</button>
            <button>2<span class="arrow"></span></button>
            <button><span class="arrow">3&gt;</span></button>
        </div>
    </div>
</body>
</html>