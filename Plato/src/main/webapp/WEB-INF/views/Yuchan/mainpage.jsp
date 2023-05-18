<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="reset.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
<meta charset="UTF-8">
  <title>Plato</title>
 <style>
 .popularText {
	text-align: center;
	font-size: 80px;
	color: black;
	margin-top: 20px;
	font-family: 'Black Han Sans', sans-serif;
	


 </style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="searchbar.jsp" %>
	<div class="popularText">오늘의 인기 레시피</div>
	
<c:forEach var="i" begin="1" end="3" varStatus="loop">
    <jsp:include page="no1recipe.jsp" flush="false">
        <jsp:param name="number" value="${i}" />
    </jsp:include>
    <br><br>
</c:forEach>

	
	<%@ include file="footer.jsp" %>
</body>
</html>
