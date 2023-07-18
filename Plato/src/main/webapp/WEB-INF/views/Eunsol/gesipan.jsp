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
<style>
/* .title, .todo {
	display: inline-block;
	border: 1px, solid black;
	width: 200px;
	height: 50px;
	vertical-align: top;
} */
</style>
<!-- css -->
<link rel="stylesheet" href="Eunsol/css/gesipan.css">
</head>
<body>
	<div class="mypage">
		<div class="mypage_container1">
			<div class="mypage_content1">



				<div class="info1">
					<img alt="프로필 이미지" src="">
				</div>
				<div class="info2">
					<div class="nckn">꾸덕한 콩물</div>

					<div class="gae">
						<div class="wrtg">
							작성글 <strong>15</strong>
						</div>
						<div class="lkdPost">
							좋아요한 글 <strong>15</strong>
						</div>
					</div>

				</div>

			</div>
		</div>

		<div class="mypage_container2">
			<div class="mypage_content2">
				<div class="tab1">
					<button class= "md">회원정보수정</button>
				</div>
				<div class="tab2">
					<div class="at1">작성글</div>
					<div class="at2">좋아요한 글</div>
				</div>
				
				<%-- <c:if test="${!empty gsp}">
				<div class="gesipan">
					<div class="article">
						<div class="tit1">제목</div>
						<div class="tit2">작성일</div>
						<div class="tit3">조회수</div>
					</div>


						<c:forEach var="item" items="${gsp}">

							<div class="gsp_content">
								<div class="tem a1">
									<input type="checkbox" class="chk">
								</div>
								<div class="tem a2">${item.postid}</div>


								<div class="tem a3">
									<a href="#"}>${item.title}</a>
								</div>

								<div class="tem a4">${item.cdate}</div>
								<div class="tem a5">${item.views}</div>

							</div>
						</c:forEach>
					</c:if>
 --%>
 <c:if test="${!empty gsp}">
				<div class="gesipan2">
					<div class="article2">
						<div class="tit1">제목</div>
						<div class="tit2">작성자</div>
						<div class="tit3">작성일</div>
						<div class="tit4">조회수</div>
					</div>


						<c:forEach var="item" items="${gsp}">

							<div class="gsp_content2">
								<div class="tem a1">
									<input type="checkbox" class="chk">
								</div>
								<div class="tem a2">${item.postid}</div>


								<div class="tem a3">
									<a href="#"}>${item.title}</a>
								</div>
								<div class="tem a4">${item.cdate}</div>
								<div class="tem a5">${item.cdate}</div>
								<div class="tem a6">${item.views}</div>

							</div>
						</c:forEach>
					</c:if>
 

					<c:if test="${empty gsp}">
						<div
							style="margin: 10px auto 20px auto; color: red; text-align: center;">
							등록된 내용이 없습니다.</div>
					</c:if>



					<%-- 페이징 시작 --%>
					<%
					//			int total2 = (int)request.getAttribute("total");
					int total = (int) request.getAttribute("total");
					/* int countPerpage = (int) request.getAttribute("countPerpage"); */
					int countPerpage = (int) request.getAttribute("countPerpage");
					//			ceil(101/10) == 11
					//			total 과 countPerpage 모두 int라서 ceil가 적용되려면 그전 계산결과를 double로 바꿔줘야 함
					double lastPage = Math.ceil((double) total / countPerpage);

					/* 	// 페이징 그룹
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
						} */
					%>



					<div class="paging">


						<%
						for (int i = 1; i <= lastPage; i++) {
						%>
						<a href="/gesipan?pageNum=<%=i%>"> <c:set var="i"
								value="<%=i%>" scope="page" /> <c:if test="${pageNum eq i}">
								<strong><div class="a"><%=i%></div></strong>
							</c:if> <c:if test="${pageNum ne i}">
								<div><%=i%></div>
							</c:if>
						</a>
						<%
						}
						%>


					</div>


					<%-- 페이징 끝 --%>


					<div class="tab3">
						<div class="tab_chk">
							<input type="checkbox" class="chk"> 전체선택
						</div>


						<div class="tab_btn">
							<button class="tab_del">삭제</button>
							<button class= "tab_write">글쓰기</button>
						</div>
					</div>

				</div>



			</div>
		</div>
	</div>










	<!-- 	<!-- js -->
	<!-- 	<script src="Eunsol/js/findid.js"></script> -->
</body>
</html>