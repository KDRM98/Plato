<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="Dongmin/css/recipe.css">
<body>

<%
	String thispage = "recipe";
%>
	
	<div class="info">
		<div class="rinfo">
			<div>
				<div style="width: 500px; margin: 0 auto;">
				<span style="font-size: 40px; color: black; width:400px;">
	           		${title }
	      		</span>
	      		</div>
	      		<p style="color: purple; padding-top: 20px;">By ${nickname }</p>
	      		
		        <div class="subinfo" style="display: flex;">
		        	<div class="info_icon">
		            	<div><img alt="clock" src="../image/clock.png"></div>
		            	<div>${time }분</div>
		        	</div>
		        	<button class="like" onclick="clickLike(${postid})"">
				    	<div style="display: flex; align-items: center; justify-content: center;">
				      		<img alt="heart" src="../image/heart.png">
				      		좋아요
				      		<span id="likeCount" style="font-size:20px; padding-left: 10px;">${postlike }</span>
				    	</div>
					</button>
		        	<div class="info_icon">
					<div style="display: flex; flex-direction: column; font-size: 10px;">
					  <div class="box3" style="flex: 1; font-size: 25px;">난이도</div>
					  <div class="box3" style="flex: 2;">
						<c:forEach begin="1" end="5" var="i">
						  <c:choose>
						    <c:when test="${i <= diff}">
						      <img class="circle" alt="fullcircle" src="../image/fullcircle.png">
						    </c:when>
						    <c:otherwise>
						      <img class="circle" alt="emptycircle" src="../image/emptycircle.png">
						    </c:otherwise>
						  </c:choose>
						</c:forEach>
					  </div>
					</div>
		        	</div>
	            </div>
			</div>
		</div>
		<div class="fimg">
			<img alt="first-image" src="${mnp }">
		</div>
	</div>
	<br>
	<div class="intro" style="margin-bottom: 50px; padding-top: 30px;">
		<div class="introelement">
			<div style="margin-top: 50px; font-size: 22px; width: 800px;">
					${info }
			</div>
		</div>
			<hr>

		<div class="introelement">
			<span class="ltitle">동영상</span><br>
			<iframe style="margin-top: 50px;" width="800" height="450" src="${ytbl }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share;" allowfullscreen></iframe>
		</div>
			<hr>
		<div class="introelement">
			<span class="ltitle">재료</span>
			<div id="markets">
				<select id="market-select">
				  <option value="https://www.coupang.com/np/search?component=&q=" selected>쿠팡</option>
				  <option value="https://browse.gmarket.co.kr/search?keyword=">G마켓</option>
				  <option value="https://search.11st.co.kr/Search.tmall?kwd=">11번가</option>
				  <option value="https://www.kurly.com/search?sword=">마켓컬리(Kurly)</option>
				  <option value="https://search.shopping.naver.com/search/all?query=">네이버쇼핑</option>
				</select>
				<span style="font-size:20px; color:lightgray;">* 재료의 구매 버튼 클릭 시, 해당 사이트에서 검색합니다.</span>
			</div>
			<br>
			<div class="ingredient" style=" display: flex; flex-wrap: wrap; width: 1300px;">
				<div id="ingredient-container"></div>
			</div>
		</div>
			<hr>
		<div class="introelement">
		    <span class="ltitle">조리방법</span><br>
		    <c:forEach var="recipe" items="${recipeorderList}" varStatus="status">
		        <div class="orderlist">                
		            <div class="ordernum">${recipe}</div>
		            <div class="how">
		                <c:choose>
		                    <c:when test="${recipeinfoList[status.index] ne null}">
		                        <c:out value="${recipeinfoList[status.index]}" escapeXml="false" />
		                    </c:when>
		                    <c:otherwise>
		                        이미지가 없는 경우 대체할 문구
		                    </c:otherwise>
		                </c:choose>
		            </div>
		            <c:if test="${recipeimgList[status.index] ne null}">
		                <div class="how" style="flex:4;">
		                    <img alt="img-${status.index + 1}" src="${recipeimgList[status.index]}">
		                </div>
		            </c:if>
		        </div>
		    </c:forEach>
		</div>

