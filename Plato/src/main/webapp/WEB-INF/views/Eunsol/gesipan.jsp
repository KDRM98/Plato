<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/findid.css">
</head>
<body>
	<div>
			<input type="checkbox" class="chk" >				
			<div class="tittle">번호</div>
			<div class="tittle">제목</div>
			<div class="tittle">작성일</div>
			<div class="tittle">조회</div>
		</div>


	<c:if test="${!empty gsp}">
		<c:forEach var="item" items="${gsp}">
		
			<div>
				<div class="todo">
					<input type="checkbox" class="chk" value="${item.todo_id}">
				</div>
				<div class="todo">${item.postid} </div>
				<div class="todo"><a href="#"}>${item.title}</a></div>
				<div class="todo">${item.cdate }</div>
				<div class="todo">${item.views }</div>

			</div>
		</c:forEach>
</c:if>
<c:if test="${empty list }">
<div style="margin: 10px auto 20px auto  ; color: red; text-align: center;"> 등록된 내용이 없습니다.</div>
</c:if>



<%-- 페이징 시작 --%>
<%-- 		<%
//			int total2 = (int)request.getAttribute("total");
			int total= (int) request.getAttribute("total");
			int countPerpage = (int) request.getAttribute("countPerpage");
//			ceil(101/10) == 11
//			total 과 countPerpage 모두 int라서 ceil가 적용되려면 그전 계산결과를 double로 바꿔줘야 함
			double lastPage = Math.ceil((double)total/countPerpage); 

			// 페이징 그룹
			// 한 그룹당 보여줄 수
			int groupCount =3;
			// 현재 페이지
			int pageNum = (int) request.getAttribute("pageNum");
			// 현재 속한 그룹
			double group = Math.floor((((double)pageNum-1)/ groupCount) + 1);
			// 그룹의 시작 페이지, 끝 페이지
			int end = (int) group*groupCount;
			if(end > lastPage){
				end= (int)lastPage;
			}
			int begin = end - (groupCount-1);
			if(begin < 1){
				begin = 1;
				end = groupCount;
			}
			%> --%>
			
			
<%--	total2 : <%= total2 %> <br>
		<c:set var="total3" value="<%= total2 %>" scope="page" />
		total3: ${total3}<br>
 --%>	
		
<%-- 	<div style="width: 200px; margin: 0 auto;">
	
	<% if(begin > 1){%>
	<a href="/list.do?pageNum=<%=begin-1%>">이전</a>
	<% } %>
	
	<%
	for(int i=begin; i<=end; i++){	
	%>
	<a href="/list.do?pageNum=<%=i%>">
	<c:set var="i" value="<%= i%>" scope="page" />
	<c:if test="${pageNum eq i}"><strong><%=i%></strong>
	</c:if>
	<c:if test="${pageNum ne i}"><%=i%>
	</c:if>
	</a>
	<% } %>
	
	<% if(end != lastPage){ %>
	<a href="/list.do?pageNum=<%=end+1%>">다음</a>
	<% } %>

	</div>
 --%>
<%-- 페이징 끝 --%>




	<!-- js -->
		<script src="Eunsol/js/findid.js"></script>
</body>
</html>