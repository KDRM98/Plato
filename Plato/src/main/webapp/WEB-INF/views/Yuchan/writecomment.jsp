<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page language="java" %>
<body>
<div class="title">댓글쓰기</div>

<div class="container">
	    <form action="submitComment.jsp" method="post">
        <textarea id="comment-box" name="comment" oninput="updateCharCount(event)" maxlength="3000" required></textarea>
       	<div class="box">
        	<div id="char-count">0/3000</div>
        	<p class="bar">|</p>
        	<button type="submit" class="btn">등록</button>
       	</div>
    </form>

    <script>
        function updateCharCount() {
            var comment = document.getElementById(event.target);
            var charCount = document.getElementById("char-count");
            charCount.textContent = comment.value.length + "/3000";
        }
    </script>
</div>

