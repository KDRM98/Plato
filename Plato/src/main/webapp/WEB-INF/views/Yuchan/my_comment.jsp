<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
	String leftMargin = request.getParameter("paddingLeft");
	int leftMarginValue = 0;
	if (leftMargin != null && leftMargin.matches("\\d+")) {
		leftMarginValue = Integer.parseInt(leftMargin);
	}
	int leftMultipliedMargin = leftMarginValue * 70;
%>

<body>
	<div class="comment" style="padding-left: <%= leftMultipliedMargin %>px;">
		<img src=<%= request.getParameter("img")%> alt="Profile Picture"
			class="profile-picture">
		<div class="nickname"><%= request.getParameter("nickname")%></div>
		<br>
		<div class="content"><%= request.getParameter("content")%></div>
		<div class="timestamp">
			<%
			   SimpleDateFormat formatDate = new SimpleDateFormat("yyyy.MM.dd. HH:mm");
			   String currentTimeDate = formatDate.format(new Date());
			%>
			<%= currentTimeDate %>
		</div>
		<input type="button" value="답글" class="btn">
		<%
		String serverID = request.getParameter("serverID");
		String writerID = request.getParameter("writerID");
		if(serverID != null && writerID != null && serverID.equals(writerID)){
		%>
			<div class="box1">
				<img src="image/pencil.png" alt="Edit" class="edit-picture"> <input
					type="button" value="수정" class="edit">
				<p class="bar">|</p>
				<img src="image/trashcan.png" alt="Delete" class="delete-picture">
				<input type="button" value="삭제" class="delete">
			</div>
		</div>
		<div class="fix" style="display:none;">
			<div class="container" style="padding-left: <%= leftMultipliedMargin %>px;">
				<img src=<%= request.getParameter("img")%> alt="Profile Picture"
					class="profile-picture">
				<div class="nickname"><%= request.getParameter("nickname")%></div>
				<br>
				<form action="submitComment.jsp" method="post">
					<textarea id="comment-box" name="comment" oninput="updateCharCount()"
						maxlength="3000" required><%= request.getParameter("content") %></textarea>
					<div class="box2">
						<div id="char-count">0/3000</div>
						<p class="bar">|</p>
						<button type="button" class="btn">저장</button>
						<button type="button" class="btn1">취소</button>
					</div>
				</form>
			</div>
		</div>
		<script>
			var box1 = document.querySelector('.box1');
			var comment = document.querySelector('.comment');
			var fix = document.querySelector('.fix');
			var deleteButton = box1.querySelector('.delete');
			var editButton = box1.querySelector('.edit');
			var returnButton = fix.querySelector('.btn1');
			var originalContent = box1.innerHTML;
			
			function turntoedit(){
				comment.style.display='none';
				fix.style.display='block';
				/* editButton.addEventListener('click', turntoedit); 다시 수정버튼 눌렀을때 이상생기면 여기 주석해제, 확인해보기 */
			}
			editButton.addEventListener('click', turntoedit);
			function turnfromedit(){
				comment.style.display='block';
				fix.style.display='none';
				/* returnButton.addEventListener('click', turnfromedit); */
			}
			returnButton.addEventListener('click', turnfromedit);
						
			function showConfirmation() {
			    box1.innerHTML = `
			        <img src="img/trashcan.png" alt="Delete" class="delete-picture">
			        <p class="text">진짜 삭제하시겠습니까?</p>
			        <p class="bar">|</p>
			        <input type="button" value="확인" class="confirm">
			        <input type="button" value="취소" class="return">
			    `;
			
			    var cancelButton = box1.querySelector('.return');
			    cancelButton.addEventListener('click', function() {
			        box1.innerHTML = originalContent;
			        deleteButton = box1.querySelector('.delete');
			        deleteButton.addEventListener('click', showConfirmation);
			    });
			}
			deleteButton.addEventListener('click', showConfirmation);
			function updateCharCount() {
	            var comment = document.getElementById("comment-box");
	            var charCount = document.getElementById("char-count");
	            charCount.textContent = comment.value.length + "/3000";
	        }
		</script>
		<%} else{%>
			</div>
		<%} %>

	