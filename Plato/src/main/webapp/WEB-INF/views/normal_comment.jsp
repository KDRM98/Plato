<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
  String paddingLeft = request.getParameter("paddingLeft");
  int paddingLeftValue = 0;
  if (paddingLeft != null && paddingLeft.matches("\\d+")) {
    paddingLeftValue = Integer.parseInt(paddingLeft);
  }
  int multipliedPaddingLeft = paddingLeftValue * 70;
%>

<body>
    <div class="comment" style="padding-left: <%= multipliedPaddingLeft %>px;">
        <img src= <%= request.getParameter("img")%> alt="Profile Picture" class="profile-picture">
        <div class="nickname"><%= request.getParameter("nickname")%></div><br>
        <div class="content"><%= request.getParameter("content")%></div>
        <div class="timestamp">
			<%
			   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd. HH:mm");
			   String currentDateTime = dateFormat.format(new Date());
			%>
			<%= currentDateTime %>
        </div>
        <input type="button" value="답글" class="btn">
    </div>