</body>
<script>

var recipeorderList = [
	  <c:forEach items="${recipeorderList}" var="order" varStatus="status">
	    "${order}"${!status.last ? ',' : ''}
	  </c:forEach>
	];

	var recipeinfoList = [
	  <c:forEach items="${recipeinfoList}" var="info" varStatus="status">
	    "${info}"${!status.last ? ',' : ''}
	  </c:forEach>
	];

	var recipeimgList = [
	  <c:forEach items="${recipeimgList}" var="img" varStatus="status">
	    "${img}"${!status.last ? ',' : ''}
	  </c:forEach>
	];
	
	var likeCountElement = document.getElementById('likeCount');
	var likeCount = parseInt(likeCountElement.textContent);
	var isliked = ${isliked};
	var postlike = ${postlike};
	if(${isliked} == 0){
	    	document.querySelector(".like").style.background = "lightgray";
  	    }
  	    else{
  	    	document.querySelector(".like").style.background = "#FF5733";
  	    }
	    
	function clickLike(postid) {
		  // AJAX 요청 생성
	  var xhr = new XMLHttpRequest();
	  xhr.open('POST', '/recipeLike');
	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === XMLHttpRequest.DONE) {
	      if (xhr.status === 200) {
	        // JSON 데이터 파싱
	        var responseJson = JSON.parse(xhr.responseText);
	        var isliked = responseJson.isliked;
	        var postlike = responseJson.postlike;
	        console.log(isliked);
	        console.log(postlike);	        
	        // isliked 값에 따라 좋아요 버튼 색상 변경
	        document.querySelector(".like").style.background = isliked == 0 ? "lightgray" : "#FF5733";
	        // 좋아요 수 업데이트
	        document.getElementById('likeCount').textContent = postlike;
	      } else {
	        // 에러 처리
	      }
	    }
	  };

	  var requestData = 'postlike=' + postlike + '&isliked=' + isliked + "&postid=" + postid + "&userid=" + ${userid};
	  xhr.send(requestData);
	  // 서버로 요청 전송
	  document.getElementById("likeCount").textContent = likeCount;
	}

	
	
	
	var ingredients = [
        <c:forEach items="${ingList}" var="ingredient" varStatus="status">
            { name: "${ingredient}", quantity: "${ingamtList[status.index]}" }${!status.last ? ',' : ''}
        </c:forEach>
    ]; 
	
 
	
	  var container = document.getElementById("ingredient-container");
	  
	  for (var i = 0; i < ingredients.length; i++) {
		  var ingredient = ingredients[i];

		  // 칸과 행 계산
		  var column = Math.floor(i / 5) % 4;
		  var row = i % 5;

		  // 칸이 없을 경우 생성
		  if (!container.children[column]) {
		    var columnDiv = document.createElement("div");
		    columnDiv.className = "column";
		    container.appendChild(columnDiv);
		  }

		  // 재료 추가
		  var ingredientDiv = document.createElement("div");
		  ingredientDiv.className = "ingredientlist";
		  ingredientDiv.innerHTML =
		    `<div>` + ingredient.name + `</div>
		    <div style="margin-right: 15px;">` + ingredient.quantity + `</div>
		    <div><a class="eat" href="#" onclick="getPurchaseLink('` + ingredient.name + `')">구매</a></div>`;
		  container.children[column].appendChild(ingredientDiv);
		}

		function getPurchaseLink(ingredient) {
		  var selectedMarket = document.getElementById("market-select").value;
		  var plink = selectedMarket + encodeURIComponent(ingredient);
		  window.open(plink, "_blank");
		}
		

</script>
</html>