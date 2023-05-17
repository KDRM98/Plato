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
	<div class="comment"
		style="padding-left: <%= leftMultipliedMargin %>px;">
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

		<div class="box1">
			<img src="img/pencil.png" alt="Edit" class="edit-picture"> <input
				type="button" value="수정" class="edit">
			<p class="bar">|</p>
			<img src="img/trashcan.png" alt="Delete" class="delete-picture">
			<input type="button" value="삭제" class="delete">
		</div>

		<script>
			var box1 = document.querySelector('.box1');
			var deleteButton = box1.querySelector('.delete');
			var originalContent = box1.innerHTML;
			
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
			</script>

	</div>