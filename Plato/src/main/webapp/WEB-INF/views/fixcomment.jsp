<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page language="java" %>

<body>

<div class="container">
        <img src=<%= request.getParameter("img")%> alt="Profile Picture" class="profile-picture">
        <div class="nickname"><%= request.getParameter("nickname")%></div><br>
	    <form action="submitComment.jsp" method="post">
        <textarea id="comment-box" name="comment" oninput="updateCharCount()" maxlength="3000" required><%= request.getParameter("content") %></textarea>
       	<div class="box1">
        	<div id="char-count">0/3000</div>
        	<p class="bar">|</p>
        	<button type="submit" class="btn">저장</button>
        	<button type="submit" class="btn1">취소</button>
       	</div>
    </form>

    <script>
        function updateCharCount() {
            var comment = document.getElementById("comment-box");
            var charCount = document.getElementById("char-count");
            charCount.textContent = comment.value.length + "/3000";
        }
    </script>
</div>
